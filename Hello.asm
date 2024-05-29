SECTION .data
msg     db      'Hello World!', 0Ah
 
SECTION .text
global  _start
 
_start:
 
    mov     edx, 13
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4
    int     0x80
 
    mov     ebx, 0      ; return 0 status de erro: 'Sem erros'
    mov     eax, 1      ; invoca SYS_EXIT (kernel opcode 1)
    int     0x80

