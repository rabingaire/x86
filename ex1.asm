global _main

_main:
  mov     rax, 0x2000001 ; exit
  mov     rdi, 42
  syscall
