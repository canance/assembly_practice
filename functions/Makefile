func_c: func.c
	gcc -m32 func.c -o func_c -g -fno-stack-protector -fcf-protection=none -O0 -fno-pie

func_asm: func.asm
	gcc -m32 -masm=intel func.c -o func_asm -g -fno-stack-protector -fcf-protection=none -O0 -fno-pie -S
clean:
	-@rm func_asm func_c *.o 2>/dev/null || true 
