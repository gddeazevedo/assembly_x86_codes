section .data
    scanf_format: db "%d", 0
    printf_format: db "O maior número é: %d", 0xa, 0

section .bss
    a: resd 1
    b: resd 1
    c: resd 1

section .text
    extern printf
    extern scanf
    global main

main:
    push a
    push scanf_format
    call scanf
    add esp, 8

    push b
    push scanf_format
    call scanf
    add esp, 8

    push c
    push scanf_format
    call scanf
    add esp, 8

    mov eax, dword [a]

    IF:
        cmp eax, dword [b]
        jg ELSE
        mov eax, dword [b]
    ELSE:
        cmp eax, dword [c]
        jg END
        mov eax, dword [c]
    END:

    push eax
    push printf_format
    call printf
    add esp, 8
    ret
