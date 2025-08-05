.model small
.stack 200h  ;stack size 200h
.data
.code        
main proc    ;start the process
    mov ah,1
    int 21h   
    mov bl,al;To take the input 1st
    
    mov ah,1 
    int 21h
    mov bh,al ;To take the input 2nd
     
    mov ah,2
    mov dl,bl  
    int 21h   ;To print 1st inputed number
    
    mov ah,2
    mov dl,bh
    int 21h   ;To print 2nd inputed number 
    
    main endp ;end the process
end main




