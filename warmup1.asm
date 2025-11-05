.MODEL SMALL
.STACK 100H
.DATA
    x DB 0
    y DB 0
    z DB 0
    msgAdd DB 13,10,'Result of X + Y = $'
    msgSub DB 13,10,'Result of X - Y = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV x, AL

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV y, AL

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV z, AL

    CMP z, 0
    JE DO_ADD
    JMP DO_SUB

DO_ADD:
    LEA DX, msgAdd      
    MOV AH, 9
    INT 21H
    MOV AL, x
    MOV BL, y
    ADD AL, BL         
    ADD AL, 30H        
    MOV DL, AL
    MOV AH, 2
    INT 21H
    JMP END_PROG

DO_SUB:
    LEA DX, msgSub    
    MOV AH, 9
    INT 21H
    MOV AL, x
    MOV BL, y
    SUB AL, BL         
    ADD AL, 30H        
    MOV DL, AL
    MOV AH, 2
    INT 21H

END_PROG:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
