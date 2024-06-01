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

    ; Desempilha o valor num2
    pop EBX

    mov ECX, EBX  ;Move o endereço de EBX para ECX

    ;Escreve 30 na saída padrão
    mov EAX, 0x4
    mov EBX, 0x1
    mov EDX, 0x3
    int 0x80

    mov EAX, 0x1
    xor EBX, EBX
    int 0x80
