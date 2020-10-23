section .data
num1: dd 3.6
num2: dd -7.1



section .text
global main
main:

finit
fld dword [num1]
fcom dword [num2] ; compare st0 with num2

fstsw ax; copy status word into ax
sahf ; store ah into flags
ja above ; use unsigned comparisons with comparing floats

below:
mov eax, 0


above:
mov eax, 1

exit:
mov ebx, 0
mov eax, 1
int 0x80
