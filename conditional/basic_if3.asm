
; if a > b then
;    print "A is greater than B"
; else
;    print "B is greater than or equal to A"
; end if
; exit()

section .data
msg: db "A is greater than B", 0xa
msgLen: equ ($ - msg)
msg2: db "B is greater than or equal to A", 0xa
msg2Len: equ ($ - msg2)


section .text
global main
main:
mov eax, 3
mov ebx, 4

cmp eax, ebx
jg eax_greater_ebx

; else case
mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, msg2Len
int 0x80
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


