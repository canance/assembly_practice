; find str2 in str1

section .data
str1: db "The quick brown fox jumped over the lazy dog."
str1_len: equ ($-str1)
str2: db "d"
fmt_str: db "ecx = %d", 0xa, 0
fmt_str2: db "Not found", 0xa, 0
fmt_str3: db "Found", 0xa, 0

section .text
global main
extern printf
extern exit

main:
mov edi, str1 ; put string to search in edi
xor eax, eax ; zero out eax
mov al, BYTE [str2] ; put byte to search for in al
mov ecx, str1_len
cld
repne scasb ; repne scasb

pushf ; save flags

push ecx
push fmt_str
call printf
add esp, 8

popf ; restore flags

jnz not_found
; found
push fmt_str3
call printf
add esp, 4

jmp done

not_found:
push fmt_str2
call printf
add esp, 4

done:
push 0
call exit
