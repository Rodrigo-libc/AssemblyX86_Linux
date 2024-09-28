section .data
msg db 'Mostrando 9 estrelas', 0xA
tamanho equ $ - msg 
s2 times 9 db '*'

section .text

global _start

_start:

mov edx, tamanho
mov ecx, msg
mov ebx, 0x1  ;stdout
mov eax, 0x4  ;sys_write
int 0x80  ;call kernel

mov edx, 9
mov ecx, s2
mov ebx, 0x1  ;stdout
mov eax, 0x4  ;sys_write
int 0x80 ;call kernel

mov eax, 0x1  ;sys_exit
int 0x80
