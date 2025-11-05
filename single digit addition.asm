.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter first digit: $'
    msg2 DB 13,10, 'Enter second digit: $'
    msg3 DB 13,10, 'Sum is: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Ask for first digit
    MOV AH, 9
    LEA DX, msg1
    INT 21H

    MOV AH, 1
    INT 21H          
    SUB AL, 48    
    MOV BL, AL        

    ; Ask for second digit
    MOV AH, 9
    LEA DX, msg2
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 48
    ADD BL, AL     

    ; Display message
    MOV AH, 9
    LEA DX, msg3
    INT 21H

    ; Convert to ASCII and display result
    ADD BL, 48
    MOV DL, BL
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H 
    
MAIN ENDP
END MAIN





