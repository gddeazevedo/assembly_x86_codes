section .data
	numbers: dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	format: db "%d", 0xa, 0

section .text
	extern printf
	global main

main:
	mov esi, 0
	mov eax, numbers

	WHILE:
		cmp esi, 10
		jnl END
		mov ebx, dword [eax + 4 * esi]
		pusha
		push ebx
		push format
		call printf
		add esp, 8
		popa
		inc esi
		jmp WHILE
	END:
	ret
