TARGET1=sieve
TARGET2=sieve_asm
TARGET3=sieve_nostdlib
CC=gcc
ASM=nasm
default=all
AFLAGS=-felf32
default: all


OBJS1=sieve.o
OBJS2=sieve_asm.o is_prime.o
OBJS3=sieve_nostdlib.o is_prime.o print.o _start.o

sieve.o: sieve.c
	$(CC) -c $< -o $@

sieve_asm.o: sieve_asm.c
	$(CC) -m32 -c $< -o $@

sieve_nostdlib.o: sieve_nostdlib.c
	$(CC) -m32 -c $< -o $@

is_prime.o: is_prime.s
	$(ASM) $< $(AFLAGS)

print.o: print.s
	$(ASM) $< $(AFLAGS)

_start.o: _start.s
	$(ASM) $< $(AFLAGS)


all: $(OBJS1) $(OBJS2) $(OBJS3)
	$(CC) $(OBJS1) -o $(TARGET1)
	$(CC) -m32 $(OBJS2) -o $(TARGET2)
	$(CC) -m32 -nostdlib $(OBJS3) -o $(TARGET3)

clean:

	rm *.o
	rm $(TARGET1)
	rm $(TARGET2)
	rm $(TARGET3)

