.MODEL SMALL
.STACK 100H
.DATA
    x DB 0
    y DB 0
    c DB 0
    msg1 DB 'Enter value of x (0-9): $'
    msg2 DB 13,10, 'Enter value of y (0-9): $'
    msg3 DB 13,10, 'Enter value of C (0=Min, 1=Max): $'
    msgMin DB 13,10, 'Minimum value = $'
    msgMax DB 13,10, 'Maximum value = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ;Input x
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV x, AL

    ;Input y
    LEA DX, msg2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV y, AL

    ;Input C
    LEA DX, msg3
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV c, AL

    ;Check C
    CMP c, 0
    JE FIND_MIN
    JMP FIND_MAX

FIND_MIN:
    MOV AL, x
    CMP AL, y
    JLE MIN_X
    MOV AL, y
MIN_X:
    ADD AL, 30H
    MOV BL, AL

    LEA DX, msgMin
    MOV AH, 9
    INT 21H

    MOV DL, BL
    MOV AH, 2
    INT 21H
    JMP END_PROG

FIND_MAX:
    MOV AL, x
    CMP AL, y
    JGE MAX_X
    MOV AL, y
MAX_X:
    ADD AL, 30H
    MOV BL, AL

    LEA DX, msgMax
    MOV AH, 9
    INT 21H

    MOV DL, BL
    MOV AH, 2
    INT 21H

END_PROG:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

