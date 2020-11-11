section .data
printf_str: db "My PID is: %d", 0xa, 0

section .bss
PID: resd 1

section .text
global main
extern printf

main:
mov eax, 20

; Another way make syscalls is to call offset 0x10 from the gs segment register.
; libc loads gs:0x10 with a pointer to __kernel_vsyscall.
; __kernel_vsyscall is created by the kernel as a VDSO (virtual dynamic shared object).
;   -- The kernel creates the VDSO as a single memory page that is mapped into all processes' address space
;  
call DWORD [gs:0x10]

mov DWORD [PID], eax

push DWORD [PID]
push printf_str
call printf


done:

mov eax, 1
mov ebx, 0
int 0x80

