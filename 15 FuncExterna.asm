slen:
    push EBX
    mov EBX, EAX

nextchar:
    cmp byte[EAX],0
    jz finished
    inc EAX
    jmp nextchar


finished:
    sub EAX, EBX
    pop EBX
    RET

sprint:
     push EDX
     push ECX
     push EBX
     push EAX
     call slen

     mov EDX, EAX
     pop EAX

     mov ECX, EAX
     mov EBX, 0x1
     mov EAX, 0x4
     int 0x80

     pop EBX
     pop ECX
     pop EDX
     RET

sprintLF:
     call sprint
     push EAX
     mov EAX, 0Ah

     push EAX

     mov EAX, ESP
     call sprint
     pop EAX
     pop EAX
     RET

quit:
     mov EBX, 0x0
     mov EAX, 0x1
     int 0x80
     RET
