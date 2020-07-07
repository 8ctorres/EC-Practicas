.text
.globl main

main:
  addi $t0, $0, 1   #bucle for empieza en i=1
  la $t1, count
  lw $a2, 0($t1)    #carga "count" en $a2
  la $a0, a
  la $a1, b

  lwc1 $f2, 0($a1)  #carga b[0] en $f2
 
Loop:
  lwc1 $f0, 4($a0)    #carga a[i] en $f0
  addi $t0, $t0, 2    #aumenta el iterador en 2 unidades
  add.s $f2, $f0, $f2 #b[i] = a[i] + b[i-1]
  lwc1 $f0, 8($a0)    # carga a[i+1] en $f0
  swc1 $f2, 4($a1)    #escribe b[i]
  addi $a0, $a0, 8    #aumenta el puntero a[] en 2
  add.s $f2, $f0, $f2 #b[i+1] = a[i+1] + b[i]
  addi $a1, $a1, 8    #aumenta el puntero b[] en 2
  swc1 $f2, 0($a1)    #escribe b[i+1]

  bne $t0, $a2, Loop

  addi $v0, $0, 10
  syscall


# segmento de datos
.data
a: .float 1.0, 2.0, 3.0, 4.0, 5.0, 6.0
b: .float 0.0, 1.0, 2.0, 3.0, 4.0, 5.0
count: .word 5

# fin
