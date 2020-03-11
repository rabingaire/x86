build:
	nasm -f macho64 ex1.asm -o ex1.o
	ld -macosx_version_min 10.12 -lSystem -o ex1 ex1.o
