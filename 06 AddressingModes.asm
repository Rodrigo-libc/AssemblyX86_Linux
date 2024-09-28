section .data
    nome db 'Zara Ali '
    newline db 0xA

section  .text
    global _start

_start:

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, nome
    mov EDX, 0x9
    int 0x80

    mov [nome], dword 'Nuha'
    mov [nome+4], dword ' Ala'

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, nome
    mov EDX, 0x8
    int 0x80

    mov EAX, 0x4
    mov EBX, 0x1
    mov ECX, newline
    mov EDX, 0x1
    int 0x80

    mov EAX, 0x1
    int 0x80
