section .text
global sort

;   struct node {
;    int val;
;    struct node* next;
;   };

;; struct node* sort(int n, struct node* node);
;   The function will link the nodes in the array
;   in ascending order and will return the address
;   of the new found head of the list
; @params:
;   n -> the number of nodes in the array
;   node -> a pointer to the beginning in the array
;   @returns:
;   the address of the head of the sorted list
sort:
    ; create a new stack frame    
    enter 0, 0
    xor eax, eax
    ; salvam registrele care vor fi folosite
    push ebx
    push esi
    push edi
    ; n este in [ebp+8]
    mov ecx, [ebp+8]
    ; pointer ul la vector este in [ebp+12]
    mov edx, [ebp+12]
    ; verificam cand avem doar un nod
    cmp ecx, 1
    jne sort_begin
    ; returnam adresa lui
    mov eax, edx
    jmp sort_end
sort_begin:
    xor eax, eax
    ; esi va fi valoarea curenta cautata
    mov esi, 1
find_next_value:
    ; cautam nodul cu valoarea esi
    ; ebx = n, contor pentru parcurgere
    mov ebx, [ebp+8]
    ; edi = pointer la inceputul vectorului
    mov edi, [ebp+12]
find_node_loop:
    ; verificam daca nodul curent are valoarea cautata
    cmp dword [edi], esi
    je node_found
    ; trecem la urmatorul nod din vector, dimensiunea unei structuri node: 8 bytes
    add edi, 8
    dec ebx
    jnz find_node_loop
    jmp sort_end
node_found:
    ; am gasit nodul cu valoarea esi si il adaugam in lista sortata
    mov [edi+4], eax
    mov eax, edi
    inc esi
    cmp esi, ecx
    jle find_next_value
    ; trebuie sa inversam lista pentru a avea nodurile in ordine crescatoare
    xor ebx, ebx
reverse_list:
    ; edi = nodul curent
    mov edi, eax
    ; eax = urmatorul nod
    mov eax, [edi+4]
    ; urmatorul nod devine ebx
    mov [edi+4], ebx
    mov ebx, edi
    ; verificam daca am ajuns la sfarsitul listei
    test eax, eax
    jnz reverse_list
    mov eax, ebx
sort_end:
    ; Restabilim registrele salvate
    pop edi
    pop esi
    pop ebx
    leave
    ret

