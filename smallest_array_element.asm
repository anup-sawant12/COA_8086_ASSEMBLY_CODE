DATA SEGMENT
    BLOCK  DB 03H, 04H,01H,0H,5H
    SMALL DB ?
DATA ENDS

CODE SEGMENT 
    ASSUME CS:CODE,DS:DATA

    START:
        MOV AX,DATA
        MOV DS,AX

        MOV CX,04H
        LEA SI,BLOCK
        MOV AL,[SI]

    AGAIN:
        INC SI
        CMP AL,[SI]
        JC NEXT
        MOV AL,[SI]

    NEXT:
        LOOP AGAIN
        MOV SMALL,AL
        MOV AH,4CH
        INT 21H
CODE ENDS
END START


