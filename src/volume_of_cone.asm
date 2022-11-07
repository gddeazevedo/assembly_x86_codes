section .data
    msg: db "O volume do cone é: %lf", 0xa, 0
    volume: dq 0.
    ray: dd 5
    height: dd 10

section .text
    extern printf
    global main

main:
    fldpi ; pi
    fild dword [ray] ; ray, pi
    fmul st0 ; ray * ray, pi
    fmulp st1 ; ray * ray * pi
    fild dword [height] ; height, ray * ray * pi
    fmulp st1 ; height * ray * ray * pi
    fld1 ; 1, height * ray * ray * pi
    fadd st0 ; 2, height * ray * ray * pi
    fld1 ; 1, 2, height * ray * ray * pi
    faddp st1 ; 3, height * ray * ray * pi
    fdivp st1 ; height * ray * ray * pi / 3
    fstp qword [volume]
    push dword [volume + 4]
    push dword [volume]
    push msg
    call printf
    add esp, 12
    ret
