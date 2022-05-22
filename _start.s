section .text
	global	_start
	extern	main

_start:
	xor	ebp,ebp		;Zerar o ebp
	pop	esi		;Colocar o argc em esi
	mov	ecx, esp	;Colocar o argv em ecx
	push	ecx		;Colocar na pilha ambos
	push	esi
	call	main		;Chamar a função main
	mov	eax, 1		;sys_exit
	int	0x80		;Chamar kernell
