section .data
    format: db "%d", 0xa, 0

section .text
    global main
    extern printf

main:
    mov rax, 0
    mov rdi, format
    mov rsi, 1000
    call printf