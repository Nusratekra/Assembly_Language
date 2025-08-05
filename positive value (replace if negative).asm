.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AX, -25       ; Example: AX contains a negative number

    CMP AX, 0         ; Compare AX with 0
    JNL END_IF        ; Jump to END_IF if AX is >= 0

    NEG AX            ; AX < 0, so change sign (AX = -AX)

END_IF:
    ; Continue program here (AX now holds absolute value)

    MOV AH, 4CH       ; Exit to DOS
    INT 21H

MAIN ENDP
END MAIN


