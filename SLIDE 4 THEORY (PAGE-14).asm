;Write an assembly language program that takes two single-digit numbers from the user, compares them, and displays the greater one.

.MODEL SMALL
.STACK 100H
.DATA
A DB 0
B DB 0
msg1 DB 10, 13, 'Enter value of a: $'
msg2 DB 10, 13, 'Enter value of b: $'


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Ask for a
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1        ; Input char
    INT 21H
    SUB AL, 30H      ; Convert ASCII to number
    MOV A, AL
    
    ; Ask for b
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV B, AL
    
    ; Compare
    MOV AL, A
    MOV BL, B
    CMP AL, BL
    JNBE ELSE        ; Jump if AL > BL
    
    MOV DL, BL
    JMP DISPLAY
    
ELSE:
    MOV DL, AL
    
DISPLAY: 
    ADD DL, 30H      ; Convert back to ASCII
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
