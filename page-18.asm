.MODEL SMALL
.STACK 100H
.DATA 
    x DB 0
    msgO DB 'o$'
    msgE DB 'e$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV x,AL

    CMP AL, 1
    JE  PRINT_O
    CMP AL, 3
    JE  PRINT_O
    CMP AL, 2
    JE  PRINT_E
    CMP AL, 4
    JE  PRINT_E

    JMP END_PROGRAM

PRINT_O:
    LEA DX,msgO
    MOV AH, 09H
    INT 21H
    JMP END_PROGRAM

PRINT_E:
    LEA DX,msgE
    MOV AH, 09H
    INT 21H

END_PROGRAM:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN