section .data
msg db 'Assembly X86', 0Ah

section .text

global _start

_start:

    mov EBX, msg
    mov EAX, EBX

nextchar:

    cmp byte[EAX], 0 ; Compara o byte atual na memória apontado por EAX com 0
    jz fineshed      ; Pula pra fineshed caso seja 0
    inc EAX          ; Incrementa o próximo byte até o terminador nulo 0
    jmp nextchar     ; Pula pra nextchar enquanto não finalizar

fineshed:

    sub EAX, EBX  ; Subtrai o endereço inical EBX com o atual em EAX
	      ; após a incrementação
	      ; O resultado é o tamanho da string 

    mov EDX, EAX
    mov ECX, msg
    mov EBX, 0x1
    mov EAX, 0x4
    int 0x80

    mov EBX, 0x0
    mov EAX, 0x1
    int 0x80 
