.data
NUM1: .word 4
NUM2: .word 3
RES: .word 0

.code
ld r1, NUM1(r0)
ld r2, NUM2(r0)
dadd r3, r0, r0
loop: dadd r3, r3, r2
daddi r1, r1, -1
bnez r1, loop
sd r3, RES(r0)
halt