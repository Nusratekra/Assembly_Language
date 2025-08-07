.STACK 100H
.DATA
    a DB 0          ; Define a variable 'a' for the inner loop counter

.CODE
MAIN PROC
    MOV BX, 1       ; Start with 1 asterisk in the first row
    MOV CX, 5       ; Total number of rows to print

L1: 
    MOV AL, BL      ; Move the number of asterisks to AL (temporary storage)
    MOV a, AL       ; Use variable 'a' as the inner loop counter

    MOV AH, 2       ; Prepare for DOS interrupt to print a character
    MOV DL, '*'     ; Character to print

L2: 
    INT 21H         ; Print the asterisk
    DEC a           ; Decrease the inner loop counter
    JNZ L2          ; Loop until 'a' is zero

    ; Print newline
    MOV AH, 2
    MOV DL, 10      ; Line feed
    INT 21H
    MOV DL, 13      ; Carriage return
    INT 21H

    INC BX          ; Increase the number of asterisks for the next row
    DEC CX          ; Decrease the outer row counter
    JNZ L1          ; If CX is not zero, repeat for the next row

MAIN ENDP
END MAIN



