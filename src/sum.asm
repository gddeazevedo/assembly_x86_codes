section .data
    a: dd 10 ; define double (32 bits)
    b: dd 40
    format: db "A soma é %d", 0xa, 0

section .text
    extern printf
    global main

main:
    mov eax, dword [a] ; eax = a
    add eax, dword [b] ; eax = eax + b
    push eax
    push format
    call printf
    add esp, 8 ; voltando com o ponteiro da pilha para o início dela
    ret