section .data
    msg: db "O volume do cone é: %lf", 0xa, 0
    ray: dd 5
    volume: dq 0.

section .text
    extern printf
    global main

main:
    fldpi ; pi
    fild dword [ray] ; ray, pi
    fmul st0         ; ray * ray, pi
    fild dword [ray] ; ray, ray * ray, pi
    fmulp st1        ; ray * ray * ray, pi
    fmulp st1        ; ray * ray * ray * pi
    fld1             ; 1, ray * ray * ray * pi
    fadd st0         ; 2, ray * ray * ray * pi
    fld1             ; 1, 2, ray * ray * ray * pi
    faddp st1        ; 3, ray * ray * ray * pi
    fdivp st1        ; ray * ray * ray * pi / 3
    fld1             ; 1, ray * ray * ray * pi / 3
    fadd st0         ; 2, ray * ray * ray * pi / 3
    fadd st0         ; 4, ray * ray * ray * pi / 3
    fmulp st1        ; 4, ray * ray * ray * pi / 3
    fstp qword [volume]
    push dword [volume + 4]
    push dword [volume]
    push msg
    call printf
    add esp, 12
    ret
