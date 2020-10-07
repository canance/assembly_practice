#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <asm_file>"
  exit 1
fi

file="$1"
fileName="${file%.*}"
nasm -f elf32 -o "${fileName}.o" "$file"
if [ $? -ne 0 ]; then
  echo "[asm] A NASM error occured!"
  exit 1
fi
ld -e main -m elf_i386 -o "${fileName}" "${fileName}.o"
if [ $? -ne 0 ]; then
  echo "[asm] a ld error occured!"
  exit 1
fi

# clean up
rm "${fileName}.o"
