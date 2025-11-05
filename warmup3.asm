.MODEL SMALL
.STACK 100H
.DATA
x DB ?
y DB ?
msgInvalid DB 13,10,'Invalid Input$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,1
    INT 21H
    SUB AL,30H        
    MOV x,AL

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV y,AL

    MOV AL,y
    CMP AL,1
    JE Y_IS_1
    CMP AL,2
    JE Y_IS_2
    CMP AL,3
    JE Y_IS_3
    CMP AL,4
    JE Y_IS_4
    JMP INVALID

Y_IS_1:
    MOV AL,x
    ADD AL,0
    JMP PRINT_RESULT

Y_IS_2:
    MOV AL,x
    ADD AL,2
    JMP PRINT_RESULT

Y_IS_3:
    MOV AL,x
    ADD AL,4
    JMP PRINT_RESULT

Y_IS_4:
    MOV AL,x
    ADD AL,6
    JMP PRINT_RESULT

INVALID:
    LEA DX,msgInvalid
    MOV AH,9
    INT 21H
    JMP EXIT

PRINT_RESULT:
    ADD AL,30H       
    MOV DL,AL
    MOV AH,2
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN