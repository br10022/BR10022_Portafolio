; Multiplicación de dos números de 8 bits
; Ensamblador NASM - Modo real (16 bits)
org 100h        ; Código en segmento .COM (inicio en 0100h)

section .text
start:
    mov al, 5       ; Primer número (8 bits)
    mov bl, 4       ; Segundo número (8 bits)

    mul bl          ; AL * BL => resultado en AX (AL contiene el resultado, AH = 0)

    ; Mostrar resultado como número (convertido a ASCII)
    add al, '0'     ; Convierte el número a carácter ASCII (sólo válido si resultado < 10)
    mov ah, 0Eh     ; Función de teletipo de BIOS
    int 10h         ; Mostrar AL

    mov ah, 4Ch     ; Salir del programa
    int 21h
