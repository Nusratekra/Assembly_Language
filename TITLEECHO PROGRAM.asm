.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
    
    MOV AH,2  ;to display chracter intput '?'
    MOV DL,'?'
    INT 21H 
    
    MOV AH,1  ;to take a input and save it
    INT 21H
    MOV BL,AL 
    
    MOV AH,2   ;newline code
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,2   ;to print the input value which is in bl
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH ;exit (return 0)
    INT 21H 
    
    
MAIN ENDP
END MAIN
    
    




