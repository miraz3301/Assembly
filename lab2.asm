 INCLUDE 'EMU8086.INC'
 .Model
 .Stack 100h
 .Data
    str db "Microprocessor$"
    x db ?
    m db ?
    n db ?
    val db ?
 .code
    main proc
    
    ;1.
    ;mov ax,@data
    ;mov ds,ax
    ;lea dx,str 
    ;mov ah,9h
    ;int 21h
    ;mov ah, 4ch
    ;int 21h
     
    ;2.
    ;PRINT "HELLO WORLD"
    ;mov ah, 4ch   ; FOR MEMORY USE. NOT MANDATIORY
    ;int 21h   
    
    ;3.
    ;mov cx,5
    ;for: 
        ;PRINTN "HELLO WORLD"
        ;loop for               
        
    ;4.
    ;mov cx,4
    ;l:
        ;push cx 
        ;mov cx,4
        ;print "#"
        ;i:
          ;print "="
          ;loop i
        ;printn "#"
        ;pop cx 
        ;loop l 
        
        
     ;5.
     ;mov cx,5
     ;l: 
        ;print "*"
        ;push cx 
        
        ;cmp cx,5
        ;je s
        ;cmp cx,1
        ;je s
        
        
        ;mov cx,3
        ;i:
          ;print " "
          ;loop i
        
        ;printn "*"
        ;pop cx 
        ;loop l
        
        ;s:mov cx,3
        ;j:
          ;print "*"
          ;loop j
        ;printn "*"
        ;pop cx 
        ;loop l
     
     
     ;6.
     ;PRINT "Enter the number X,M,N: " 
     ;mov ah,1h
     ;int 21h
     ;sub al,'0'
     ;mov x,al
     ;int 21h
     ;sub al,'0'
     ;mov m,al
     ;int 21h
     ;sub al,'0'
     ;mov n,al
     ;printn ""
     
     
     ;mov bl,m
     ;l: 
        ;printn "multiplication table: "
        ;mov val,bl
        ;mov bl,1h
        ;i:
          ;mov al,val
          ;add al, '0'
          ;mov dl,al
          ;mov ah,2h
          ;int 21h
          ;print " x "
          ;mov al,bl
          ;add al,'0'
          ;mov dl,al
          ;mov ah,2h
          ;int 21h
          ;printn ""  
          ;add bl,1h
          ;cmp bl,x
          ;jle i
          
       ;mov bl, val
       ;add bl,1h 
       ;cmp bl,n
       ;jle l 
       
       
       
       
       
     ;7.  
     ;mov ah,1h
     ;int 21h
     ;sub al,'0'
     ;mov dx,0h
     ;mov cx,9h
     ;mov dl,0h
     ;l:
        ;shl al,1
        ;jc i
        ;k:
        ;loop l
        
     ;printn ""  
     ;add dl,'0' 
     ;mov ah,2h
     ;int 21h               
     ;i:
     ;add dl,1h
     ;jmp k 
     
     
     
    ;8.
    ;mov al, 00101010b
    ;test al,00100000b
    ;jz op
    ;test al,00000010b
    ;jz op 
    ;test al,00001000b
    ;jz op
    ;printn "YES"
    ;jmp last
    ;op:
        ;printn "NO"  
        
        
        
    ;9. binary output
    mov al,00001b
    mov cx,8h
    l:
        shl al,1
        jc po
        jnz pz
        l1: loop l
    jmp last    
    po: print "1"
    jmp l1
    pz: print "0"
    jmp l1 
    
      
    last:                    
    main endp
End main
 
