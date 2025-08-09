.model small
.stack 100h
.code

main PROC
repeat_loop:
    mov ah, 1
    int 21h
    cmp al, ' '
    jne repeat_loop

    mov ah, 4Ch
    mov al, 0
    int 21h
main ENDP
end main



