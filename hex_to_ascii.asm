DATA SEGMENT
    HEX DB 0CH
    ASCII DB ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV BL,HEX
        CMP BL,09H
        JA NEXT
        ADD BL,30H
        JMP STORE

    NEXT:
        CMP BL,0FH
        JA ERROR
        ADD BL,37H
        JMP STORE
    ERROR:
        MOV BL,0FFH
    STORE:
        MOV ASCII,BL
        MOV AH,4CH
        INT 21H
CODE ENDS
END START


    
