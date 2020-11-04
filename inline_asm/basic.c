#include <stdio.h>

int main(){
  int var1 = 12;
  /*
  Basic asm assumes no changes to general purpose registers.
  It can also be problematic when accessing global variables.
  Try to avoid it and use extended asm instead.
  */
  asm volatile(".intel_syntax noprefix \n\t"
       "int 3 \n\t"
       "mov eax, 5 \n\t");
  printf("Hello world!\n var1 = %d\n", var1);
  return 0;
}
