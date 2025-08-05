.model small
.stack 100h

.data
message db "Hello world$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5         ; We want to print "Hello world" 5 times(we defult decrement 1 each time)

print_loop:
    mov ah, 9
    lea dx, message
    int 21h

    ; New line (CR + LF)if we follow 10,13 process then the massage will start to print after 1 line
    mov ah, 2
    mov dl, 10        ; LF
    int 21h
    mov dl, 13        ; CR
    int 21h

    loop print_loop   ; Decrements CX, jumps if CX ? 0

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main




