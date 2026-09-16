include 'EMU8086.inc'
.Model
.Stack 100h
.data
  cpy dw ? 
  s dw 0h
  val dw ? 
  cnt dw 0h
  ind dw 0h
  rev dw 0h
  arr dw 100d dup(0h)
  
.code
    decimalInput proc
    mov s,0h    
    mov bx,0h
    mov ah,1h
    int 21h
    cmp al, '-'
    jne next
    mov cx,1h
    mov s,cx
    mov ah,1h
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
    je ll 
    neg bx
    ll:
        ret
    decimalInput endp
    
    decimalOutput proc 
    mov cnt,0h
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
        ret
    decimalOutput endp 
    
    
    main proc

    mov ax, @data
    mov ds,ax  
    
    mov cx,5h
    input1: 
        push cx
        call decimalInput
        mov ax,bx 
        mov bx,ind
        mov arr[bx],ax
        inc ind
        inc ind
        pop cx
        loop input1 
        
        
    mov cx,5h 
    lea si,arr
    mov bx,4h
    add bx,bx
    shr cx,1h
    reverse:
        mov ax,[si]
        mov dx,arr[bx]
        mov arr[bx],ax
        mov [si],dx
        add si,2h
        sub bx,2h
        loop reverse
        
        
        
    printn
    mov cx,5h
    mov ind,0h  
    output: 
        push cx
        mov bx,ind
        mov ax,arr[bx]
        mov bx,ax
        call decimalOutput 
        print " "
        inc ind
        inc ind
        pop cx
        loop output
    
    


        
    main endp
end main
