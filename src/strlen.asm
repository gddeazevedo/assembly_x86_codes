section .data
    string: db "Hello, World", 0
    format: db "%d", 0xa, 0

section .text
    extern printf
    global main

strlen:
    mov esi, 0
    mov ebx, dword [esp + 4]

    FOR:
        cmp byte [ebx + esi], 0
        je END
        inc esi
        jmp FOR
    END:

    mov eax, esi
    ret

main:
    push string
    call strlen
    add esp, 4
    push eax
    push format
    call printf
    add esp, 8
    ret
