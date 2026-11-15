section .text
global sort
global get_words
extern qsort
extern strlen
extern strcmp

;; sort(char **words, int number_of_words, int size)
;  functia va trebui sa apeleze qsort pentru soratrea cuvintelor 
;  dupa lungime si apoi lexicografix
sort:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax
    push comparator_sort
    ; dimensiunea unui element din vector = 4 bytes
    push dword [ebp+16]
    ;; al doilea argument
    push dword [ebp+12]
    ;; primul argument
    push dword [ebp+8]
    ;; apelam qsort
    call qsort
    ;; curatam stiva
    add esp, 16
    leave
    ret
;; comparator_sort(const void *a, const void *b)
comparator_sort:
    ;; salvam vechiul ebp
    push ebp
    mov ebp, esp
    ;; salvam registrii
    push esi
    push edi
    push ebx
    ;; a = *(char **)a
    mov esi, [ebp+8]
    mov esi, [esi]
    ;; b = *(char **)b
    mov edi, [ebp+12]
    mov edi, [edi]
    ;; calculam strlen(a)
    push esi
    call strlen
    ;; eliberam un argument de pe stiva
    add esp, 4
    mov ebx, eax
    ;; calculam strlen(b)
    push edi
    call strlen
    ;; eliberam un argument de pe stiva
    add esp, 4
    mov edx, eax
    ;; comparam lungimile
    cmp ebx, edx
    jl .return_less
    ;; daca a > b => 1
    jg .return_greater
    ;; lungimile sunt egale —> comparam lexicografic cu strcmp
    push edi
    push esi
    call strcmp
    ;; eliberam cele 2 argumente
    add esp, 8
    jmp .done
.return_less:
    ; returnam -1
    mov eax, -1
    jmp .done
.return_greater:
    ; returnam 1
    mov eax, 1
.done:
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret

;; get_words(char *s, char **words, int number_of_words)
;  separa stringul s in cuvinte si salveaza cuvintele in words
;  number_of_words reprezinta numarul de cuvinte
get_words:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax
    ;; esi = s
    mov esi, [ebp+8]
    ;; vectorul de cuvinte
    mov edi, [ebp+12]
    xor ebx, ebx
.next_char:
    ;; al = caracterul curent
    mov al, [esi]
    ;; daca e NULL iesim
    cmp al, 0
    je .done
    ;; daca e spațiu, sarim peste delimitator
    cmp al, ' '
    je .skip_delim
    ;; daca e virgula, sarim
    cmp al, ','
    je .skip_delim
    ;; daca e punct, sarim
    cmp al, '.'
    je .skip_delim
    ;; daca e newline (ASCII 10), sarim
    cmp al, 10
    je .skip_delim
    ;; salvam pointerul in vector
    mov [edi + ebx*4], esi
    inc ebx
.word_loop:
    ;; al = caracterul curent
    mov al, [esi]
    ;; daca e NULL, final
    cmp al, 0
    je .done
    ;; daca e delimitator, final de cuvant
    cmp al, ' '
    je .terminate
    cmp al, ','
    je .terminate
    cmp al, '.'
    je .terminate
    ;; daca e new line (ASCII 10)
    cmp al, 10
    je .terminate
    inc esi
    jmp .word_loop
.terminate:
    ;; punem NULL pentru a termina stringul curent
    mov byte [esi], 0
    inc esi
    jmp .next_char
.skip_delim:
    ;; trecem la urmatorul caracter
    inc esi
    jmp .next_char
.done:
    leave
    ret