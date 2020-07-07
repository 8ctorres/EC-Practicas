.text
.globl main

main:
    la $t0, array       #carga en t0 la direccion de array[0]
    la $t4, count       
    lw $t1, 0($t4)      #carga en t1 el valor de count = 6
    addi $t2, $0, 0     # t2 = 0
    addi $t0, $t0, 20   # t0 +=20, es decir apunta a array[6]

Loop:
    lw $t3, 0($t0)      #carga en t3 array[i]
    addi $t1, $t1, -1   #i--
    addi $t0, $t0, -4   #decrementar puntero array[]
    bne $t1, $0, Loop   #sale del bucle si i=0
    add $t2, $t3, $t2   # t2 += array[i]
    sw $t2, 0($t4)      #escribe el valor de t2 en la direccion donde estaba "count"

fin:
    addi $v0, $0, 10
    syscall
    
.data
    array: .word 3, 4, 9, 8, 5, 1, 3
    count: .word 6