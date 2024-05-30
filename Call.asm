section .data
nome db 'Rodrigo Albuquerque', 0Ah

section .text

global _start
_start:

    mov EAX, nome
call strlen ;Chama strlen

    mov EDX, EAX
    mov ECX, nome
    mov EBX, 0x1
    mov EAX, 0x4
    int 0x80

    mov EBX, 0x0
    mov EAX, 0x1
    int 0x80

strlen:
    push EBX  ;Reserva o endereço na pilha
    mov EBX, EAX


nextchar:
    cmp byte[EAX],0
    jz fineshed
    inc EAX
    jmp nextchar


fineshed:
    sub EAX, EBX
    pop EBX ;Restaura o endereço
    ret ;Retorna






