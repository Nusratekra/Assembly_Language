.MODEL SMALL
.STACK 100H
.DATA
MSG DB "Even the moon takes time to be full!$"
.CODE
MAIN PROC
    MOV AX, @DATA ;initialize data segment
    MOV DS,AX
    
    LEA DX,MSG    ;display the string
    MOV AH,9
    INT 21H
    
    MOV AH,4CH    ; tarminate
    INT 21H
    
MAIN ENDP
END MAIN
