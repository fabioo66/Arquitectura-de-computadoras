TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
N_CLK EQU 10
N_F10 EQU 20

 ORG 40
IP_CLK DW RUT_CLK
 ORG 80
IP_F10 DW RUT_F10
 ORG 1000H
SEG DB 30H ; Decena
 DB 30H ; Unidad
FIN DB ?

 ORG 3000H
RUT_CLK: PUSH AX ; Se guarda el valor de AX, porque se va a usar el registro
 INC SEG+1
 CMP SEG+1, 3AH
 JNZ RESET
 MOV SEG+1, 30H
 INC SEG
 CMP SEG, 33H
 JNZ RESET
 MOV DL, 1 ; Pongo en TRUE el flag de finalizacion
 MOV AL, 0FFH ; Deshabilito interrupciones en IMR
 OUT PIC+1, AL
RESET: MOV AL, 2 ; El contador tiene 2 caracteres
 INT 7 ; Se imprime el valor actual
 MOV AL, 0 ; Se vuelve a cero el contador del TIMER
 OUT TIMER, AL
 MOV AL, EOI ; Se finaliza la atencion de la interrupcion
 OUT PIC, AL
 POP AX ; Se recupera el valor que contenia AX al entrar en la rutina
 IRET
 ORG 3500H
RUT_F10: PUSH AX ; Se guarda el valor de AX, porque se va a usar el registro
 IN AL, PIC+1 ; Recupero el valor actual del IMR
 XOR AL, 00000010B ; Y cambio la linea correspondiente al TIMER
 OUT PIC+1, AL
 MOV AL, EOI ; Se finaliza la atencion de la interrupcion
 OUT PIC, AL
 POP AX ; Se recupera el valor que contenia AX al entrar en la rutina
 IRET

 ORG 2000H
 CLI
 MOV AL, 0FEH
 OUT PIC+1, AL ; PIC: registro IMR
 MOV AL, N_F10
 OUT PIC+4, AL ; PIC: registro INT0, F10
 MOV AL, N_CLK
 OUT PIC+5, AL ; PIC: registro INT1, TIMER
 MOV AL, 1
 OUT TIMER+1, AL ; TIMER: registro COMP
 MOV AL, 0
 OUT TIMER, AL ; TIMER: registro CONT
 MOV BX, OFFSET SEG ; Direccion del contador
 MOV DL, 0
 STI
LAZO: CMP DL, 0
 JZ LAZO
 INT 0
END