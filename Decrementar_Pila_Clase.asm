% macro escribir  2
    mov eax , 4  
    mov ebx , 1  
    mov ecx , % 1 
    mov edx , % 2 
    int 80h 
% endmacro

% macro leer  2
  mov eax , 3  
  mov ebx , 0  
  mov ecx , % 1 
  mov edx , % 2 
  int 80h 
% endmacro

sección .data
    msjN db "Escribe un numero:" ,
	lenN equ $ - msjN
    espacio db '' , 10

sección .bss
    numero resb 1

sección .text
     inicio global
_comienzo:
    escribir msjN , lenN
    leer numero , 1 
    jmp imprimir

principal:
    cmp cl , 0  
    jz salir
    jmp imprimir

imprimir:
    mov eax , [ numero ]  
    empujar eax 
    escribir numero , 1  
    escribir espacio , 1

    pop eax 
    sub eax , '0' 
    dec eax 
    mov ecx , eax  
    agregue eax , '0'  
    mov [ numero ], eax  

    cmp ecx , - 1  
    jz salir
    jmp imprimir

salir:
    mov eax , 1  
    int 80h 