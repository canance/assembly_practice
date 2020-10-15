#include <stdio.h>
#include <string.h>

struct Student{
	char fName[20];
	char lName[20];
	int gpa;
};

int main(){
	struct Student myStudent;
	strcpy(myStudent.fName, "Alice");
	strcpy(myStudent.lName, "Smith");
	myStudent.gpa = 4;

	printf("Name: %s %s\nGPA: %d\n", myStudent.fName, myStudent.lName, myStudent.gpa);

}