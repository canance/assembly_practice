STRUC student
  .fName: resb 20
  .lName: resb 20
  .gpa: resd 1
  .size:
ENDSTRUC

section .data
  myStudent: ISTRUC student
    AT student.fName, db "Alice", 0
    AT student.lName, db "Smith", 0
    AT student.gpa, dd 4
  IEND
  fmt_str: db "Name: %s %s", 0xa, "GPA: %d", 0xa, 0

section .text
global main
extern printf
extern exit

main:
  ; print out structure data
  push DWORD [myStudent+student.gpa]
  push DWORD myStudent+student.lName
  ;push DWORD myStudent+student.fName
  lea eax, [myStudent+student.fName]
  push eax
  push fmt_str
  call printf
  add esp, 16

  push 0
  call exit
  
