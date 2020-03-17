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

    asterisco db "*"
    espacio db '' , 10

sección .bss
    numero resb 1

sección .text
     inicio global
_comienzo:
    escribir msjN , lenN
    leer numero , 1 
    mov eax , [ numero ]  
    mov ebx , [ numero ]  
    sub eax , '0'  
    sub ebx , '0'  
    jmp fila

fila:
    empujar eax 
    empujar ebx 
    escribir asterisco , 1
    pop ebx 
    pop eax 

    dec eax 

    cmp eax , 0  
    jz columna
    jmp fila

columna:
    dec ebx 
    empujar ebx 
    escribir espacio , 1
    pop ebx 
    mov eax , [ numero ]  
    sub eax , '0'  
    cmp ebx , 0 
    jz salir
    jmp fila



salir:
    mov eax , 1  
    int 80h 