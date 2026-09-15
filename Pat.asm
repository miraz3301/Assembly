include 'EMU8086.inc'
.Model
.Stack 100h
.data
    
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    ;           *****
    ;           ****
    ;           ***
    ;           **
    ;           *

    mov ah,1h
    int 21h
    sub al,'0'
    mov ah,0h
    mov cx,ax 
    printn  
    
    
    outer:
        push cx
        inner: 
            print "*"
            loop inner
        printn
        pop cx
        loop outer
        
    
        
    


    main endp
end main
