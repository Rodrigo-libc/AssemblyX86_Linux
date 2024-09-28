section .data
    msg db 'Endereco: 0x00000000', 0xA
    tan equ $ - msg
    hex_digits db '0123456789ABCDEF'

section .text
    global _start

_start:

    lea EAX, [msg]

    mov EBX, EAX
    mov EDI, msg +12     ;Inciar logo após o (0x)

    mov ECX, 8       ;8 digitos para o endereço

convert_loop:
    mov EDX, EBX
    and EDX, 0xF     ;Isolar os 4 bits menos significativos
    mov DL, [hex_digits + EDX]     ;Move o valor Hexadecimal para DL
    mov [EDI + ECX -1], DL     ;Move o valor convertido para o buffer
    shr EBX, 4      ;Desloca 4 bits a direita
    loop convert_loop     ;Retorna ao loop

    ;Imprimir o endereço formatado
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, msg
    mov EDX, tan
    int 0x80

    ;Fim
    mov EAX, 0x1
    xor EBX, EBX
    int 0x80
