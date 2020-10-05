section .data
num: db 0

section .text
global main
main:

; int i = 5
; do{
;   int j = 2;
;   do{
;      num++;
;   } while (j != 0);
; } while (i != 0);


mov ecx, 5 ; ecx = 5
outer:
mov ecx, 2 ; ecx = 2
inner:
inc BYTE [num] ; num++
loop inner ; ecx--; cmp ecx, 0; jne inner
loop outer; ecx--; cmp ecx, 0; jne outer

; exit
mov eax, 1
mov ebx, 0
int 0x80
