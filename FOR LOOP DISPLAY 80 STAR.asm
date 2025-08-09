.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,80
    MOV AH,2
    MOV DL,'*'
    
REPEAT:
    INT 21H
    LOOP REPEAT 
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN
    
    




