.model small
.stack 100h
.data
msg1 db "UAP Assembly code $" 
num2 db 4  
num3 db ?   ;not assign value in the variable  
.code

main proc
    
    mov ax, @data ;initialize data segment
    mov ds, ax
    
    ;printing msg1
    mov ah, 9
    lea dx, msg1
    int 21h 
    
    ;newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    ;printing num2
    mov ah, 2 
    add num2, 48
    mov dl, num2
    int 21h  
    
    ;newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
;taking user input
    mov ah, 1
    int 21h
    mov num3, al  
    
     ;newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    ;display user input
    mov ah, 2
    mov dl, num3
    int 21h
    
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp

end main



