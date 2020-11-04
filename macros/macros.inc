%macro intAdd 3
  mov eax, DWORD [%2]
  add eax, DWORD [%3]
  mov DWORD [%1], eax
%endmacro

%macro intSub 3
  mov eax, DWORD [%2]
  sub eax, DWORD [%3]
  mov DWORD [%1], eax
%endmacro

%macro intMul 3
  mov eax, DWORD [%2]
  mul DWORD [%3]
  mov DWORD [%1], eax
%endmacro
