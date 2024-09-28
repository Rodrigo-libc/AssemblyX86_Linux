section .data
    buffer db 'Resultado: ', 0
    num_buffer db 3 dup(0)

section .text

global _start

_start:

    push EBP

    mov EBP, ESP
    sub ESP, 12

    mov dword [ebp-4], 10
    mov dword [ebp-8], 20
    mov dword [ebp-12], 30

    mov EAX, [ebp-4]
    add EAX, [ebp-8]
    add EAX, [ebp-12]

    mov [ebp-4], EAX

    call int_to_string

    ;Mostra a string Resultado:
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, buffer
    mov EDX, 11
    int 0x80

    ;Mostra o número convertido
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, num_buffer
    mov EDX, 3
    int 0x80

    ;Restaura a pilha
    mov ESP, EBP
    pop EBP

    ;Sair do programa
    mov EAX, 0x1
    xor EBX, EBX
    int 0x80

int_to_string:
    mov EDI, num_buffer
    mov ECX, 10
    add EDI, 2
    mov byte [edi], 0xA
    dec EDI

convert_digit:
     xor EDX, EDX
     div ECX
     add DL, '0'
     mov [edi], DL
     dec EDI

     test EAX, EAX
     jnz convert_digit
     RET

