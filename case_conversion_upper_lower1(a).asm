
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA 
X DB 80 DUP ?
n DB ?
.CODE
MAIN PROC
    
    MOV n,0
    MOV SI,100
    
    PRINT 'ENTER THE STRING : '
    
    MOV AH,1
    INPUT:
    
    INT 21H
    CMP AL,13
    JE ENDINPUT
    
    IF:
    CMP AL,65
    JL ELSEIF
    CMP AL,90
    JG ELSEIF    
    ADD AL,32
    JMP ELSE
    
    ELSEIF:
    CMP AL,97
    JL ELSE
    CMP AL,122
    JG ELSE
    SUB AL,32
    
    ELSE:
    MOV X[SI],AL
    INC SI
    INC n
    JMP INPUT
    
    ENDINPUT:
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV SI,100
    PRINT 'RESULT : '
    OUTPUT:
    MOV AH,2
    MOV DL,X[SI]
    INT 21H
    DEC n
    CMP n,0
    JE EXIT
    INC SI
    JMP OUTPUT
    
    EXIT:
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN