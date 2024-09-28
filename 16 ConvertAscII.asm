section .data
    buffer db 20 dup(0)              ; Buffer para armazenar a string convertida (20 caracteres)
    newline db 10                     ; Caractere de nova linha (\n)

section .text
    global _start

_start:
    ; Soma de 10 + 20
    mov EAX, 10                      ; Primeiro número
    add EAX, 20                      ; Adiciona o segundo número

    ; Converter para string decimal
    mov ESI, buffer + 19             ; Início do buffer de trás para frente
    mov ECX, 10                      ; Base decimal

.convert_loop:
    xor EDX, EDX                     ; Limpa EDX para DIV
    div ECX                          ; Divide EAX por 10, EAX = quociente, EDX = resto
    add dl, '0'                      ; Converte o resto para o caractere ASCII correspondente
    dec ESI                          ; Move para a próxima posição no buffer
    mov [ESI], dl                    ; Armazena o caractere no buffer
    test EAX, EAX                    ; Verifica se ainda há quociente
    jnz .convert_loop                ; Se sim, continua a conversão

    ; Agora ESI aponta para o início da string convertida no buffer

    ; Escrever a string convertida (usando syscall write)
    mov EDX, 20                      ; Tamanho da string a ser escrita
    mov EAX, 4                       ; syscall number (sys_write)
    mov EBX, 1                       ; file descriptor (stdout)
    mov ECX, buffer + 1              ; Ponteiro para o buffer onde a string está armazenada
    int 0x80                         ; Chama o kernel

    ; Escrever uma nova linha
    mov EDX, 1                       ; Tamanho da nova linha
    mov EAX, 4                       ; syscall number (sys_write)
    mov EBX, 1                       ; file descriptor (stdout)
    mov ECX, newline                 ; Ponteiro para o caractere de nova linha
    int 0x80                         ; Chama o kernel

    ; Terminar o programa
    mov EAX, 1                       ; syscall number (sys_exit)
    XOR EBX, EBX                     ; status 0
    int 0x80                         ; Chama o kernel
