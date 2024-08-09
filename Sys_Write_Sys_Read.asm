section .data
userMsg db 'Por favor entre com um número: '

tanUserMsg equ $ - userMsg

dispMsg db 'Você digitou: '

tanDispMsg equ $ - dispMsg

section .bss
num resb 5

section .text

global _start

_start:

;Mensagem de Prompt do Usuário
mov EAX, 0x4
mov EBX, 0x1
mov ECX, userMsg
mov EDX, tanUserMsg
int 0x80

;Ler e armazenar a entrada do usuário
mov EAX, 0x3
mov EBX, 0x2
mov ECX, num
mov EDX, 5
int 0x80

;Emite a mensagem 'Você digitou :'
mov EAX, 0x4
mov EBX, 0x1
mov ECX, dispMsg
mov EDX, tanDispMsg
int 0x80

;Saida número digitado
mov EAX, 0x4
mov EBX, 0x1
mov ECX, num
mov EDX, 5
int 0x80

;Código de saida
mov EAX, 0x1
mov EBX, 0x0
int 0x80
