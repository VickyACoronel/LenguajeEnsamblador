%macro escribir %2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	archivo db '/home/Documentos/Ensamblador/codigo.txt',0

section .bss
	texto resb 35
	idarchivo resb 1

section .text
	global _start
	_start:

	mov eax, 3
	mov ebx, 2
	mov ecx, texto
	mov edx, 35
	int 80h

	mov eax, 8
	mov ebx, archivo
	mov ecx, 1 ;modos de acceso de archivo read, write
				;read-only = 0
				;write-only = 1
				;RDWR = 2
	mov edx, 0x1FF ; 777 en octal
	int 80h

	test eax, eax
	jz error

	;****** asignar el id del archivo ******
	mov dword [idarchivo], eax

	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 35
	int 80h

error:
	escribir mensaje_error, len_error

salir:
	mov eax, 1
	int 80h






