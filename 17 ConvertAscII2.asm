SYS_EXIT equ 0x1
SYS_READ equ 0x3
SYS_WRITE equ 0x4
STDIN equ 0x0
STDOUT equ 0x1

segment .data
msg1 db 'Digite um numero: ',0xA,0xD
tan1 equ $ - msg1

msg2 db 'Digite o segundo numero: ',0xA,0xD
tan2 equ $ - msg2

msg3 db 'O resultado e: '
tan3 equ $ - msg3

;Nova linha
newline db 0xA

segment .bss
num1 resb 2
num2 resb 2
res resb 1

section .text

global _start

_start:

;Primeira Mensagem
mov EAX, SYS_WRITE
mov EBX, STDOUT
mov ECX, msg1
mov EDX, tan1
int 0x80

;Lendo entrada do usuário
mov EAX, SYS_READ
mov EBX, STDIN
mov ECX, num1
mov EDX, 2
int 0x80

;Segunda Mensagem
mov EAX, SYS_WRITE
mov EBX, STDOUT
mov ECX, msg2
mov EDX, tan2
int 0x80

;Lendo Segunda entrada do usuário
mov EAX, SYS_READ
mov EBX, STDIN
mov ECX, num2
mov EDX, 2
int 0x80

;Terceira mensagem
mov EAX, SYS_WRITE
mov EBX, STDOUT
mov ECX, msg3
mov EDX, tan3
int 0x80

mov EAX, [num1]
sub EAX, '0'

mov EBX, [num2]
sub EBX, '0'

add EAX, EBX

add EAX, '0'

mov [res], EAX

;Mostra o resultado convertido
mov EAX, SYS_WRITE
mov EBX, STDOUT
mov ECX, res
mov EDX, 1
int 0x80

mov EAX, SYS_WRITE
mov EBX, STDOUT
mov ECX, newline
mov EDX, 0x1
int 0x80

;Exit
mov EAX, SYS_EXIT
xor EBX, EBX
int 0x80










