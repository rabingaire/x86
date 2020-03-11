asm-build:
	nasm -f elf32 ex1.asm -o ex1.o
	ld -o ex1 ex1.o

asm-run: asm-build
	./ex1

run:
	docker image build -t x86 .
	docker container run x86
