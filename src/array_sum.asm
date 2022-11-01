section .data
    arr1: dd 1, 2, 3, 4, 5, 6, 7, 8
    arr2: dd 8, 7, 6, 5, 4, 3, 2, 1
    format: db "%d", 0xa, 0

section .bss
    arr: resd 8

section .text
    extern printf
    global main

sum_arrays:
    mov esi, 0
    mov ebx, arr1
    mov ecx, arr2
    mov edx, arr

    FOR_1:
        cmp esi, 8
        jnl ENDFOR_1
        mov eax, dword [ebx + 4 * esi] ; eax = arr1[esi]
        add eax, dword [ecx + 4 * esi] ; eax = eax + arr2[esi]
        mov dword [edx + 4 * esi], eax ; arr[esi] = eax
        inc esi
        jmp FOR_1
    ENDFOR_1:
    ret

main:
    call sum_arrays
    mov esi, 0
    FOR_2:
        cmp esi, 8
        jnl ENDFOR_2
        pusha
        push dword [edx + 4 * esi] ; push arr[esi]
        push format
        call printf
        add esp, 8
        popa
        inc esi
        jmp FOR_2
    ENDFOR_2:
    ret
