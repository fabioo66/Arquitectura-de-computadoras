.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
num1: .word 0
num2: .word 0

.text
jal ingreso
sd $v0, num1($zero)
sd $v1, num2($zero)
ld $a0, num1($zero)
sd $a1, num2($zero)
jal resultado
halt

ingreso: lwu $t0, CONTROL($zero)
lwu $t1, DATA($zero)
daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1) ;num1
sd $t2, 0($t0)
ld $t4, 0($t1) ;num2
dadd $v0, $zero, $t3
dadd $v1, $zero, $t4
jr $ra

resultado: lwu $t0, CONTROL($zero)
lwu $t1, DATA($zero)
dadd $t3, $a0, $a1
sd $t3, 0($t1)
daddi $t4, $zero, 1
sd $t4, 0($t0)
jr $ra