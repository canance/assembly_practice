#include <stdio.h>

int main(){

  int var1 = 12;
  int var2 = 10;

  asm(
    ".intel_syntax noprefix \n\t"
    "mov eax, %0 \n\t"
    "add eax, %1 \n\t"
    "mov %0, eax \n\t"
    : "+r" (var1) /* + means read & written */
    : "r" (var2)
    : "eax"
  );

  printf("var1 = %d\n", var1);
  printf("var2 = %d\n", var2);

  return 0;
}
