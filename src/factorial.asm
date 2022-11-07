section .data
    msg: db "%d! = %d", 0xa, 0
    input_msg: db "Digite um número: ", 0
    s_format: db "%d", 0

section .bss
    number: resd 1

section .text
    extern scanf
    extern printf
    global main

main:
    push input_msg
    call printf
    add esp, 4

    push number
    push s_format
    call scanf
    add esp, 8

    mov ecx, dword [number]
    mov ebx, 1
    mov eax, 1

    FOR:
        cmp ebx, ecx
        jg END
        mul ebx
        inc ebx
        jmp FOR
    END:

    push eax
    push ecx
    push msg
    call printf

    add esp, 8

    ret
