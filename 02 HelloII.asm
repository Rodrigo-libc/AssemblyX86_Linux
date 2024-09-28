section .data
hello db 'Hello, World!', 0xA
tamanho equ $ - hello 

section .text

global _start
_start:

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, hello
    mov EDX, tamanho
    int 0x80

    mov EAX, 0x1
    mov EBX, 0x0
    int 0x80

