section .text
global main
extern printf

main:
mov eax, 0xdeadbeef
push eax
push message
call printf
add esp, 8
ret


message db "Register = %08X", 10, 0

