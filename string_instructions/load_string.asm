; load chars from string in eax

section .data
str: db "CITADEL"

section .text
global main
extern exit

main:
mov esi, str
lodsb
; inspect eax in gdb
lodsb
; inspect eax in gdb

push 0
call exit
