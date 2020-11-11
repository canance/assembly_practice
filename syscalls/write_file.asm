section .data
file_name: db "test.txt", 0
contents: db "Hello, world!", 0xa, 0
contents_len: equ ($ - contents)
output: db "File written!", 0xa, 0
output_len: equ ($ - output)

section .bss
file_handle: resd 1

section .text
global main
main:

; syscall open --> create a file descriptor
mov eax, 5
mov ebx, file_name
; file descriptor constants can be found at usr/include/bits/fcntl.h or fcntl-linux.h
mov ecx, 0102o ; 01 = O_CREAT, 02=O_RDWR
mov edx, 0444o ; R--R--R-- permissions
int 0x80

mov DWORD [file_handle], eax

; syscall write --> write to a file descriptor
mov eax, 4
mov ebx, DWORD [file_handle]
mov ecx, contents
mov edx, contents_len
int 0x80

; syscall close --> close a file descriptor
mov eax, 6
mov ebx, DWORD [file_handle]
int 0x80

; syscall write --> write to file descriptor (terminal)
mov eax, 4
mov ebx, 1 ; stdout
mov ecx, output
mov edx, output_len
int 0x80

done:
mov eax, 1
mov ebx, 0
int 0x80

