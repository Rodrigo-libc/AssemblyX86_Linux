section .data
    msg db 'Resultado: '
    tan equ $ - msg
    newline db 0xA

segment .bss
    num resb 1

section .text

    global _start

_start:

    mov EAX, '3'
    sub EAX, '0'

    mov EBX, '4'
    sub EBX, '0'

    add EAX, EBX

    add EAX, '0'

    mov [num], EAX

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tan
    int 0x80

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, num
    mov EDX, 0x1
    int 0x80

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, newline
    mov EDX, 0x1
    int 0x80

    mov EAX, 0x1
    int 0x80


