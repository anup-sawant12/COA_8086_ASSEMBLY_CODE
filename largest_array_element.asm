DATA SEGMENT
    ARRAY DB 03H, 04H,01H,0H,5H
    LARG DB ?

DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV CX,04H
        LEA SI,ARRAY
        MOV AL,[SI]

    AGAIN:
        INC SI
        CMP AL,[SI]
        JNC NEXT
        MOV AL,[SI]
    NEXT:
        LOOP AGAIN
        MOV LARG,AL
        MOV AH,4CH
        INT 21H
    CODE ENDS
    END START