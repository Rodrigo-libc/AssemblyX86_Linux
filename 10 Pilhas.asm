section .data
    num1 db '10', 0xA
    num2 db '30', 0xA

section .text
global _start

_start:
    mov EAX, num1     ; Carrega o endereço da string num1 em EAX
    push EAX          ; Empilha o endereço da string num1

    mov EAX, num2     ; Carrega o endereço da string num2 em EAX
    push EAX          ; Empilha o endereço da string num2

    ; Desempilha o valor num2 para ecx
    pop ECX           ; O valor '30' estará agora em ECX

    mov EDX, 0x3

    ;Escreve 30 na saída padrão
    mov EAX, 0x4
    mov EBX, 0x1
    int 0x80

    ;Fim
    mov EAX, 0x1
    xor EBX, EBX
    int 0x80
