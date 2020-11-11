section .data
printf_str: db "My PID is: %d", 0xa, 0

section .bss
PID: resd 1

section .text
global main
extern printf

main:
mov eax, 20
int 0x80
mov DWORD [PID], eax

push DWORD [PID]
push printf_str
call printf


done:

mov eax, 1
mov ebx, 0
int 0x80

