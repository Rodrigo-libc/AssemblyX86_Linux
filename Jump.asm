section .data
msg db 'Assembly X86', 0Ah

section .text

global _start

_start:

mov EBX, msg
mov EAX, EBX

nextchar:

cmp byte[EAX], 0
jz fineshed
inc EAX
jmp nextchar

fineshed:

sub EAX, EBX


mov EDX, EAX
mov ECX, msg
mov EBX, 0x1
mov EAX, 0x4
int 0x80

mov EBX, 0x0
mov EAX, 0x1
int 0x80 