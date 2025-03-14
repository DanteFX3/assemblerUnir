.data
    msg_ing: .asciiz "Ingrese la cantidad de números de la serie Fibonacci: "
    msg_res: .asciiz "Serie Fibonacci: "
    msg_suma: .asciiz "\nSuma total: "
    salto: .asciiz "\n"

.text
    .globl main

main:
    li $v0, 4
    la $a0, msg_ing
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Cantidad de números

    li $t1, 0  # Primer número de la serie
    li $t2, 1  # Segundo número de la serie
    li $t3, 0  # Contador
    li $t4, 0  # Suma total

    li $v0, 4
    la $a0, msg_res
    syscall

fib_loop:
    # Mostrar el número actual
    li $v0, 1
    move $a0, $t1
    syscall

    # Imprimir un espacio
    li $v0, 4
    la $a0, salto
    syscall

    # Sumar al total
    add $t4, $t4, $t1

    # Calcular el siguiente número
    add $t5, $t1, $t2  # t5 = t1 + t2
    move $t1, $t2      # t1 = t2
    move $t2, $t5      # t2 = t5

    addi $t3, $t3, 1
    blt $t3, $t0, fib_loop

    # Mostrar suma total
    li $v0, 4
    la $a0, msg_suma
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    # Salto de línea
    li $v0, 4
    la $a0, salto
    syscall

    li $v0, 10
    syscall
