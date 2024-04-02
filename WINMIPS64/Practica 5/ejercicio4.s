.data
peso: .double 65.8
estatura: .double 1.75
IMC: .double 0.0 
estado: .word 0
dieciocho: .double 18.5 

.code
l.d f1, peso (r0)
l.d f2, estatura (r0)
mul.d f2, f2, f2 
div.d f3, f1, f2 
s.d f3, IMC (r0)
;Infrapeso (IMC < 18,5), Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30).
daddi r5, r0, 25
daddi r6, r0, 30 
;ME GUARDO LAS CATEGORIAS

daddi r1, r0, 1
daddi r2, r0, 2
daddi r3, r0, 3
daddi r4, r0, 4
;ME GUARDO LOS ESTADOS 

mtc1 r5, f4 ;me guardo el 25 en f4
cvt.d.l f4, f4
mtc1 r6, f5 ;me guardo el 30 en f5
cvt.d.l f5, f5
l.d f6, dieciocho (r0) ;me guardo el 18.5 en f6 

c.lt.d f3, f6 
bc1t skinny 
c.lt.d f3, f4 
bc1t normal 
c.lt.d f3, f5 
bc1t fat 
j pig 

skinny: sd r1, estado (r0)
j fin 
normal: sd r2, estado (r0)
j fin
fat: sd r3, estado (r0)
j fin 
pig: sd r4, estado (r0)
fin: halt 
