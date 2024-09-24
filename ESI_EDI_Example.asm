section .data
    src db 'Hello, World!', 0xA, 0
    dest times 20 db 0

section .text

    global _start

_start:

    cld ;Define DF(Direction Flag) para 0
    mov ESI, src ;ESI aponta para o endereço da string (Origem)
    mov EDI, dest ;EDI aponta para o buffer que receberá a string (dest)
    mov ECX, 15 ;Tamanho dos bytes que serão copiados
    rep movsb ; Copia byte a Byte e incrementa a dest

    ;Imprime a mensagem no terminal
    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, dest
    mov EDX, 15
    int 0x80

    ;Finaliza o programa
    mov EAX, 0x1
    xor EBX, EBX
    int 0x80


