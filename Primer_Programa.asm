section .data
	mensaje db "Hola ensamblador"
	tamano equ $-mensaje

section .text
	global _start;

_start:
    mov eax , 4   ; entrada de escritura, movimiente en el registro eax el valor 4  
    mov ebx , 1   ; salida, movimiente en el registro ebx el valor 1  
    mov ecx , mensaje ; movimiente en el registro ecx del mensaje 
    mov edx , tamano ; movimiente en el registro edx del tamaño 
    int 80h ; envia Una aseñal al Sistema Operativo (SO) para ejecutar Una subrutina (Operación ESPECIFICA en el SO) ... 
            ; eax => Ejecuta la subrutina determinadas del movimiento en el eax
            ; ebx => Determina el estandar
            ; ecx => lo que desea imprimir
            ; edx => el número de caracteres de la variable mensaje

    mov eax , 1  
    int 80h 

    ;Para ejecutar:
	;- Ir a la carpeta
	;ls
	;nasm -f elf primer_programa.asm 
	;ld -m elf_i386 -s-o primer primer_programa.o
	;./primer
