ORG 1000H 
CAD DB "INGRESE UN NUMERO"
FINCAD DB ? 

ORG 1500H 
NUM1 DB ? 
NUM2 DB ? 

ORG 2000H 
MOV BX, OFFSET CAD 
MOV AL, OFFSET FINCAD - OFFSET CAD 
INT 7 
MOV BX, OFFSET NUM1 
INT 6 
MOV DH, NUM1 
SUB DH, 30H 
MOV BX, OFFSET CAD 
MOV AL, OFFSET FINCAD - OFFSET CAD 
INT 7 
MOV BX, OFFSET NUM2 
INT 6 
MOV CL, NUM2 
SUB CL, 30H 
ADD CL, DH 
CMP CL, 10 
JS ESMENOR10 
MOV RESH, 31H 
SUB CL, 10 
ADD CL, 30H 
MOV RESL, CL 
MOV BX, OFFSET RESH 
MOV AL, 2
INT 7 
JMP FINAL 
ESMENOR10: ADD CL, 30H 
MOV RESL, CL 
MOV BX, OFFSET RESH 
MOV AL, 2
INT 7 
FINAL: INT 0 
END 