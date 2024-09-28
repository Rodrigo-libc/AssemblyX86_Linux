section .data
    even_msg db 'Numero Par!',0xA
    tan1 equ $ - even_msg

    odd_msg db 'Numero Impar!',0xA
    tan2 equ $ - odd_msg

section .text

global _start

_start:

    mov AX, 9h
    and ax, 0x1
    jz evnn
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, odd_msg
    mov EDX, tan2
    int 0x80
    jmp outprog

evnn:
    mov AH, 09h
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, even_msg
    mov EDX, tan1
    int 0x80

outprog:
    mov EAX, 0x1
    int 0x80

