section .data
file_name: db "test.txt", 0
buffer_len: equ 20
output: db "CONTENTS", 0xa, "--------", 0xa, 0xa, 0
output_len: equ ($ - output)


section .bss
file_handle: resd 1
buffer: resb buffer_len

section .text
global main
main:

; syscall open --> create a file descriptor
mov eax, 5
mov ebx, file_name
mov ecx, 0x0 ; 0 = O_RDONLY (read only)
mov edx, 0 ; file permissions (this only matters if we are creating a new file)
int 0x80

mov DWORD [file_handle], eax

; syscall read --> read from a file descriptor
mov eax, 3
mov ebx, DWORD [file_handle]
mov ecx, buffer
mov edx, buffer_len
int 0x80

; syscall close --> close file descriptor
mov eax, 6
mov ebx, DWORD [file_handle]
int 0x80

; syscall write --> write to a file descriptor (terminal)
mov eax, 4
mov ebx, 1 ; stdout
mov ecx, output
mov edx, output_len
int 0x80

; syscall write file contents
mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, buffer_len
int 0x80

done:
mov eax, 1
mov ebx, 0
int 0x80

