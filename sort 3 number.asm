include 'EMU8086.inc'
.Model
.Stack 100h
.data
    
.code
    main proc

    mov ax, @data
    mov ds,ax

    mov ah,1h
    int 21h 
    sub al,'0'
    mov bh,al
    int 21h
    int 21h
    sub al,'0'
    mov bl,al 
    int 21h
    int 21h
    sub al,'0'
    printn
       
    cmp al,bh
    jle ok1
    xchg al,bh
    
    ok1:
    cmp al,bl
    jle ok2
    xchg al,bl
     
    ok2:
    cmp bh,bl
    jge ok
    xchg bh,bl
    ok:
    mov ah, 2h
    mov dl,al
    add dl,'0'
    int 21h
    print " "
    mov dl,bl
    add dl,'0'
    int 21h
    print " "
    mov dl,bh
    add dl,'0'
    int 21h
    print " "
    
        
    


    main endp
end main
