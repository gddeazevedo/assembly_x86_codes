section .data
    msg: db "Hello, World", 0xa, 0

section .text
    extern printf
    global main

main:
    push msg
    call printf
    add esp, 4
    ret