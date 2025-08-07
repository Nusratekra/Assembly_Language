.MODEL SMALL
.STACK 100h

.DATA
    count DB 0      ; Inner loop counter: how many times to print the number
    number DB 0     ; The number we want to print

.CODE
MAIN:
    MOV AX, @DATA   ; Initialize data segment
    MOV DS, AX

    MOV BL, 1       ; Start from number 1
    MOV CX, 5       ; We want to print 5 lines

NEXT_LINE:
    MOV count, BL   ; Set how many times to print this number
    MOV number, BL  ; Set the current number to print

PRINT_LOOP:
    MOV AH, 2       ; DOS function to print a character
    MOV DL, number
    ADD DL, '0'     ; Convert number to ASCII character
    INT 21h         ; Print character to screen

    DEC count       ; Decrease print count
    JNZ PRINT_LOOP  ; If count not zero, repeat printing

    ; Print a newline (Carriage Return + Line Feed)
    MOV AH, 2
    MOV DL, 13      ; Carriage Return (CR)
    INT 21h
    MOV DL, 10      ; Line Feed (LF)
    INT 21h

    INC BL          ; Go to the next number (2, 3, 4, etc.)
    LOOP NEXT_LINE  ; Repeat for the next line

    ; Exit the program
    MOV AH, 4Ch
    INT 21h

END MAIN
