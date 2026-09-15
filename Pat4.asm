include 'EMU8086.inc'
.Model
.Stack 100h
.data
    
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    ;           1
    ;           1 2
    ;           1 2 3 
    ;           1 2 3 4 
    ;           1 2 3 4 5

    mov ah,1h
    int 21h
    sub al,'0'
    mov ah,0h
    mov cx,ax 
    printn  
    
    mov ax,1h
    outer:
        push cx 
        mov bl,'1' 
        
        mov cx,ax 
        push ax
        inner1: 
            mov ah,2h
            mov dl,bl
            int 21h
            print " " 
            inc bl
            loop inner1 
        printn
        pop ax
        inc ax
        pop cx
        loop outer
        
    
        
    


    main endp
end main
