.data
n: .word 10
a: .float 1,2,3,4,5,6,7,8,9,10
x: .space 4


#segmentado 5 etapas, salto retardado, suma pf lat 2, mul pf lat 4, div pf lat 7

.text
.globl main

main:
    la $t0, n
    lw $t0, 0($t0)
    la $t1, x
    la $t3, a
    add.s   $f2, $0, $0
loop:
    lwc1 $f0, 0($t3)
    lwc1 $f1, 4($t3)

    add.s $f1, $f0, $f1
    add.s $f2, $f1, $f2
    
    swc1 $f2, 4($t3)
    addi $t3, $t3, 4
    addi $t0, $t0, -1
    bne $t0, $0, loop
    nop
    swc1 $f2, 0($t1)

    addi $v0,$0,10
    syscall

    #155 ciclos


#Solución

.text
.globl main

main:
    la $t0, n
    lw $t0, 0($t0)
    la $t1, x
    la $t3, a
    add.s   $f2, $0, $0
loop:
    lwc1 $f0, 0($t3)
    lwc1 $f1, 4($t3)

    addi $t0, $t0, -1
    add.s $f1, $f0, $f1
    addi $t3, $t3, 4
    add.s $f2, $f1, $f2
    
    bne $t0, $0, loop
    swc1 $f2, 0($t3)
    
    swc1 $f2, 0($t1)

    addi $v0,$0,10
    syscall

    #95 ciclos

    #Aceleración conseguida = 155/95 = 1,63