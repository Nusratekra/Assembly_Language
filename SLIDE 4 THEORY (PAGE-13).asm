.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AX,-55
    
    CMP AX,0
    JNL END_IF
    
    NEG AX
    
    END_IF:
    
        MOV AH,4CH
        INT 21H
        
        
MAIN ENDP
END MAIN



