INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
    n DB ?
    fact DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'ENTER THE NUMBER: '
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,0
    JE ZERO
    JMP NOTZERO
    
    ZERO:
    MOV AL,1
    JMP ENDFOR
    
    NOTZERO:
    MOV n,AL
    DEC n
    
    FOR:
    CMP n,0
    JE ENDFOR
    MUL n
    DEC n
    JMP FOR
    
    ENDFOR:
    MOV fact,AL
    ADD fact,48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    PRINT 'FACTORIAL OUTPUT: '
    
    MOV AH,2
    MOV DL,fact
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN

    
