#include <stdio.h>

int main(){

  int var1 = 12;
  int var2 = 10;

  asm(
    ".intel_syntax noprefix \n\t"
    "mov eax, %[var1] \n\t"
    "add eax, %[var2] \n\t"
    "mov %[var1], eax \n\t"
    "inc %[var2] \n\t"
    : [var1] "+r" (var1), [var2] "+r" (var2) 
    : 
    : "eax"
  );

  printf("var1 = %d\n", var1);
  printf("var2 = %d\n", var2);

  return 0;
}
