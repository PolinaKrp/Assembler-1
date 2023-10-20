%include "io64.inc"  

section .bss 
    string resd 255 
    
section .rodata 
    surname: db "Karpacheva", 0

section .text
    global main
    
    main:
        mov rbp, rsp; for correct debugging
        PRINT_STRING "String: "
        GET_STRING[string], 256
        PRINT_STRING[string]
        NEWLINE 
        PRINT_STRING "Surname: "
        PRINT_STRING[surname]
        NEWLINE
        mov esi, string
        mov al, byte [surname]
        mov al, 'K' 
        ;cmp al, 'K' 
        jb done 
        add al, 32 
    done:
    
    to_lower:
        mov bl, al
        xor ecx, ecx

    loop_start:
        lodsb
        cmp al, "A"
        jl skip
        cmp al, 'Z'
        jg check
        add al, 32
        
    check:
        cmp al, bl
        jne skip
        inc ecx
        
    skip:
        cmp al, 0
        jne loop_start
        
    fill:
        PRINT_STRING "Number:"
        PRINT_DEC 4, ecx
        NEWLINE
        
    end:
        xor eax, eax            
        ret 