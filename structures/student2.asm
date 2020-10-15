STRUC student
  .fName: resb 20
  .lName: resb 20
  .gpa: resd 1
  .size:
ENDSTRUC

section .bss
  myStudent: resb student.size
  strBuffer: resb 20
section .data
  fmt_str: db "Name: %s %s", 0xa, "GPA: %d", 0xa, 0
  prompt1: db "First name: ", 0
  prompt2: db "Last name: ", 0
  prompt3: db "GPA: ", 0
  scanf_s: db "%s", 0
  scanf_d: db "%d", 0

section .text
global main
extern printf
extern scanf
extern exit

main:

  ; prompt for first name
  push prompt1
  call printf
  add esp, 4

  ; read first name
  push myStudent+student.fName
  push scanf_s
  call scanf 
  add esp, 8

  ; prompt for first name
  push prompt2
  call printf
  add esp, 4

  ; read last name
  push myStudent+student.lName
  push scanf_s
  call scanf 
  add esp, 8


  push prompt3
  call printf
  add esp, 4


  push myStudent+student.gpa
  push scanf_d
  call scanf
  add esp, 8

  ; print out structure data
  push DWORD [myStudent+student.gpa]
  push DWORD myStudent+student.lName
  push DWORD myStudent+student.fName
  push fmt_str
  call printf
  add esp, 16

  push 0
  call exit
  
