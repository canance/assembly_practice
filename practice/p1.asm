section .data
arrayA: db "CITADEL"

section .bss
arrayB: resb 7

section .text
global main
main:

mov ecx, 0
top:
cmp ecx, 7
ja done
mov al, BYTE [arrayA+ecx]
add al, 20h
mov BYTE [arrayB+ecx], al
inc ecx
jmp top



done:
mov eax, 4 	; syscall 4 (sys_write)
mov ebx, 1 	; file descriptor (stdout)
mov ecx, arrayB 	; address of the string to write
mov edx, 7	; length of the string to write
int 0x80	; call kernel for syscall

mov eax, 1
mov ebx, 0
int 0x80

