extern _getDouble
extern _printString
extern _printDouble

section .data
prompt: db "Number: ", 0
output: db "You entered: ", 0


section .bss
num: resq 1

section .text
global _asmMain

_asmMain:
push ebp
mov ebp, esp

push prompt
call _printString
add esp, 4

finit
call _getDouble
fstp QWORD [num]

push output
call _printString
add esp, 4

push DWORD [num+4]
push DWORD [num]
call _printDouble
add esp, 8


exit:
mov esp, ebp
pop ebp
ret


