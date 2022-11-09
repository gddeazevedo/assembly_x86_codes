section .data
    string: db "Hello, World", 0
    char: db 'H', 0

section .text
    extern printf
    global main

strfind:
    mov rcx, 0
    WHILE:
        cmp byte [rdi + rcx], 0
        je END
        cmp byte [rdi + rcx], sil
        jne ENDIF
        mov rax, rcx
        ret
        ENDIF:
        inc rcx
        jmp WHILE
    END:

    mov rax, -1
    ret

main:
    mov rdi, string
    mov sil, byte [char]

    call strfind

    mov esi, eax
    mov rax, 0
    call printf
