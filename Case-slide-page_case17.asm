;Write an assembly program that checks if a number is negative, zero, or positive, and sets BX to -1, 0, or 1 accordingly

.model small
.stack 100h
.data
.code

main proc
    mov ax,-5
    
    cmp ax,0
    jl negative
    je zero
    jg positive
    
    
 negative:
    mov bx,-1
    jmp end_case
    
 zero: 
    mov bx,0
    jmp end_case 
        
positive:
    mov bx,1
    
end_case:
    mov ah,4ch
    int 21h
    
main endp
end main


