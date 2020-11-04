#include <stdio.h>

int main(){
  float var1 = 3.14;
  float var2;

  // var2 = var1 + 2
  asm(
     ".intel_syntax noprefix \n\t"
     "finit \n\t"
     "fld %[var1] \n\t"
     "mov %[var2], 2 \n\t"
     "fild %[var2] \n\t"
     "fadd st(0), st(1) \n\t"
     "fstp %[var2] \n\t"
     : [var2] "+m" (var2)
     : [var1] "m" (var1)
     : 
  );

  printf("var1 = %f\n", var1);
  printf("var2 = %f\n", var2);
}
