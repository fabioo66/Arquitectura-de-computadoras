HAND_DATO EQU 40H
HAND_ESTADO EQU 41H

ORG 1000H 
CAD DB "BOCAAA"
FINCAD DB ?

ORG 2000H
IN AL, HAND_ESTADO
AND AL, 1
OUT HAND_ESTADO, AL 
MOV BX, OFFSET CAD 
POLL: IN AL, HAND_ESTADO 
AND AL, 1 
JNZ POLL 
MOV AL, [BX]
OUT HAND_DATO, AL 
INC BX 
CMP BX, OFFSET FINCAD 
JNZ POLL 
INT 0 
END 