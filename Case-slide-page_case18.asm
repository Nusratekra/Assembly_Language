; If AL = 1 or 3 ? display "o"
; If AL = 2 or 4 ? display "e"

.model small
.stack 100h
.data
.code
main PROC
    mov ax, @data
    mov ds, ax

    ; Example: initialize AL here
    mov al, 3       ; Change this value for testing

    cmp al, 1
    je print_o       ; AL = 1 ? 'o'
    cmp al, 3
    je print_o       ; AL = 3 ? 'o'
    cmp al, 2
    je print_e       ; AL = 2 ? 'e'
    cmp al, 4
    je print_e       ; AL = 4 ? 'e'

    jmp end_prog     ; If AL not 1-4 ? skip printing

print_o:
    mov dl, 'o'
    mov ah, 2
    int 21h
    jmp end_prog

print_e:
    mov dl, 'e'
    mov ah, 2
    int 21h
    jmp end_prog

end_prog:
    mov ah, 4Ch
    int 21h
main ENDP
END main




