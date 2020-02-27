INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

VL DB 0 
CNS DB 0
NUMBER DB 0
SPACE DB 0
OTHER DB 0

.CODE

MOV AX,@DATA
MOV DS,AX

MAIN PROC 
    PRINTN
    PRINT 'ENTER THE STRING :'
    
    MOV VL,0
    MOV CNS,0
    MOV NUMBER,0
    MOV SPACE,0
    MOV OTHER,0
    
    MOV AH,1
    
    NEXT:
        INT 21H
        CMP AL,0DH
        JZ OUTPUT
        
        CMP AL,'z'
        JG OTHERS
        
        CMP AL,'A'
        JL OTHERS
        
        JMP CHAR
        
    CHAR:
        CMP AL,'A'
        JZ VOWEL
        
        CMP AL,'E'
        JZ VOWEL
        
        CMP AL,'I'
        JZ VOWEL
        
        CMP AL,'O'
        JZ VOWEL
        
        CMP AL,'U'
        JZ VOWEL 
        
        
        CMP AL,'a'
        JZ VOWEL
        
        CMP AL,'e'
        JZ VOWEL
        
        CMP AL,'i'
        JZ VOWEL
        
        CMP AL,'o'
        JZ VOWEL
        
        CMP AL,'u'
        JZ VOWEL 
        
        
        JMP CONST
        
        
        
     CONST:
        INC CNS
        JMP NEXT
        
     VOWEL:
        INC VL
        
        JMP NEXT
        
     OTHERS:
     
        CMP AL,' '
        JNE SPECIAL
        
        INC SPACE
        JMP NEXT
        
        
     SPECIAL:
     
        CMP AL,'0'
        JL ALL
        
        CMP AL,'9'
        
        JG ALL
        
        INC NUMBER
        JMP NEXT
        
        
     ALL:
        INC OTHER
        JMP NEXT
        
        
     OUTPUT:
     
        MOV AH,2
        
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        ADD VL,48
        PRINTN
        PRINT 'VOWEL: ' 
        MOV DL,VL
        INT 21H
        
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        
        ADD CNS,48
        PRINTN
        PRINT 'CONSTANT: ' 
        MOV DL,CNS
        INT 21H
        
         
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        
        ADD NUMBER,48
        PRINTN
        PRINT 'NUMBER: ' 
        MOV DL,NUMBER
        INT 21H 
        
         
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        
        ADD SPACE,48
        PRINTN
        PRINT 'SPACE: ' 
        MOV DL,SPACE
        INT 21H
        
         
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        
        ADD OTHER,48
        PRINTN
        PRINT 'OTHER: ' 
        MOV DL,OTHER
        INT 21H 
        
         
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H 
        
        
        MOV AH,4CH
        INT 21H
        
        
        MAIN ENDP
        END MAIN
        




