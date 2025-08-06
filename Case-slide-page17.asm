.MODEL SMALL
.STACK 100H

.DATA
    ; No data section needed for this logic

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -----------------------
    ; Assume AX already has a value
    ; (You can manually set it here for testing)
    ; -----------------------
    MOV AX, 5        ; ?? Change this to test different cases

    ; Compare AX with 0
    CMP AX, 0
    JL NEGATIVE       ; If AX < 0 ? go to NEGATIVE
    JE ZERO           ; If AX == 0 ? go to ZERO
    JG POSITIVE       ; If AX > 0 ? go to POSITIVE

NEGATIVE:
    MOV BX, -1        ; BX = -1
    JMP END_CASE

ZERO:
    MOV BX, 0         ; BX = 0
    JMP END_CASE

POSITIVE:
    MOV BX, 1         ; BX = 1

END_CASE:
    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
