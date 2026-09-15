include 'EMU8086.inc'
.Model
.Stack 100h
.data
  cpy dw ? 
  s dw 0h
  val dw ? 
  cnt dw 0h
.code
    main proc

    mov ax, @data
    mov ds,ax  
    
    mov bx,0h
    print "Decimal Input: "  
    mov ah,1h
    int 21h
    cmp al, '-'
    jne next
    mov cx,1h
    mov s,cx
    int 21h
    next: 
    sub al,'0'
    add bl,al
    input:
        mov ah,1h
        int 21h
        cmp al, 0dh
        je done
        sub al,'0'
        mov ah,0h
        mov val,ax
        mov ax,bx
        mov cx,10d
        mul cx
        add ax,val
        mov bx,ax
        jmp input
        
        
    
 
    done:
    mov cx,s 
    cmp cx,0h
    je now 
    neg bx
    now: printn 
    
    print "Decimal Output: "  
    mov cpy,bx  
    cmp bx,0h
    je zero
    jge forward
    print "-"
    neg bx
    forward: 
    
    store:
        cmp bx,0h
        je stredone 
        mov dx,0h
        mov ax,bx
        mov cx,10d
        div cx
        push dx
        mov bx,ax  
        inc cnt
        jmp store
        
    stredone:
    mov cx,cnt
    printt: 
        pop dx
        add dl,'0'
        mov ah,2h
        int 21h
        loop printt
        
    jmp last    
    zero: print "0"
    last:
 
    mov bx,cpy    ; Now you can do your next work
    
    main endp
end main
