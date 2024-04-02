.data
TABLA: .word 1,1,1,3,7,4,5,6,8,0
res: .word 0

.code
daddi $sp, $zero, 0x400
daddi $a0, $zero, TABLA
jal CONTAR_IMPAR
sd $v0, res($zero)
halt

CONTAR_IMPAR: daddi $sp, $sp, -24
sd $ra, 0($sp)
sd $s0, 8($sp)
sd $s1, 16($s0)
dadd $s1, $zero, $zero
dadd $s0, $a0, $zero
loop: ld $a0, 0($s0)
beqz $a0, final
jal ES_IMPAR
bnez $v0, seguir
daddi $s1, $s1, 1
seguir: daddi $s0,$s0,8
j loop
final: dadd $v0, $s1, $zero 
ld $ra, 0($sp)
ld $s0, 8($sp)
ld $s1, 16($sp)
daddi $sp, $sp, 24
jr $ra

ES_IMPAR: andi $v0, $a0, 1
jr $ra
