.model small
.stack 100h
.data
 x db 0
 y db 0
 z db 0

 msg1 db 'Enter the value of x: $'
 msg2 db 13,10,'Enter the value of y: $'
 msg3 db 13,10,'Enter the value of z (0=ADD, 1=SUB): $'
 msgAdd db 13,10,'x + y = $'
 msgSub db 13,10,'x - y = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; input x
    lea dx, msg1
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 30h
    mov x, al

    ; input y
    lea dx, msg2
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 30h
    mov y, al 

    ; input z
    lea dx, msg3
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, 30h
    mov z, al

    ; check z
    cmp z, 0
    je do_add
    jmp do_sub

do_add:
    mov al, x
    add al, y
    add al, 30h
    lea dx, msgAdd
    mov ah, 9
    int 21h
    mov dl, al
    mov ah, 2
    int 21h
    jmp end_program 

do_sub:
    mov al, x
    sub al, y
    add al, 30h
    lea dx, msgSub
    mov ah, 9
    int 21h
    mov dl, al
    mov ah, 2
    int 21h

end_program:
    mov ah, 4ch
    int 21h
main endp
end main
