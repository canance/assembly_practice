section .data
name_prompt: db "Please enter your name: ", 0
age_prompt: db "How old are you: ", 0
output_string: db "%s is %d years old.", 0xa, 0
scanf_s: db "%s", 0
scanf_d: db "%d", 0


section .bss
age: resd 1
name: resb 20

section .text
global main
extern printf
extern scanf
extern exit

main:

; print name prompt
push name_prompt
call printf
add esp, 4 ; remove argument

; get name
push name ; push address of name
push scanf_s; push format string
call scanf
add esp, 8

; print age prompt
push age_prompt
call printf
add esp, 4 ; remove argument

; get age
push age
push scanf_d
call scanf
add esp, 8

; print final message
push DWORD [age] ; push age value
push name
push output_string
call printf
add esp, 12

; exit
push 0
call exit
