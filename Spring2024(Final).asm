.MODEL SMALL
.STACK 100H
.DATA
    x DB 0
    y DB 0
    z DB 0
    c DB 0
    msgMin DB 13,10,'Minimum value = $'
    msgMax DB 13,10,'Maximum value = $'

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

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV z,AL

    ; --- Input C (0=Min,1=Max) ---
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV c,AL

    ; --- Check operation ---
    CMP c,0
    JE FIND_MIN
    JMP FIND_MAX

FIND_MIN:
    MOV AL,x
    CMP AL,y
    JLE NEXT1
    MOV AL,y
NEXT1:
    CMP AL,z
    JLE MIN_DONE
    MOV AL,z
MIN_DONE:
    ADD AL,30H
    MOV BL,AL

    LEA DX,msgMin
    MOV AH,9
    INT 21H

    MOV DL,BL
    MOV AH,2
    INT 21H
    JMP END_PROG

FIND_MAX:
    MOV AL,x
    CMP AL,y
    JGE NEXT2
    MOV AL,y
NEXT2:
    CMP AL,z
    JGE MAX_DONE
    MOV AL,z
MAX_DONE:
    ADD AL,30H
    MOV BL,AL

    LEA DX,msgMax
    MOV AH,9
    INT 21H

    MOV DL,BL
    MOV AH,2
    INT 21H

END_PROG:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
