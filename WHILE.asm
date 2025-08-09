; WHILE Loop – Count characters until Enter
.model small
.stack 100h
.data
count db 0       ; store counter as BYTE for easier printing
.code
main PROC
    mov ax, @data
    mov ds, ax    ; setup data segment

    mov count, 0  ; start counter at 0

while_loop:
    mov ah, 1     ; read one character from keyboard
    int 21h       ; AL = ASCII code of the character

    cmp al, 0Dh   ; Enter key? (0Dh = carriage return)
    je end_while

    inc count     ; increase counter
    jmp while_loop

end_while:
    mov al, count ; load counter value into AL
    add al, 30h   ; convert to ASCII digit
    mov dl, al    ; move into DL for printing
    mov ah, 2     ; DOS print-char function
    int 21h

    mov ah, 4Ch   ; exit
    int 21h
main ENDP
end main
