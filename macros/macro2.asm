%include "macros.inc"

section .data
num1: dd 8
num2: dd 5

section .bss
result: resd 1

section .text
global main
main:
intSub result, num1, num2
intAdd result, num1, num2
intMul result, num1, num2

mov ebx, 0
mov eax, 1
int 0x80

