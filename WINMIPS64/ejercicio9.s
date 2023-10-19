.data
a: .word 5
x: .word 3
y: .word 4
res: .word 0

.code
ld r1, a (r0)
ld r2, x (r0)
ld r3, y (r0)
loop: dadd r2, r2, r3 
daddi r1, r1, -1
bnez r1, loop
sd r2, res(r0)
halt
