.model small
.stack 100h

.data
msg1 db 'Enter two numbers: $'
msg2 db 'The entered value is: $'
num1 db 1

num2 db ?

.code
main proc
    ;initialize ds
    mov ax , @data
    mov ds , ax
    
    ;printing msg1 
    mov ah , 9
    lea dx , msg1
    int 21h 
    
    ;display defined num1
    mov ah, 2   
    add num1, 48
    mov dl, num1
    int 21h 
    
     
    ;taking input and store it to num2
     mov ah, 1
     int 21h
     mov num2, al 
       
  
     ;newline(also can be 10,13)
     mov ah, 2
     mov dl, 10
     int 21h
     mov dl, 13
     int 21h
     
     ;display msg2
     mov ah, 9
     lea dx, msg2
     int 21h  
     
     ;display num1
     mov ah, 2
     mov dl, num1
     int 21h
     
     ;display num2
     mov ah, 2
     mov dl, num2
     int 21h
    
    exit:
    mov ah , 4ch
    int 21h
    main endp
end main




