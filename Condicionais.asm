section .data
    A dd 10
    B dd 20
    msg_maior db 'A e menor que B', 0xA
    msg_menor db 'B e maior que A', 0xA
    msg_len equ $ - msg_maior 

section .text

global _start

_start:

    mov EAX, [A]
    mov EBX, [B]
    cmp EAX, EBX
    jg A_maior_que_B

    ;Continua se o primeiro operando for menor que o segundo
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg_menor
    mov EDX, msg_len
    int 0x80
    jmp Fim

A_maior_que_B: ; Será executado caso condição seja verdadeira

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg_maior
    mov EDX, msg_len
    int 0x80

Fim:
    mov EAX, 0x1
    xor EBX, EBX
    int 0x80



