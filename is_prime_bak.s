section .text
	global is_prime

is_prime:
	push	ebp
	mov	ebp, esp

	mov	DWORD [ebp-4], 2	;Variavel que recebe 2
	mov	edx, DWORD [ebp+8]
	mov	DWORD [ebp-8], edx	;Variavel que recebe n/2
	shr	DWORD [ebp-8], 1

	cmp	DWORD [ebp+8], 1	;Se for menor ou igual a 1, nao eh primo
	jle	.NPrimo
	cmp	DWORD [ebp+8], 3	;Se for 2 ou 3, eh primo
	jle	.Primo


	;Verifica se eh divisivel por 2
	mov	eax, DWORD [ebp+8]	;Valor de n
	xor	edx, edx		;zera valor de edx
	mov	ecx, DWORD [ebp-4]	;Coloca o valor do divisor
	div	ecx			;Divide n por 2
	cmp	edx, 0			;Compara se o resto for zero
	je	.NPrimo

	;Verifica se eh divisivel por 3
	mov	eax, DWORD [ebp+8]
	xor	edx, edx
	inc	ecx
	div	ecx			;Divide n por 3
	cmp	edx, 0
	je	.NPrimo

	add	ecx, 2


.LoopHead:
	cmp	DWORD [ebp-8], ecx	;Se ecx eh menor ou igual que n/2
	jle	.Primo

	mov 	eax, DWORD [ebp+8]
	xor 	edx, edx
	div	ecx
	cmp	edx, 0
	je	.NPrimo

	add	ecx, 2

	cmp	DWORD [ebp-8], ecx
	jle	.Primo

	mov 	eax, DWORD [ebp+8]
	xor 	edx, edx
	div	ecx
	cmp	edx, 0
	je	.NPrimo

	add	ecx, 4
	jmp	.LoopHead


.NPrimo:
	xor	eax, eax
	pop	ebp
	ret
.Primo:
	mov	eax, 1
	pop	ebp
	ret
