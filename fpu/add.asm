section .data
num1: dd 2.5
num2: dd 3.6
num3: dd 0.5

section .bss
answer: resd 1
answer2: resd 1
answer3: resd 1

section .text
global main
main:

finit
fld dword [num1]
fld dword [num2]
fadd st1
fst dword [answer]
fist dword [answer2]

fld dword [num3]
fadd st1 ; fadd st0, st1
fistp dword [answer3] ; round to an int, store in answer3, and pop off stack

exit:
mov ebx, 0
mov eax, 1
int 0x80

