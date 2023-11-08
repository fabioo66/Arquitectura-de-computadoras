.data
control: .word32 0x10000
data: .word32 0x10008
base: .double 0.0
exp: .word 0
uno: .double 1.0
cero: .double 0.0

.code
lwu $s0, control($zero)
lwu $s1, data($zero)
daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f1, 0($s1) ;tomo el valor en PF
sd $t0, 0($s0)
ld $t2, 0($s1) ;tomo el valor entero

s.d f1, base($zero)
sd $t2, exp($zero)
;guardo los valores en sus variables

ld $a1, exp($zero) ;cargo el num entero en $a1
jal a_la_potencia
halt

a_la_potencia: beq $a1, $zero, resultadoUno
l.d f4, cero($zero) ;me guardo el valor 0.0 en f4
add.d f2, f4, f1 ;me guardo el valor de la base en f2  
daddi $a1, $a1, -1
loop: mul.d f2, f2, f1
daddi $a1, $a1, -1
beqz $a1, imprimir
j loop
resultadoUno: l.d f2, uno($zero)   
imprimir: lwu $t6, control($zero)
lwu $t7, data($zero) 
s.d f2, 0($t7)
daddi $t1, $zero, 3
sd $t1, 0($t6)
jr $ra 