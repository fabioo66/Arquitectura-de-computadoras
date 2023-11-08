.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
num1: .word 0
num2: .word 0

.code
jal ingreso
sd $v0, num1($zero)
jal ingreso 
sd $v0, num2($zero)
;cargo los numeros para pasarlos a la subrutina
ld $a0, num1($zero)
ld $a1, num2($zero)
jal resultado
halt

ingreso: lwu $t0, CONTROL($zero)
lwu $t1, DATA($zero)
daddi $t2, $zero, 8
loop: sd $t2, 0($t0)
ld $t3, 0($t1) ;almaceno el valor ingresado en $t3

;chequeo si es un num
slti $t4, $t3, 0xA
beqz $t4, loop ;sino es un num sigo loopeando
daddi $t5, $zero, 0
slt $t4, $t5, $t3
beqz $t4, loop ;sino es un num sigo loopeando
dadd $v0, $zero, $t3 ;paso el numero por parametro $v0
jr $ra

resultado: lwu $t0, DATA($zero)
lwu $t1, CONTROL($zero) 
dadd $t2, $a0, $a1
sd $t2, 0($t0)
daddi $t2, $zero, 1
sd $t2, 0($t1)
jr $ra
