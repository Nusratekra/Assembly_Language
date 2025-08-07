;1
;12
;123
;1234
;12345 

.STACK 100H
.DATA
    a DB 0          ; Define a variable 'a' for the inner loop counter
    num DB 0        ; Define a variable 'num' for the current number to print

.CODE
MAIN PROC
    MOV BX, 1       ; Start with 1 for the first row
    MOV CX, 5       ; Total number of rows to print

L1: 
    MOV a, BL       ; Use variable 'a' as the inner loop counter
    MOV num, 1      ; Start printing from number 1

L2: 
    MOV AH, 2       ; Prepare for DOS interrupt to print a character
    ADD num, 48     ; Convert number to ASCII (assuming 'num' is in 1-9 range)
    MOV DL, num     ; Move the ASCII value to DL for printing
    INT 21H         ; Print the number
    SUB num, 48     ; Convert back to numeric for the loop counter
    INC num         ; Increment the number to print the next digit
    DEC a           ; Decrease the inner loop counter
    JNZ L2          ; Loop until 'a' is zero

    ; Print newline
    MOV AH, 2
    MOV DL, 13      ; Carriage return
    INT 21H
    MOV DL, 10      ; Line feed
    INT 21H

    INC BX          ; Increase the current row number for the next row
    DEC CX          ; Decrease the outer row counter
    JNZ L1          ; If CX is not zero, repeat for the next row

MAIN ENDP
END MAIN



