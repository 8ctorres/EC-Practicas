#Enunciado. Salto retardado. Mejorar el rendimiento

    addi $s4, $0, 0x10
Loop:
    lwc1 $f0, 0($s2)
    add.s $f4, $f0, $f2
    swc1 $f4, 0($s2)
    addi $s2, $s2, 4
    addi $s4, $s4, -1
    bne $0, $s4, Loop

    swc1 $f4, 0($s3)

#Solución

    addi $s4, $0, 0x10
Loop:
    lwc1 $f0, 0($s2)
    add.s $f4, $f0, $f2
    addi $s2, $s2, 4
    addi $s4, $s4, -1
    bne $0, $s4, Loop
    swc1 $f4, -4($s2)    #Hueco de retardo

    swc1 $f4, 0($s3)
    