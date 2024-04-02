.data
cadena1: .asciiz "hola"
cadena2: .asciiz "holap"
res: .word 0

.code
daddi $a0, $0, cadena1 ;me guardo la dir de cadena1 en $a0
daddi $a1, $0, cadena2 ;me guardo la dir de cadena2 en $a1
jal compara
sd $v0, res (r0)
halt

compara: dadd $v0, $zero, $zero
loop: lbu $t0, 0($a0) ;me guardo el elemento actual de cadena1
lbu $t1, 0($a1) ;me guardo el elemento actual de cadena2
beqz $t0, fin_a0
beqz $t1, final
bne $t0, $t1, final ;si no son iguales salto para finalizar el programa
daddi $a0, $a0, 1
daddi $a1, $a1, 1
j loop
fin_a0: bnez $t1, final
daddi $v0, $0, -1
j final
fin_a1: bnez $t0, final
daddi $v0, $0, -1
final: jr $ra
