.data
cadena: .asciiz " "
ingresa: .asciiz "Bienvenido"
noIngresa: .asciiz "ERROR"
clave: .asciiz "BOBO"
control: .word32 0x10000
data: .word32 0x10008

.code
daddi $t4, $zero, 4 ;inicializo t4 en 4 para comparar
while: dadd $s0, $zero, $zero ;inicializo el indice
loop: jal char 
sb $v0, cadena($s0)
daddi $s0, $s0, 1
beq $s0, $t4, listo
j loop
listo: daddi $a0, $zero, cadena
daddi $a1, $zero, clave
jal respuesta
dadd $s1, $zero, $v0
beqz $s1, while
halt

char: lwu $t0, data($zero)
lwu $t1, control($zero)
daddi $t3, $zero, 9
sd $t3, 0($t1)
lbu $v0, 0($t0)
jr $ra

respuesta: lwu $t0, data($zero)
lwu $t1, control($zero)
daddi $t4, $zero, 4
lazo: lbu $t2, 0($a0) ;tomo elem actual de cadena
lbu $t3, 0($a1) ;tomo elem actual de clave
beq $t2, $t3, sigue
j incorrecto
sigue: daddi $a0, $a0, 1
daddi $a1, $a1, 1
beq $a0, $t4, correcto
j lazo 
incorrecto: daddi $t5, $zero, noIngresa
sd $t5, 0($t0)
daddi $t5, $zero, 4
sd $t5, 0($t1)
dadd $v0, $zero, $zero
j final
correcto: daddi $t5, $zero, ingresa
sd $t5, 0($t0)
daddi $t5, $zero, 4
sd $t5, 0($t1)
daddi $v0, $zero, 1
final: jr $ra