section .text
	global is_prime

is_prime:
	push	ebp
	mov	ebp, esp

	mov	DWORD [ebp-4], 2	;Variavel que recebe 2

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



	;edx recebe n/2
	mov	edx, DWORD [ebp+8]
	mov	DWORD [ebp-8], edx
	shr	edx, 1

.LoopCompara:
	cmp	DWORD [ebp-8], ecx	;Se n/2 for menor que ecx
	jle	.Primo

	;Verifica se n é divisivel por ecx
	mov 	eax, DWORD [ebp+8]
	xor 	edx, edx	;Zera edx
	div	ecx
	cmp	edx, 0		;compara se o resto da divisao de n por ecx é zero
	je	.NPrimo

	add	ecx, 2		;ecx aumenta em 2

	mov 	eax, DWORD [ebp+8]
	xor 	edx, edx	;Zera edx
	div	ecx
	cmp	edx, 0		;compara se o resto da divisao de n por ecx é zero
	je	.NPrimo

	add	ecx, 4		;ecx aumenta em 4
	jmp	.LoopCompara

;Caso nao seja primo, eax recebe 0 e retorna 0
.NPrimo:
	xor	eax, eax
	pop	ebp
	ret

;Caso seja primo eax recebe 1 e retorna 1
.Primo:
	mov	eax, 1
	pop	ebp
	ret
