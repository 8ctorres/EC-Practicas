#Salto fijo no efectivo

etiq:
    slt $t3, $a0, $a1
    bne $t3, $0, salir
    lw $t0, 0($a0)
    add $t2,$t2,$t0
    addi $a0,$a0, -4
    j etiq

salir:
    sw $t2, 0($a0)


#Si pasamos a salto retardado:

etiq:
    slt $t3, $a0, $a1
    bne $t3, $0, salir
    lw $t0, 0($a0)
    addi $a0,$a0, -4
    j etiq
    add $t2,$t2,$t0

salir:
    sw $t2, 0($a0)