#include <stdio.h>

void multiply(int*, int, int);

int main(){

	int x, a, b;

	printf("Number: ");
	scanf("%d", &a);

	printf("Number: ");
	scanf("%d", &b);

	multiply(&x, a, b);

	printf("x = %d\n", x);

	return 0;
}

void multiply(int* result, int a, int b){
	*result = a * b;
}

