section .data
num1: dd 2.5
num2: dd 3.6

section .bss
answer: resd 1
answer2: resd 1

section .text
global main
main:

finit
fld dword [num1]
fld dword [num2]
fsub st1
fstp dword [answer]

fld dword [num2]
fsubr st1
fstp dword [answer2]

exit:
mov ebx, 0
mov eax, 1
int 0x80

