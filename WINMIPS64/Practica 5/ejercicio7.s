.data
M: .word 7
TABLA: .word 1, 4, 5, 6, 8, 9, 10, 11
LONG: .word 8
RES: .word 0

.code
daddi $sp, $zero, 0x400 
ld $a0, M (r0) ;me guardo el valor M en el reg $a0
daddi $a1, $zero, TABLA ; mov bx, offset TABLA
ld $a2, LONG (r0) ;guardo en $a2 la cantidad de elementos que hay en la TABLA
jal cantidad
sd $v0, RES($zero)
halt

cantidad: dadd $v0, $zero, $zero ;inicializo contador en 0
daddi $t1, $zero, 1 ; inicializo $t1 en 1
loop: ld $t0, 0($a1) ;guardo en $t0 el elemento actual de la TABLA
slt $t3, $t0, $a0 ;comparo, si el valor actual de la tabla es menor que M  guarda en $t3 un 1
beq $t1, $t3, seguir ;si $t1 y $t3 no son iguales salta a la label
daddi $v0, $v0, 1
seguir: daddi $a2, $a2, -1
beqz $a2, fin
daddi $a1, $a1, 8
j loop 
fin: jr $ra 
