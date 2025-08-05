.model small      ;we will take small
.stack 100h       ;stack size 100
.data
.code
main proc        ;start procedure
    mov ah,4ch   ; for exit or return 0
    int 21h      ; for exit or return 0
    main endp    ; end procedure
end main         ;end program





