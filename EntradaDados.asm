section .data
prompt db "Digite algo: ", 0


section .bss
buffer resb 128


section .text

global _start

_start:

;Escreve a mensagem de prompt
mov EAX, 0x4
mov EBX, 0x1
mov ECX, prompt
mov EDX, 0x14
int 0x80

;Ler a entrada do usuário
mov EAX, 0x3
mov EBX, 0x0
mov ECX, buffer
mov EDX, 128
int 0x80

;Escrever a mensagem do usuário
mov EAX, 0x4
mov EBX, 0x1
mov ECX, buffer
int 0x80

;Final
mov EAX, 0x1
XOR EBX, EBX
int 0x80
