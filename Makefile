ASM=nasm
ASMFLAGS=-f elf64
LD=ld

.PHONY: all
all: main

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

.PHONY: main
main: main.o lib.o dict.o
	$(LD) -o $@ $?

.PHONY: clean
clean:
	rm main *.o
