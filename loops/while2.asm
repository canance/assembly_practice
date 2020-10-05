section .data
num: db 0

section .text
global main
main:
  ; int i=5
  ; while (i > 0){
  ;   num++;
  ; }
  mov ecx, 5
  while_loop:
  cmp ecx, 0 
  je done
    inc BYTE [num] 
    dec ecx
  jmp while_loop

  done:
  mov eax, 1
  mov ebx, 0
  int 0x80
