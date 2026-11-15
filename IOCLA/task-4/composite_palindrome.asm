section .text
global check_palindrome
global composite_palindrome
extern malloc
extern strlen
extern strcmp
extern strcat
extern strcpy

check_palindrome:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax
    push ebx
    push esi
    push edi
    ; adresa sirului
    mov esi, [ebp + 8]
    ; lungimea sirului
    mov ecx, [ebp + 12]
    ; verificam daca lungimea este 0 sau 1
    cmp ecx, 1
    jle is_palindrome
    xor eax, eax
    mov edx, ecx
    dec edx
check_loop:
    cmp eax, edx
    jge is_palindrome
    ; comparam caracterele de la pozitiile i si j
    mov bl, [esi + eax]
    mov bh, [esi + edx]
    cmp bl, bh
    jne not_palindrome
    ; incrementam i, decrementam j
    inc eax
    dec edx
    jmp check_loop
is_palindrome:
    ; intoarcem 1 daca e palindrom
    mov eax, 1
    jmp end_check
not_palindrome:
    xor eax, eax
end_check:
    pop edi
    pop esi
    pop ebx
    leave
    ret
composite_palindrome:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax
    leave
    ret

