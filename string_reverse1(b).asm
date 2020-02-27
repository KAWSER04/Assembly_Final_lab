INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
X DB 80 DUP ?
.CODE

    MAIN PROC
        PRINT 'ENTER THE STRING: '
        MOV AX,@DATA
        MOV DS,AX
        MOV SI,0
        MOV AH,1
        
    NEXT:INT 21H
        CMP AL,0DH
        JZ EXIT
        MOV X[SI],AL
        INC SI
        JMP NEXT
    EXIT:DEC SI
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    NEXTP: INT 21H
        
        MOV DL,X[SI]
        DEC SI
        CMP SI,-2
        JZ EXITP
        JMP NEXTP
    EXITP: 
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN