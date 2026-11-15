section .text
global kfib

kfib:
    ; create a new stack frame
    enter 0, 0
    xor eax, eax
    ; ecx = n
    mov ecx, [ebp+8]
    ; edx = K
    mov edx, [ebp+12]
    cmp ecx, edx
    jl .return
    je .return_one
    ; alocam spatiu pe stiva pentru: suma si i
    sub esp, 8
    ; i = 1
    mov dword [esp], 1
    ; suma = 0
    mov dword [esp+4], 0
.loop:
    ; eax = i
    mov eax, [esp]
    cmp eax, edx
    jg .done_loop
    ; ecx = n
    mov ecx, [ebp+8]
    ; ecx = n - i
    sub ecx, eax
    ; push K
    push dword [ebp+12]
    ; push n - i
    push ecx
    call kfib
    ; curatam parametrii
    add esp, 8
    ; suma = suma + eax
    mov ecx, [esp+4]
    add ecx, eax
    ; punem rezultatul in [esp + 4]
    mov [esp+4], ecx
    ; i++
    inc dword [esp]
    jmp .loop
.done_loop:
    ; eax = suma
    mov eax, [esp+4]
    ; eliberam suma si i
    add esp, 8
    jmp .return
.return_one:
    ; returnam 1
    mov eax, 1
.return:
    leave
    ret
