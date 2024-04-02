.data
A: .word 4
B: .word 2
C: .word 3
D: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
dadd r10, r0, r0
beq r1, r2, compararByC 
beq r2, r3, sumar2
beq r1, r3, sumar2
j fin

compararByC: beq r2, r3, sumar3
sumar2: daddi r10, r0, 2
j fin

sumar3: daddi r10, r0, 3
fin: sd r10, D (r0)
halt

