ROOT ?= $(shell 'pwd')

IMAGE_NAME ?= x86

DOCKER_RUN ?= docker container run --rm -v $(ROOT):/app $(IMAGE_NAME)

.DEFAULT_GOAL := run

asm-build:
	nasm -f elf32 ex1.asm -o ex1.o
	ld -o ex1 ex1.o

asm-run: asm-build
	./ex1

build:
	docker image build -t x86 .

run: build
	$(DOCKER_RUN) asm-run
