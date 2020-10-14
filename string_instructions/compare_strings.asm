; compare str1 to str2

section .data
str1: db "Johnnie"
str2: db "Johnnie"
str2_len: equ ($-str2)
fmt_str: db "ecx = %d", 0xa, 0
fmt_str2: db "Not same", 0xa, 0
fmt_str3: db "Same", 0xa, 0

section .text
global main
extern printf
extern exit

main:
mov esi, str1
mov edi, str2
mov ecx, str2_len
cld
repe cmpsb ; repz cmpsb
pushf

push ecx
push fmt_str
call printf
add esp, 8


popf
jnz not_same
push fmt_str3
call printf
add esp, 4
jmp done

not_same:
push fmt_str2
call printf
add esp, 4

done:
push 0
call exit
