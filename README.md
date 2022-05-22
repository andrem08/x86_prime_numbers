André Miyazawa - 11796187

Comentario das instruções nos programas.

Algorítmo para encontrar primos em todos em todos os casos:
A funcao recebe um numero inteiro, verifica se ele é maior do que 1, retornando zero caso contrario
Depois verifica se os numeros nao sao 2 ou 3, ou sao divisiveis por eles, retornando 1 no primeiro caso
e zero no segundo. Em seguida compara se o parametro é divisivel por todos os numeros entre 6*i - 1 e 6*i + 1 
com i variando de 1 até o parametro dividido por 2.

sieve.c:
A função main chama recebe como parametro o char* argv[1], a funcao transforma o char recebido pelo usuário em int, 
alocando em soma o valor do chat subtraido do caracter 0 (48 em ASCII). Na proxima iteracao multiplica o resultado
ja existente por 10, e soma o proximo caracter menos 0 e coloca em soma e assim por diante. Em seguida passa a soma como
parametro para a funcao is_prime dentro do sieve.c O programa faz o algorítmo acima, porem nao ultiliza da multiplicacao
6*i - 1 e 6*i + 1, e sim começa no 5 (6*1 - 1) e soma 2 e 4 alternados, como a operação de soma é mais rapida do que
a operação de multiplicação.

sieve_asm.c:
Igual a funcao sieve.c, porem chama a funcao is_prime em assembly

sieve_nostdlib.c:
Igyal a funcao sieve.c, porem chama a funcao is_prime em assembly e chama a funcao print_asm em assembly

is_prime:
Na funcao is_prime.s, o programa coloca o base pointer na pilha e iguala-o com o stack pointer. O programa ultiliza do algoritmo
acima, porem nao ultiliza da multiplicacao 6*i - 1 e 6*i + 1, e sim começa no 5 (6*1 - 1) e soma 2 e 4 alternados, como a operação
de soma é mais rapida do que a operação de multiplicação.

print.s:
Na funcao print_asm o programa coloca o base pointer na pilha e iguala-o com o stack pointer, guarda o valor de ebx em DWORD [esp-8]
coloca o valor do primeiro parametro em edx, e o valor do segundo parametro em ecx, move 1 para ebx e 4 para eax para ultilizar o 
sys_write, e ultiliza da interrupção 0x80. Em seguida, move a variavel enter para o ecx, move 1 para o edx , 1 para o ebx e 4 novamente
para o eax, para usar quebra de linha. No final recupera o valor e ebx e retira o registrador ebp.

_start:
O programa _start zera o ebp, coloca o argc em esi, coloca o argv em ecx, coloca os parametros, e chama a função main.
No final coloca 1 no registrador eax para ultilizar o sys_exit

Makefile:
Ultiliza 3 targets como precisa gerar tres executaveis, ele gera o .o de todos os programas, e junta os OBJS1 para gerar o sieve,
junta os OBJS2 para gerar o sieve_asm e junta os OBJS3 para gerar o sieve_nostdlib. Faz tudo com o default. O make clean apaga todos
os .o do diretorio e apaga os executaveis gerado pelo arquivo
