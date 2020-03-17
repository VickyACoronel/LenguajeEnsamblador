  
% macro escribir 2
    mov eax , 4  
    mov ebx , 1  
    mov ecx , % 1 
    mov edx , % 2 
    int 80h 
% endmacro

% macro leer 2
    mov eax , 3  
    mov ebx , 2  
    mov ecx , % 1 
    mov edx , % 2 
    int 80h 
% endmacro

sección .data
    msjN1 db 'Ingrese el primer numero:'
    lenN1 equ $ - msjN1
    
    msjN2 db 'Ingrese el segundo numero:'
    lenN2 equ $ - msjN2

    msjN3 db 'Ingrese el tercer numero:'
    lenN3 equ $ - msjN3

    mjsIgual db 'Es igual' , 10
    lenIgual equ $ - mjsIgual

    mjsNoIgual db 'No igual' , 10
    lenNoIgual equ $ - mjsNoIgual

sección .bss
    n1 resb 2
    n2 resb 2
    n3 resb 2

sección .text
     inicio global
_comienzo:
    
    escribir msjN1 , lenN1
    leer n1 , 2 

    escribir msjN2 , lenN2
    leer n2 , 2 
    
    escribir msjN3 , lenN3
    leer n3 , 2 

compararSC:
    hacha mov , [ n1 ]  
    mov bx , [ n2 ]  
    sub hacha , '0'  
    sub bx , '0'  
    agregar hacha , bx  

    mov bx , [ n3 ]  
    sub bx , '0'  

    cmp al , bl  
    je esIgual
    jmp compararSA

compararSA:
    hacha mov , [ n2 ]  
    mov bx , [ n3 ]  
    sub hacha , '0'  
    sub bx , '0'  
    agregar hacha , bx  

    mov bx , [ n1 ]  
    sub bx , '0'  
    cmp al , bl  
    je esIgual
    jmp compararSB


compararSB:
    hacha mov , [ n1 ]  
    mov bx , [ n3 ]  
    sub hacha , '0'  
    sub bx , '0'  
    agregar hacha , bx  

    mov bx , [ n2 ]  
    sub bx , '0'  
    cmp al , bl  
    je esIgual
    jmp noEsIgual


esIgual:
    escribir mjsIgual , lenIgual
    jmp salir

noEsIgual:
    escribir mjsNoIgual , lenNoIgual
    jmp salir


salir:
    mov eax , 1  
    int 80h 