section .data
num: dd 32.5

section .text
global main
main:
finit ; initializes the FPU (resets control word, status word cleared, TOP set to 0, no exceptions, all registers marked as empty)
; push num on stack
fld DWORD [num] ; operand must be mem location or stN (N = 0-7)
; push pi on the stack
fldpi
; push 1 on stack
fld1
; push 0 on stack
fldz

exit:
mov ebx, 0
mov eax, 1
int 0x80
