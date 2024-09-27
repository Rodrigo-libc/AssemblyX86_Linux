section .data
    msg db 'Resultado: '
section .bss
    result resb 2
section .text

global _start

_start:

    push EBP
    mov EBP, ESP
    sub ESP, 8

    ;Variáveis Locais
    mov dword [ebp-4], 5
    mov dword [ebp-8], 3

    mov EAX, [ebp-4]
    mov EBX, [ebp-8]

    add EAX, EBX

    add EAX, '0' ;Converte o valor para ASCII

    mov [result], EAX

    mov EDI, result
    mov byte [EDI+1], 0xA ; Move a quebra de linha 0xA para o final do buffer

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, 11
    int 0x80

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, result
    mov EDX, 2
    int 0x80

    ;Restaura a Pilha
    mov ESP, EBP
    pop EBP

    mov EAX, 0x1
    xor EBX, EBX
    int 0x80
