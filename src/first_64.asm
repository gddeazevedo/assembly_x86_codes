section .data
    format: db "%d", 0xa, 0

section .text
    extern printf
    global main

main:
    mov rax, 0
    mov rdi, format
    mov rsi, 1000
    call printf