.model small              ; Define memory model as small (code and data fit in one segment)
.stack 100h              ; Reserve 256 bytes for the stack

.data  
msg  dw "a is greater $" ; Message to display if a > b
msg2 dw "b is greater $" ; Message to display if b > a

.code

main proc   
    mov ax, @data        ; Load address of data segment into AX
    mov ds, ax           ; Initialize DS with AX (DS points to data segment)
    
    mov ah, 1            ; DOS function: Read a character from keyboard
    int 21h              ; Wait for user input
    ;sub al, 30H         ; Uncomment if you want to convert ASCII to decimal (not needed)
    mov bl, al           ; Store first input character in BL (value of 'a')
    
    mov ah, 1            ; DOS function: Read second character
    int 21h              ; Wait for second input
    ;sub al, 30H         ; Uncomment if converting ASCII to number (optional) 
    ;add al, 30h=> Decemal to ASCII
    mov cl, al           ; Store second input character in CL (value of 'b')
    
    cmp bl, cl           ; Compare BL and CL (a vs b)
    JG aisGreater        ; If BL > CL, jump to 'aisGreater' label
    JL bisGreater        ; If BL < CL, jump to 'bisGreater' label

aisGreater:
    mov ah, 9            ; DOS function: Display string
    lea dx, msg          ; Load address of message "a is greater"
    int 21h              ; Display the message
    jmp exit             ; Jump to program end

bisGreater:
    mov ah, 9            ; DOS function: Display string
    lea dx, msg2         ; Load address of message "b is greater"
    int 21h              ; Display the message

exit:
    mov ah, 4Ch          ; DOS function: Terminate program
    int 21h

main endp
end main
