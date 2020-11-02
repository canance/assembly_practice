#include <stdio.h>

int main(){
  int var1 = 12;
  asm ("int $3");
  printf("Hello world!\n var1 = %d\n", var1);
  return 0;
}
