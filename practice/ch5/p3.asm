section .data
arrayB: DD 15, 30, 45
arrayA: DD 100, 2, 3
msgA: DB "arrayA is larger.", 0xA
msgA_len: equ $ - msgA
msgB: DB "arrayB is larger.", 0xA
msgB_len: equ $ - msgB

section .text
global main
main:
  mov eax, 0 ; counter for sum of arrayA
 
  ; setup loop to count arrayA
  mov ecx, 3
  l1:
    add eax, DWORD [arrayA + (ecx - 1) * 4]
    loop l1

  mov ebx, 0 ; counter for sum of arrayB

  ; setup loop to count arrayB
  mov ecx, 3
  l2:
    add ebx, DWORD [arrayB + (ecx - 1) * 4]
    loop l2

  cmp eax, ebx
  jg arrA

  ; print B is bigger
  mov eax, 4
  mov ebx, 1
  mov ecx, msgB
  mov edx, msgB_len
  int 0x80
  jmp done ; skip else block

  arrA:
  ; print A is bigger
  mov eax, 4
  mov ebx, 1
  mov ecx, msgA
  mov edx, msgA_len
  int 0x80

  done:
  mov eax, 1
  mov ebx, 0
  int 0x80




    


