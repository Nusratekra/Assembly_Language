.model small
.stack 100h

.data
msg1 db 'Your Uni name: $' ; uap

.code
main proc
    
    ;initialize ds
    mov ax , @data
    mov ds , ax
    
    ;display the msg1
    mov ah , 9
    lea dx , msg1
    int 21h
    
    ;taking input 1
    mov ah , 1
    int 21h
    mov bl , al
    
    ;taking input 2
    mov ah , 1
    int 21h
    mov bh , al
    
    ;taking input 3
    mov ah , 1
    int 21h
    mov cl , al
;new line
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    ;display input 1
    mov ah , 2
    mov dl , bl
    int 21h 
    
    ;new line
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    ;display input 2
    mov ah , 2
    mov dl , bh
    int 21h 
 ;new line
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    ;display input 3
    mov ah , 2
    mov dl , cl
    int 21h 
    
    exit:        ;end of the instruction
    mov ah , 4ch
    int 21h
    main endp
end main




