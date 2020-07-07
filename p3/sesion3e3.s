.data
    N: .word 10
    v1: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    v2: .float 1, 2, 3, 1, 2, 3, 1, 2, 3, 1
    r: .float 0

.text
.globl main

main:
    la $t0, N
    lw $t0, 0($t0)  # carga en t0 el valor de N (numero de iteraciones del bucle = N-1)
    la $t1, v1      # carga en t1 la direccion de v1[0]
    la $t2, v2      # carga en t2 la direccion de v2[0]
    la $t3, r
    lwc1 $f12, 0($t3)   #carga en f12 el valor de r

Loop:
    lwc1 $f2, 0($t1)    #carga en f2 v1[i]
    lwc1 $f4, 0($t2)    #carga en f2 v2[i]
    add.s $f12, $f12, $f4   # r = r + v2[i]
    add.s $f2, $f2, $f4     # f2 = v1[i] + v2[i]
    swc1 $f2, 0($t2)        # v2[i] = f2
    addi $t1, $t1, 4        #aumenta el puntero v1[]
    addi $t2, $t2, 4        #aumenta el puntero v2[]
    addi $t0, $t0, -1       #disminuye i en 1 unidad
    bne $t0, $0, Loop       #salta si i es distinto de 0 (el bucle se hace N-1 veces, en este caso 9)
    nop

fin:
    swc1 $f12, 0($t3)   #sobrescribe r en memoria con su nuevo valor
    addi $v0, $0, 2     #llamada al sistema para mostrar un float
    syscall
    addi $v0, $0, 10    #llamada al sistema para finalizar el programa
    syscall