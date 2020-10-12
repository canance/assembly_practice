section .data
msg: db "Please enter a character: "
msgLen: equ $ - msg
msg2: db "LOWERCASE", 0xa
msg2_len: equ $ - msg2

section .bss
input: resb 1



section .text
global main
main:

; print prompt
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, msgLen
int 0x80

; input char
mov eax, 3
mov ebx, 0
mov ecx, input
mov edx, 1
int 0x80

; check if char is in ascii range of uppercase
; if (input >= 'a' && input <= 'z')
cmp BYTE [input], 'a'
jb done
cmp BYTE [input], 'z'
ja done

; print LOWERCASE
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, msg2_len
int 0x80

done:
mov eax, 1
mov ebx, 0
int 0x80
