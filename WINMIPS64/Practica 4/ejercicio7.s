.data
TABLA: .word 1, 5, 6, 8, 9, 11, 21, 7, 15, 10
X: .word 13
LONG: .word 10
CANT: .word 0
RES: .word 0

.code
ld r1, X (r0) ;VALOR X
ld r2, LONG (r0) ;CANTIDAD DE ELEMENTOS DE LA TABLA
dadd r3, r0, r0 ;POS DE LA TABLA
dadd r7, r0, r0 ;INICIALIZO CONTADOR DE ELEMENTOS MAYOR A X EN 0
daddi r8, r0, 1 ;INICIALIZO R8 EN 1 PARA USARLO PARA COMPARAR MAS ADELANTE

loop: ld r4, TABLA(r3) ;ELEMENTO ACTUAL DE LA TABLA
slt r6, r1, r4 ;comparo el valor actual con el valor X
beq r6, r8, mayor ;si son iguales es porque el valor x es mayor que el valor actual
sd r0, RES(r3) ;(MENOR)
j seguir 

mayor: daddi r7, r7, 1 ;aumento el la cantidad de elementos mayor a X
sd r8, RES(r3)

seguir: daddi r3, r3, 8
daddi r2, r2, -1
bnez r2, loop
sd r7, CANT (r0)
halt