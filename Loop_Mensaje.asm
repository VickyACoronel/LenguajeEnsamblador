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
    msjN db "Ingrese un numero:" , 10
	lenN equ $ - msjN

    msj db "Saludos" , 10
	len equ $ - msj

    msj1 db 10 , "Mensaje"
	len1 equ $ - msj1

    asterisco db "*"
    espacio db '' , 10

sección .bss
    aux resb 2
    n resb 2

sección .text
     inicio global
_comienzo:
    mov ecx , 30 
ciclo:
    empujar ecx 
    mov al , cl  
    mov cl , 10  
    div cl 
    agregar hacha , "00"  
    mov [ aux ], eax  
    escribir msj1 , len1
    escribir aux , 2 
    escribir msj , len
    pop ecx 
    ciclo de bucle

salir:
    mov eax , 1  
    int 80h 