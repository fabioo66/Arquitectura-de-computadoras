.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
CADENA: .asciiz ""

.code
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
dadd $t0, $zero, $zero
daddi $t1, $zero, 13
daddi $s2, $zero, 9
loop: sd $s2, 0($s0)
lbu $t7, 0($s1)
beq $t7, $t1, final
sb $t7, CADENA($t0)
daddi $t0, $t0, 1
j loop
final: daddi $t0, $zero, CADENA
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)
halt