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

section .data

  mjs db 10 , 'Carperta o directorio creado' , 10  
  lenMsj equ $ - mjs
  
  msjPath db 'Ingrese el directorio donde quiere guardar:'
  lenPath equ $ - msjPath

  archivo db '/home/Documentos/Ensamblador/codigo.txt',0
  
sección .bss
  
  ruta resb 1
  texto resb 35
  idarchivo resb 1

sección .text
   inicio global

_start:

  escribir msjPath , lenPath
  leer ruta , 50 

  mov eax , 39       ; servicio para crear un directorio  
  mov ebx , path   ; Definir la ruta del servicio 
  mov ecx , 0x1FF    ; Definir el permiso 777  
  int 80h 
  
  escribir mjs , lenMsj


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

  jmp salir

error:
  escribir mensaje_error, len_error

salir:
  mov eax , 1  
  int 80h 