.data
char: .asciiz "a"
res: .word 0

.code
lbu $a0, char($zero) ;guardo el valor del caracter en $a0
jal ES_VOCAL
sd $v0, res($zero)
halt

ES_VOCAL: dadd $v0, $zero, $zero
daddi $t0, $zero, 0x41
daddi $t1, $zero, 0x45
daddi $t2, $zero, 0x49
daddi $t3, $zero, 0x4F
daddi $t4, $zero, 0x55
daddi $t5, $zero, 0x61
daddi $t6, $zero, 0x65
daddi $t7, $zero, 0x69
daddi $t8, $zero, 0x6F
daddi $t9, $zero, 0x75

;Guardo las vocales en registros

beq $a0, $t0, vocal
beq $a0, $t1, vocal
beq $a0, $t2, vocal
beq $a0, $t3, vocal
beq $a0, $t4, vocal
beq $a0, $t5, vocal
beq $a0, $t6, vocal
beq $a0, $t7, vocal
beq $a0, $t8, vocal
beq $a0, $t9, vocal
j fin
vocal: daddi $v0, $zero, 1
fin: jr $ra