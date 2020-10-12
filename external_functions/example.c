#include <stdio.h>

int main(){
  int age;
  char name[20];
  printf("Please enter your name: ");
  scanf("%s", name);
  printf("How old are you: ");
  scanf("%d", &age);

  printf("%s is %d years old.\n", name, age);

}



