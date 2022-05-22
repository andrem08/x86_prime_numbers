SECTION .DATA
	enter:	db '', 0xa
SECTION .TEXT
	GLOBAL print_asm
print_asm:

	push ebp	;Coloca ebp na pilha
	mov ebp, esp	;Iguala ebp com esp
	mov [ebp-8], ebx	;Armazena ebx
	mov ecx, DWORD [ebp+12]	;Coloca a string em ecx
	mov edx, DWORD [ebp+8]	;Tamanho da string
	mov ebx, 1	;stdout
	mov eax, 4	;sys_write
	int 0x80	;Chamar kernel

	mov ecx, enter		;Realizar a quebra de linha
	mov edx, 1
	mov ebx, 1		;stdout
	mov eax, 4		;sys_write
	int 0x80		;Chamar kernel
	mov ebx, [ebp-8]	;Ebx volta com seu valor inicial

	mov esp, ebp
	pop ebp
	ret
