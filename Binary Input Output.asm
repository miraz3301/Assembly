include 'EMU8086.inc'
.Model
.Stack 100h
.data
  cpy dw ?  
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    mov bx,0h
    print "Binary Input: "
    
    input:
        mov ah,1h
        int 21h
        cmp al, 0dh
        je done
        sub al,'0' 
        shl bx,1h 
        mov ah,0h
        add bx,ax
        jmp input
 
    done:  printn
    print "Binary Output: "  
    mov cpy,bx  
    cmp bx,0h
    je zero 
    mov cx,16d
    handleZero:
        shl bx,1h
        jc outt
        loop handleZero 
    
    
        
     outt: 
     print "1"
     dec cx
     cmp cx,0h
     je last
     output:
            shl bx,1h
            jc p1
            print "0"
            jmp next
            p1: print "1"
            next:
            loop output  
            
    jmp last
    zero: print "0" 
    last:
    
    mov bx,cpy    ; Now you can do your next work
    
    
    main endp
end main
