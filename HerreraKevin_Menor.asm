.data
    msg_cant: .asciiz "Ingrese la cantidad de números a comparar (mínimo 3, máximo 5): "
    msg_ing: .asciiz "Ingrese un número: "
    msg_menor: .asciiz "El número menor es: "
    salto: .asciiz "\n"

.text
    .globl main

main:
    li $v0, 4
    la $a0, msg_cant
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Guardar la cantidad de números

    li $t1, 0  # Contador
    li $t2, 2147483647  # Número menor (valor máximo posible)

loop:
    li $v0, 4
    la $a0, msg_ing
    syscall

    li $v0, 5
    syscall
    move $t3, $v0  # Número ingresado

    blt $t3, $t2, actualizar_menor
    j siguiente

actualizar_menor:
    move $t2, $t3  # Actualizar menor

siguiente:
    addi $t1, $t1, 1
    blt $t1, $t0, loop

    # Mostrar resultado
    li $v0, 4
    la $a0, msg_menor
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Salto de línea
    li $v0, 4
    la $a0, salto
    syscall

    li $v0, 10
    syscall
