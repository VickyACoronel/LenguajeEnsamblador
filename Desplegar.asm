sección .data
    msj db "Desplegar los asteriscos 9 veces" , 10   ; 
    len equ $ - msj
    asterisco times 9 db 10 , '*' ; se va a repetir 9 veces el asterisco 
    len_asterisco equ $ - asterisco

sección .text
     inicio global

_comienzo:

    mov eax , 4  
    mov ebx , 1  
    mov ecx , msj 
    mov edx , len 
    int 80h 

    mov eax , 4  
    mov ebx , 1  
    mov ecx , asterisco 
    mov edx , len_asterisco 
    int 80h 

    mov eax , 1  
    int 80h 