; resta_tres.asm
BITS 16

section .data
    num1 dw 20     ; Primer número
    num2 dw 7      ; Segundo número
    num3 dw 3      ; Tercer número
    resultado dw 0 ; Aquí se guarda el resultado

section .text
    global _start

_start:
    mov ax, [num1]  ; AX = num1
    sub ax, [num2]  ; AX = AX - num2
    sub ax, [num3]  ; AX = AX - num3
    mov [resultado], ax ; Guardamos el resultado

    ; Salir del programa (interrupción para DOS)
    mov ah, 0x4c
    int 0x21
