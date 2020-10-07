int somefunction(int x, int y){
	int z = 0;
	x = x - 2;
	y++;
	z = x * y;
	return z;
}

int main(){
	somefunction(7, 5);
}
