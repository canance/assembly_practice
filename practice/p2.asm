section .data
msg: db "NEGATIVE", 0xA
msgLen: equ $ - msg

section .text
global main
main:
  mov eax, -5
  cmp eax, 0 
  jge done 

  ; print the msg
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, msgLen
  int 0x80

done:
  mov eax, 1
  mov ebx, 0
  int 0x80
