section .data
w1: dw 1, 2, 3, 4
w2: dw 5, 6, 7, 8

section .bss
data: resq 1

section .text
global main
main:
movq mm0, [w1]
movq mm1, [w2]

paddsw mm0, mm1
movq [data], mm0

xor eax, eax
xor ebx, ebx
xor ecx, ecx
xor edx, edx

mov ax, word [data]
mov bx, word [data+2]
mov cx, word [data+4]
mov dx, word [data+6]


mov ebx, 0
mov eax, 1
int 0x80
