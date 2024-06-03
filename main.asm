%INCLUDE 'FuncExterna.asm'

section .data
    msg1 db 'Rodrigo Albuquerque', 0x0
    msg2 db 'Rodrigo Freitas', 0x0

section .text

global _start

_start:

     mov EAX, msg1
     call sprintLF

     mov EAX, msg2
     call sprintLF

     call quit
