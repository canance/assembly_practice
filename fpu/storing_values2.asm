section .data

section .bss
num: resq 1

section .text
global main
main:
finit ; initializes the FPU (resets control word, status word cleared, TOP set to 0, no exceptions, all registers marked as empty)
; push pi on the stack
fldpi
; store pi into num variable
fst qword [num]


exit:
mov ebx, 0
mov eax, 1
int 0x80
