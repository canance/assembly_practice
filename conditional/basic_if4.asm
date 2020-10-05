
; if a > b then
;    print "A is greater than B"
; else if b > a then
;    print "B is greater than A"
; else
;    print "A and B are equal"
;

section .data
msg: db "A is greater than B", 0xa
msgLen: equ ($ - msg)
msg2: db "B is greater than A", 0xa
msg2Len: equ ($ - msg2)
msg3: db "A and B are equal", 0xa
msg3Len: equ ($ - msg)


section .text
global main
main:
mov eax, 4
mov ebx, 4


cmp eax, ebx
; if eax > ebx
jg eax_greater_ebx

; else if eax < ebx
jl ebx_greater_eax

; else (eax == ebx)
mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, msg3Len
int 0x80
jmp done

ebx_greater_eax:
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


