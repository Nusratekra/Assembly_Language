.MODEL SMALL
.STACK 100H

.DATA
    msg DB 0DH,0AH, 'Enter a number (1–4): $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt message
    LEA DX, msg
    MOV AH, 9
    INT 21H

    ; Read character input
    MOV AH, 1
    INT 21H
    SUB AL, 30H       ; Convert ASCII to number

    ; CASE check for 1 or 3
    CMP AL, 1
    JE ODD

    CMP AL, 3
    JE ODD

    ; CASE check for 2 or 4
    CMP AL, 2
    JE EVEN

    CMP AL, 4
    JE EVEN

    ; Default: end (invalid input)
    JMP END_CASE

ODD:
    MOV DL, 'o'
    JMP DISPLAY

EVEN:
    MOV DL, 'e'
    JMP DISPLAY

DISPLAY:
    MOV AH, 2
    INT 21H

END_CASE:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN



