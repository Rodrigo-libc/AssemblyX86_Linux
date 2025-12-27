#Aula 21 — Pilha, argumentos, variáveis locais e retorno (x86 – Linux)

```mermaid
flowchart TD
    START(["_start<br/>Entry Point"])

    SF["PUSH EBP<br/>MOV EBP, ESP<br/>SUB ESP, 8<br/>Criar stack frame"]

    L1["Variáveis locais<br/>EBP-4 = 2<br/>EBP-8 = 3"]

    M1["PUSH tam1<br/>PUSH msg1"]
    C1["CALL print_msg"]
    CL1["ADD ESP, 8<br/>Limpa argumentos"]

    M2["PUSH tam2<br/>PUSH msg2"]
    C2["CALL print_msg"]
    CL2["ADD ESP, 8<br/>Limpa argumentos"]

    SUM["MOV EAX, EBP-4<br/>ADD EAX, EBP-8"]

    ARG["PUSH EAX<br/>Argumento"]
    C3["CALL print_number"]
    CL3["ADD ESP, 4<br/>Limpa argumento"]

    CL4["ADD ESP, 8<br/>Limpa variáveis locais"]

    EXIT["MOV EAX, 1<br/>XOR EBX, EBX<br/>int 0x80<br/>sys_exit"]

    START --> SF --> L1
    L1 --> M1 --> C1 --> CL1
    CL1 --> M2 --> C2 --> CL2
    CL2 --> SUM --> ARG --> C3 --> CL3
    CL3 --> CL4 --> EXIT

