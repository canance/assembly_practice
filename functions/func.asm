section .data
num1: dd 2
num2: dd 4

section .text
global main, sum

main:
; function prologue
push ebp ; save the old frame pointer
mov ebp, esp ; set current frame pointer to the stack pointer

mov eax, 10
dec eax
mov ebx, 5

; call sum(num1, num2)
push DWORD [num2]
push DWORD [num1]
call sum
add esp, 8

add eax, ebx
dec eax

; function epilogue
mov esp, ebp ; restore the old stack pointer (deallocate memory)
pop ebp ; restore old frame pointer

mov eax, 1
mov ebx, 0
int 0x80


sum:
; function prologue
push ebp ; save the old frame pointer
mov ebp, esp ; set current frame pointer to the stack pointer

push ebx ; caller saved register
mov ebx, [ebp + 8]
mov eax, [ebp + 12]
add eax, ebx
pop ebx ; caller saved register being restored

; function epilogue
mov esp, ebp ; restore the old stack pointer (deallocate memory)
pop ebp ; restore old frame pointer

ret
