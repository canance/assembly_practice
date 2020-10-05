section .data
num1: dd 2
num2: dd 4

section .text
global main, sum

main:
push ebp 
mov ebp, esp 
sub esp, 4 ; create room on stack for local variable

mov eax, 10
dec eax
mov ebx, 5

; call sum(num1, num2)
push DWORD [num2]
push DWORD [num1]
call sum
add esp, 8
mov DWORD [ebp - 4], eax ; store the return value on the stack

add eax, ebx
dec eax

; function epilogue
mov esp, ebp ; restore the old stack pointer (deallocate memory)
pop ebp ; restore old frame pointer

mov eax, 1
mov ebx, 0
int 0x80


sum:
push ebp 
mov ebp, esp 

push ebx 
mov ebx, [ebp + 8]
mov eax, [ebp + 12]
add eax, ebx


pop ebx 

mov esp, ebp 
pop ebp 

ret
