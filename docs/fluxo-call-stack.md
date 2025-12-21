# Aula 21 — Fluxo de CALL, pilha e retorno (x86)

```
Endereco mais alto

EBP + 12  Segundo argumento
EBP + 8   Primeiro argumento
EBP + 4   Endereco de retorno
EBP + 0   EBP antigo (salvo)

EBP       Base da pilha da funcao
Endereco mais baixo


```mermaid
flowchart TD
    subgraph MAIN["_start: (Entry Point)"]
        A1[PUSH tamanho]
        A2[PUSH ponteiro]
        A3[CALL print_msg]
        A4[ADD ESP, 8]
        A5[MOV EAX, 1]
        A6[int 0x80]
    end

    subgraph FUNC["print_msg (funcao)"]
        B1[PUSH EBP]
        B2[MOV EBP, ESP]
        B3[Ler arg1 em EBP+8]
        B4[Ler arg2 em EBP+12]
        B5[MOV EAX, 0x4]
        B6[MOV EBX, 0x1]
        B7[int 0x80]
        B8[POP EBP]
        B9[RET]
    end

    A1 --> A2 --> A3
    A3 --> B1
    B1 --> B2 --> B3 --> B4 --> B5 --> B6 --> B7 --> B8 --> B9
    B9 --> A4 --> A5 --> A6





