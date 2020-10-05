section .data
msg: db "Please enter a char: "
len: equ ($ - msg)

msg2: db "You entered: "
len2: equ ($ - msg2)

section .bss
char: resb 1

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
mov ecx, char	; address of buffer
mov edx, 1	; charber of bytes to read 
int 0x80	; syscall

; write msg
mov eax, 4 	; sys_write
mov ebx, 1 	; stdout
mov ecx, msg2 	; address of char[]
mov edx, len2	; length of msg2
int 0x80	; syscall

; output inputted value
mov eax, 4 	; sys_write
mov ebx, 1 	; stdout
mov ecx, char 	; address of char[]
mov edx, 1	; length of char
int 0x80	; syscall

; exit program
mov eax, 1	; sys_exit
mov ebx, 0	; exit code
int 0x80	; syscall
