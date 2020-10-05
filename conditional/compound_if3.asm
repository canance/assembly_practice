section .data
msg: db "Password: "
len: equ ($ - msg)

msg2: db "Permission granted!", 0xa
len2: equ ($ - msg2)

section .bss
char1: resb 2

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
mov ecx, char1	; address of buffer
mov edx, 2	; charber of bytes to read 
int 0x80	; syscall

; if char1[0] == 'a' || char1[1] == 'b' then
;     print "permission granted"
; end if

cmp BYTE [char1], 'a'	; compare first expression
je true 		; 
cmp BYTE [char1+1], 'b'	; compare second expression
jne nope

true:
; body of if
; write msg
mov eax, 4 	; sys_write
mov ebx, 1 	; stdout
mov ecx, msg2 	; address of char[]
mov edx, len2	; length of msg2
int 0x80	; syscall

nope:
; exit program
mov eax, 1	; sys_exit
mov ebx, 0	; exit code
int 0x80	; syscall
