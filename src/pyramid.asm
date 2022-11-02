section .data
    char: db "*", 0
    break_line: db 0xa, 0

section .text
    extern printf
    global main

print_pyramid:
    mov ecx, dword [esp + 4]
    mov eax, 1
    WHILE:
        cmp eax, ecx
        jg END
        pusha
        push char
        call printf
        add esp, 4
        popa
        inc eax
        jmp WHILE
    END:
    pusha
    push break_line
    call printf
    add esp, 4
    popa
    ret

main:
    mov eax, 1
    WHILE2:
        cmp eax, 50
        jg END2
        push eax
        call print_pyramid
        add esp, 4
        jmp WHILE2
    END2:
    ret