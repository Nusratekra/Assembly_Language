
.MODEL SMALL
.STACK 100H

.DATA                      ;variable declear
message DB "Hello World!$" ;take a string as variable

.CODE
MAIN PROC
    mov ax, @data      ; initialize data(variable) segment
    mov ds, ax

    mov ah, 9h         ; DOS function 09h - display string
    mov dx, offset message
    int 21h

    mov ax, 4C00h      ; exit program
    int 21h
MAIN ENDP
END MAIN





