section .data
msg: db "Please enter a number: "
len: equ ($ - msg)


section .bss
num: resb 1

section .text
global main
main:

; write prompt
mov eax, 4 	; sys_write
mov ebx, 1 	; stdout
mov ecx, msg 	; address of char[]
mov edx, len	; length of msg
int 0x80	; syscall

; read value
mov eax, 3 	; sys_read
mov ebx, 0	; stdin
mov ecx, num	; address of buffer
mov edx, 1	; number of bytes to read 
int 0x80	; syscall

sub BYTE [num], 0x30	; convert from ascii to numeric
movzx eax, BYTE [num]	; move byte into eax

; exit program
mov eax, 1	; sys_exit
mov ebx, 0	; exit code
int 0x80	; syscall
