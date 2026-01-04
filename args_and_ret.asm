section .data
msg1 db "Primeiro Argumento", 0xA ; Argumento 1
tam1 equ $ - msg1

msg2 db "Segundo Argumento", 0xA ;Argumento 2
tam2 equ $ - msg2

buffer db 0xA ; buffer para número e newline

section .text

global _start:

_start:

    ;Empilhar dois números
    PUSH EBP
    MOV EBP, ESP
    SUB ESP, 8
    MOV DWORD [EBP-4], 2   ; número1
    MOV DWORD [EBP-8], 3   ; número2

    ;Empilha Argumento 1
    PUSH tam1
    PUSH msg1
    CALL print_msg
    ADD ESP, 8

    ;Empilha Argumento 2
    PUSH tam2
    PUSH msg2
    CALL print_msg
    ADD ESP, 8

    ;Realiza Soma
    MOV EAX, [EBP-4]
    ADD EAX, [EBP-8]
    PUSH EAX
    CALL print_number

    ADD ESP, 4
    ADD ESP, 8

    ;Saída
    MOV EAX, 0x1
    XOR EBX, EBX
    int 0x80

print_msg:

    PUSH EBP
    MOV EBP, ESP

    MOV ECX, [EBP+8]
    MOV EDX, [EBP+12]
    MOV EAX, 0x4
    MOV EBX, 0x1
    int 0x80

    POP EBP
    RET

print_number:
    
    PUSH EBP
    MOV EBP, ESP
    MOV EAX, [EBP+8]
    ADD AL, '0'
    MOV [buffer], AL

    ; Sys_Write
    MOV EAX, 0x4
    MOV EBX, 1
    MOV ECX, buffer
    MOV EDX, 1
    int 0x80

    ; Nova Linha
    MOV BYTE [buffer], 0xA
    MOV EAX, 0x4
    MOV EBX, 1
    MOV ECX, buffer
    MOV EDX, 1
    int 0x80

    POP EBP
    RET