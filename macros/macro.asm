%macro intSub 3
  mov eax, DWORD [%2]
  sub eax, DWORD [%3]
  mov DWORD [%1], eax
%endmacro

section .data
num1: dd 8
num2: dd 5

section .bss
result: resd 1

section .text
global main
main:
intSub result, num1, num2

mov ebx, 0
mov eax, 1
int 0x80

