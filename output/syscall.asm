section .data
msg: db "Hello, world!!", 0xa
len: equ ($ - msg)

section .text
global main
main:

mov eax, 4 	; syscall 4 (sys_write)
mov ebx, 1 	; file descriptor (stdout)
mov ecx, msg 	; address of the string to write
mov edx, len	; length of the string to write
int 0x80	; call kernel for syscall

mov eax, 1	; syscall 1 (sys_exit)
mov ebx, 0	; return code
int 0x80	; call kernel for syscall
