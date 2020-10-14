; copy str1 contents to str2

section .data
str1: db "Hello, world!", 0xa, 0
str1_len: equ ($ - str1)

section .bss
str2: resb str1_len

section .text
global main
extern printf
extern exit 

main:

mov esi, str1 ; set the source
mov edi, str2 ; set the destination
mov ecx, str1_len ; number of times to repeat
cld ; clear direction flag, move from left --> right
rep movsb ; rep instruction movs bytes

; print str2
push str2
call printf
sub esp, 4

push 0
call exit
