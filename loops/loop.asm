section .data
num: db 0

section .text
global main
main:

; int i = 5
; do{
;   num++;
; } while (i != 0);


mov ecx, 5 ; ecx = 5
top:
  inc BYTE [num] ; num++
loop top ; ecx--; cmp ecx, 0; jne top

; exit
mov eax, 1
mov ebx, 0
int 0x80
