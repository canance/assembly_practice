SECTION .data
str: db "CITADEL"
strLen: EQU ($ - str)

SECTION .bss
strLower: RESB 7

SECTION .text
global main
main:
mov al, [str]
xor al, 0b00100000
mov BYTE [strLower], al

mov al, [str+1]
xor al, 0b00100000
mov BYTE [strLower+1], al

mov al, [str+2]
xor al, 0b00100000
mov BYTE [strLower+2], al

mov al, [str+3]
xor al, 0b00100000
mov BYTE [strLower+3], al

mov al, [str+4]
xor al, 0b00100000
mov BYTE [strLower+4], al

mov al, [str+5]
xor al, 0b00100000
mov BYTE [strLower+5], al

mov al, [str+6]
xor al, 0b00100000
mov BYTE [strLower+6], al

mov al, [str+7]
xor al, 0b00100000
mov BYTE [strLower+7], al


mov eax, 4
mov ebx, 1
mov ecx, strLower
mov edx, strLen
int 0x80

mov eax, 1
mov ebx, 0
int 0x80


