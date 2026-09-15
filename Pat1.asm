include 'EMU8086.inc'
.Model
.Stack 100h
.data
    
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    ;           *
    ;           **
    ;           ***
    ;           ****
    ;           *****

    mov ah,1h
    int 21h
    sub al,'0'
    mov ah,0h
    mov cx,ax 
    printn  
    
    mov ax,1h
    outer:
        push cx
        mov cx,ax
        inner: 
            print "*"
            loop inner
        printn
        inc ax
        pop cx
        loop outer
        
    
        
    


    main endp
end main
