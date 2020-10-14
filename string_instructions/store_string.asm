; initialize an array to 0
section .data
my_array: db 1, 2, 3, 4, 5, 6, 7, 8
array_len: equ ($ - my_array)

section .text
global main
extern exit

main:
xor eax, eax ; zero out eax ; set value to be copied with stosb
mov edi, my_array ; the address of the start of the array
cld ; clear the direction flag
mov ecx, array_len ; set ecx
rep stosb

; view array content in gdb

push 0
call exit
