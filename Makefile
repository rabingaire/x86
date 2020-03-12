ROOT ?= $(shell 'pwd')

IMAGE_NAME ?= x86

DOCKER_RUN ?= docker container run --rm -v $(ROOT):/app $(IMAGE_NAME)

.DEFAULT_GOAL := run

INPUT_FILE_NAME ?= $(name)
OUTPUT_FILE_NAME ?= $(shell echo "$$(echo $$(cut -d'.' -f1 <<< $(INPUT_FILE_NAME)))")

ifndef INPUT_FILE_NAME
$(error "required name=value")
endif


asm-build:
	nasm -f elf32 $(INPUT_FILE_NAME) -o $(OUTPUT_FILE_NAME).o
	ld -o $(OUTPUT_FILE_NAME) $(OUTPUT_FILE_NAME).o

asm-run: asm-build
	./$(OUTPUT_FILE_NAME)

build:
	docker image build -t x86 .

run: build
	$(DOCKER_RUN) asm-run INPUT_FILE_NAME=$(INPUT_FILE_NAME) OUTPUT_FILE_NAME=$(OUTPUT_FILE_NAME)
