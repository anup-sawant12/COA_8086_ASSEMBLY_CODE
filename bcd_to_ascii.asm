DATA SEGMENT
    BCD DB 65H
    ASCII DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV BL,BCD
        AND BL,0FH

        MOV BH,BCD
        AND BH,F0H

        MOV CL,4
        SHR BH,CL

        OR BX,3030H
        MOV ASCII,BX
        MOV AH,4CH
        INT 21H
    CODE ENDS
    END START