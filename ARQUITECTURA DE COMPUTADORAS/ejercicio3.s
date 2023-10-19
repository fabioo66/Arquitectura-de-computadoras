.data
A: .word 1
B: .word 3
array: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
dadd r3, r0, r0
loop: dsll r1, r1, 1
daddi r2, r2, -1
sd r1, array(r3)
daddi r3, r3, 8
bnez r2, loop
halt