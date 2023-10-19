.data
cadena: .asciiz "adbdcdedfdgdhdid" 
car: .asciiz "d" 
cant: .word 0 
long: .word 16

.code
lbu r1, car(r0)
dadd r2, r0, r0 ;inicializo contador en 0
dadd r3, r0, r0
ld r5, long(r0) ;cantidad de caracteres
loop: lbu r4, cadena(r3)
bne r4, r1, seguir
daddi r2, r2, 1
seguir: daddi r3, r3, 1
daddi r5, r5, -1
bnez r5, loop
sd r2, cant(r0)
halt