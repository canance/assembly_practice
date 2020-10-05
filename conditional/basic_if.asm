
; if a > b then
;    print "A is greater than B"
; end if

section .data
msg: db "A is greater than B", 0xa
msgLen: equ ($ - msg)

section .text
global main
main:
mov eax, 3
mov ebx, 2

cmp eax, ebx
; eax > ebx
jg eax_greater_ebx
jmp done

eax_greater_ebx:
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, msgLen
int 0x80

done:
mov eax, 1
mov ebx, 0
int 0x80


