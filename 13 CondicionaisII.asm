segment .data
LF equ 0xA ; Quebra Linha (Line Feed)
NULL equ 0xD ; Retorno de carro (carriage return)
SYS_EXIT equ 0x1 ; Código de chamada para finalizar
RET_EXIT equ 0x0 ; Executado com Sucesso
STD_IN equ 0x0 ; Entrada de dados padrão (Terminal)
STD_OUT equ 0x1 ; Saida de dados padrão (Terminal)
SYS_READ equ 0x3 ; Operação de Leitura
SYS_WRITE equ 0x4 ; Operação de Escrita
SYS_CALL equ 0x80 ; Chamada de sistema

section .data
x dd 10
y dd 50
msg1 db 'X maior que Y',LF, NULL
tam1 equ $ - msg1
msg2 db 'Y maior que X',LF, NULL
tam2 equ $ - msg2

section .text

global _start
_start:
    mov EAX, DWORD [x]
    mov EBX, DWORD [y]

    cmp EAX, EBX
    jge maior
    mov ECX, msg2
    mov EDX, tam2
    jmp final

maior:

    mov ECX, msg1
    mov EDX, tam1

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL
