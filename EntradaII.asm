segment .data
LF equ 0xA ; Quebra Linha (Line Feed)
NULL equ 0xD ; Final da String
SYS_EXIT equ 0x1 ; Código de chamada para finalizar
RET_EXIT equ 0x0 ; Executado com Sucesso
STD_IN equ 0x0 ; Entrada de dados padrão (Terminal)
STD_OUT equ 0x1 ; Saida de dados padrão (Terminal)
SYS_READ equ 0x3 ; Operação de Leitura
SYS_WRITE equ 0x4 ; Operação de Escrita
SYS_CALL equ 0x80 ; Chamada de sistema

section .data

msg db 'Informe seu nome: ', LF, NULL
tam equ $ - msg

section .bss

nome resb 1

section .text

global _start
_start:
;Mensagem
mov EAX, SYS_WRITE
mov EBX, STD_OUT
mov ECX, msg
mov EDX, tam
int SYS_CALL

;Entrada do usuário
mov EAX, SYS_READ
mov EBX, STD_IN
mov ECX, nome
mov EDX, 0XA
int SYS_CALL

;Saida de dados
mov EAX, SYS_WRITE
mov EBX, STD_OUT
mov ECX, nome
int SYS_CALL

;Finalizar
mov EAX, SYS_EXIT
mov EBX, RET_EXIT
int SYS_CALL

