EQU CA 32H
EQU CB 33H

ORG 2000H
MOV AL, 0
OUT CB, AL
MOV AL, 1100001B
OUT PB, AL
INT 0
END