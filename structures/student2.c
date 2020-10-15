#include <stdio.h>
#include <string.h>

struct Student{
	char fName[20];
	char lName[20];
	int gpa;
};

int main(){
	struct Student myStudent;

  printf("First name: ");
  scanf("%s", myStudent.fName);
  printf("Last name: ");
  scanf("%s", myStudent.lName);
  printf("GPA: ");
  scanf("%d", &myStudent.gpa);

	printf("Name: %s %s\nGPA: %d\n", myStudent.fName, myStudent.lName, myStudent.gpa);

}
