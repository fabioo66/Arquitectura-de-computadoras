EOI EQU 20H 
IMR EQU 21H 
INT0 EQU 24H 

ORG 40
DIR_IMPRIMIR DW IMPRIMIR 

ORG 1000H 
LETRA DB ? 

ORG 3000H 
IMPRIMIR: MOV LETRA, CL 
MOV BX, OFFSET LETRA 
MOV AL, 1
INT 7 
MOV AL, 20H 
OUT EOI, AL 
IRET 

ORG 2000H 
CLI 
MOV AL, 11111110B 
OUT IMR, AL 
MOV AL, 10 
OUT INT0, AL 
MOV BX, 40 
MOV WORD PTR[BX], IMPRIMIR 
STI
MOV CL, 41H 
LOOP: INC CL 
CMP CL, 5AH 
JNZ LOOP 
MOV CL, 41H 
JMP LOOP 
INT 0
END 
