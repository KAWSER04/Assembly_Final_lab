INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
divisor DB ?
sum DB ?
n DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV divisor,2
    PRINT 'ENTER THE NUMBER '
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV n,AL
    ADD AL,1
    MUL n
    DIV divisor
    ADD AL,48
    MOV sum,AL
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,sum
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN