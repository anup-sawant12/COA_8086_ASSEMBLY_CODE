DATA SEGMENT
    ARRAY DB 03H, 04H,01H,0H,5H
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:  
        MOV AX,DATA
        MOV DS,AX
        MOV BX,04H

    OUTER:
        MOV CX,04H
        LEA SI,ARRAY
    INNER:
        MOV AL,[SI]
        INC SI
        CMP AL,[SI]
        JNC NEXT
        MOV DL,[SI]
        MOV [SI],AL
        DEC SI
        MOV [SI],DL
        INC SI
    NEXT:
        LOOP INNER
        DEC BX
        JNZ OUTER
        MOV AH,4CH
        INT 21H

CODE ENDS
END START