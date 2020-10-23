g++ -m32 -g -c Program_8.1_Win_Linux.cpp
nasm -f elf32 Program_8.1_NASM_32.asm
g++ -m32 -o Program_8.1 Program_8.1_NASM_32.o Program_8.1_Win_Linux.o
