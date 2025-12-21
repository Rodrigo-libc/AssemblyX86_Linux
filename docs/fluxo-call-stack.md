# Aula 21 — Fluxo de CALL, pilha e retorno (x86)

```mermaid
flowchart TD
    A[_start] --> B[PUSH tamanho]
    B --> C[PUSH ponteiro]
    C --> D[CALL print_msg]

    D --> E[CALL empilha retorno]
    E --> F[Salto para print_msg]

    F --> G[PUSH EBP]
    G --> H[MOV EBP, ESP]

    H --> I[EBP+8 para ECX (ponteiro)]
    I --> J[EBP+12 para EDX (tamanho)]

    J --> K[sys_write]
    K --> L[POP EBP]
    L --> M[RET]

    M --> N[ADD ESP, 8]
    N --> O[Continua execucao]


