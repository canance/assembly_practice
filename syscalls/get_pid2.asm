section .data
printf_str: db "My PID is: %d", 0xa, 0

section .bss
PID: resd 1

section .text
global main
extern printf

main:
mov eax, 20
; sysenter was introduced with PII processors (i586)
; GOAL: faster switches between privilege levels (ring 3 --> ring 0 and vice versa)
;
; it behaves similarly to int 0x80, but requires certain values to be pushed to the stack
; sysenter expects the following values on the stack before it's called:
;
; push ret_value (a location to return to)
; push ecx
; push edx
; push ebp
; mov ebp, esp

push return_from_sysenter
push ecx
push edx
push ebp
mov ebp, esp
sysenter

return_from_sysenter:
mov DWORD [PID], eax



push DWORD [PID]
push printf_str
call printf


done:

mov eax, 1
mov ebx, 0
int 0x80

