include 'EMU8086.inc'
.Model
.Stack 100h
.data
  x db ?
  a db ?
  b db ?  
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    print "Enter number x and range [a b]: "
    mov ah,1h
    int 21h
    sub al,'0'
    mov x,al
    int 21h
    int 21h
    sub al,'0'
    mov a,al 
    int 21h
    int 21h
    sub al,'0'
    mov b,al
    printn  
    
    mov cx,0h
    mov cl,b
    mov bl,a
    outer:
        push cx 
        mov cl,x
        mov bh,1h   
        print "Multiplication table for: "
        mov ah,2h 
        mov dl,bl
        add dl,'0'
        int 21h
        printn
        inner:
            mov ah,2h
            mov dl,bl
            add dl,'0'
            int 21h
            print " X "
            mov dl,bh
            add dl,'0'
            int 21h 
            inc bh
            printn
            loop inner
            
        printn
        inc bl
        pop cx
        cmp cl,a
        jle break
        loop outer  
        
        
    break:    
    
        
    


    main endp
end main
