# Aula 21 — Fluxo de CALL, pilha e retorno (x86)
flowchart TD
    subgraph MAIN["_start (codigo chamador)"]
        A1[PUSH tamanho]
        A2[PUSH ponteiro]
        A3[CALL print_msg]
        A4[ADD ESP, 8]
    end

    subgraph FUNC["print_msg (funcao)"]
        B1[PUSH EBP]
        B2[MOV EBP, ESP]
        B3[Ler arg1 em EBP+8]
        B4[Ler arg2 em EBP+12]
        B5[sys_write]
        B6[POP EBP]
        B7[RET]
    end

    A1 --> A2 --> A3
    A3 --> B1
    B1 --> B2 --> B3 --> B4 --> B5 --> B6 --> B7
    B7 --> A4



