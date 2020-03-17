; caracteres que se pueden modificar
; byte 1
; palabra 2
; dword 4

sección .data
    msj db "Desplegar los asteriscos 9 veces" , 10
    len equ $ - msj

sección .text
     inicio global

_comienzo:

    mov eax , 4  
    mov ebx , 1  
    mov ecx , msj 
    mov edx , len 
    int 80h 

    mov [ msj ], dword 'HOLA' 

    mov eax , 4  
    mov ebx , 1  
    mov ecx , msj 
    mov edx , len 
    int 80h 

    mov [ msj + 15 ], dword '****' 

    mov eax , 4  
    mov ebx , 1  
    mov ecx , msj 
    mov edx , len 
    int 80h 

    mov eax , 1  
    int 80h 