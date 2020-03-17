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
    n resb 1

sección .text
     inicio global
_comienzo:
    escribir msjN , lenN
    leer n , 1 
    escribir n , 1 
    escribir espacio , 1 
    mov cl , [ n ]  
    sub cl , '0'  
    jmp principal

principal:
    cmp cl , 0  
    jz salir
    jmp imprimir

imprimir:
    dec cl 
    empujar ecx 
    agregue cl , '0'  
    mov [ n ], cl  
    escribir n , 1 
    escribir espacio , 1 
    pop ecx 
    jmp principal


salir:
    mov eax , 1  
    int 80h 