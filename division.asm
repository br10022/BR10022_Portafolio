section .data
    num1 dd 100         ; Dividendo (32 bits)
    num2 dd 25          ; Divisor (32 bits)
    msg db "Resultado: ", 0
    newline db 10, 0

section .bss
    result resd 1

section .text
    global _start

_start:
    mov eax, [num1]     ; Cargar dividendo en eax
    xor edx, edx        ; Limpiar edx (por si hay residuos anteriores)
    mov ebx, [num2]     ; Cargar divisor en ebx
    div ebx             ; División: eax / ebx -> resultado en eax, residuo en edx

    mov [result], eax   ; Guardar el resultado

    ; Convertir a ASCII y mostrar (solo válido si el resultado < 10)
    add eax, '0'
    mov [result], eax

    ; Mostrar "Resultado: "
    mov ecx, msg
    call print_string

    ; Mostrar el número
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ; Salida
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Subrutina para imprimir cadenas
print_string:
    mov eax, 4
    mov ebx, 1
.next:
    mov al, [ecx]
    cmp al, 0
    je .done
    mov eax, 4
    mov edx, 1
    int 0x80
    inc ecx
    jmp .next
.done:
    ret
