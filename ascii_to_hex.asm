DATA SEGMENT
    ASCII DB 41H
    HEX DB ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,ASCII

        CMP AL,30H
        JB ERROR

        CMP AL,39H
        JA NEXT

        SUB AL,30H
        JMP STORE

    NEXT:
        CMP AL,41H
        JB ERROR
        CMP AL,46H
        JA ERROR
        SUB AL,37H
        JMP STORE

    ERROR:
        MOV AL,0FFH
    STORE:
        MOV HEX,AL

CODE ENDS
END START

