ORG 1000H
CAD DB "INGRESE CARACTERES"
FLAG DB 1
LONGITUD DB 0
CAR DB ? 

ORG 40 
PEPEF10 DW IMPRIMIR 

ORG 3000H 
IMPRIMIR: MOV FLAG, 0
MOV AL, 20H 
OUT EOI, AL 
IRET 

ORG 2000H 
CLI 
MOV AL, 11111101B
OUT CAR, AL
MOV AL, 0 
OUT CBM AL 
MOV AL, 11111101B
OUT IMR, AL 
MOV AL, ID
OUT INT0, AL 
STI 
MOV BX, OFFSET CAD 
MOV AL, OFFSET FLAG - OFFSET CAD 
INT 7 
MOV BX, OFFSET CAR 
MOV AL, 1 
LOOP: INT 6 
INC BX
INC LONGITUD 
CMP FLAG 0
JNZ LOOP 
MOV BX, OFFSET CAR 
POLL: IN AL, PA 
AND AL, 1 
JNZ POLL
MOV AL,[BX]
OUT PB, AL 
IN AL, PA 
OR AL, 2
OUT PA, AL 
AND AL, 11111101B
OUT PA, AL 
INC BX 
DEC LONGITUD 
JNZ POLL 
INT 0
END 