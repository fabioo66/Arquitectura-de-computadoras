.data
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 0 ; coordenada Y de un punto
color: .byte 0 
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $s6, CONTROL($zero) 
lwu $s7, DATA($zero) 
daddi $t4, $zero, 4 ;contador de numeros a ingresar(color)
daddi $s4, $zero, 8
sd $s4, 0($s6)
lbu $s3, 0($s7) ;guardo la coordenada X en $s3
sb $s3, coorX($zero) ;guardo la coordenada X en su variable
sd $s4, 0($s6)
lbu $s3, 0($s7) ;;guardo la coordenada X en $s3
sb $s3, coorY($zero) ;guardo la coordenada Y en su variable

dadd $t1, $zero, $zero ;indice para recorrer la cadena de colores
loop: sd $s4, 0($s6)
lbu $s3, 0($s7)
sb $s3, color($t1) ;tomo el num actual y lo guardo en la cadena de colores
daddi $t1, $t1, 1
beq $t1, $t4, termine
j loop

termine: daddi $t0, $zero, 7 ; $t0 = 7 -> funcion 7: limpiar pantalla grafica
sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla grafica
lbu $s0, coorX($zero) ; $s0 = valor de coordenada X
sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
lbu $s1, coorY($zero) ; $s1 = valor de coordenada Y
sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y
lwu $s2, color($zero) ; $s2 = valor de color a pintar
sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
daddi $t0, $zero, 5 ; $t0 = 5 -> funcion 5: salida grafica
sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
halt 
