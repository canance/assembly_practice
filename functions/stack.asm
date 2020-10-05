section .text
global main:
main:
push DWORD 1
push DWORD 2
push DWORD 3
pop eax
pop ebx
pop ecx


mov eax, 1
mov ebx, 0
int 0x80
