.data
x: .word 0
y: .word 0
result: .word 0

msg1: .asciiz "Entrez le primier entier: "
msg2: .asciiz "Entrez la duexieme entier: "
msg3: .asciiz "result est: "

menu_text: .asciiz "Calculator\nMenu:\n  1. Addition\n  2. Subtraction\n  3. Multiplication\n  4. Division\n  5. Modulo\n  6. Negation\n  7. Exit\nEntrez votre choix: "

newline: .asciiz "\n"

.text
.globl main

main:

      # Display menu_text
 li $v0, 4
 la $a0, menu_text
    syscall

    # Read choice
li $v0, 5
syscall
move $t3, $v0

    
beq $t3, 6, negation

 beq $t3, 7, exit

    # Display msg1
li $v0, 4
la $a0, msg1
syscall

    # Read x
li $v0, 5
 syscall
move $t0, $v0
sw $t0, x

    # Display msg2
li $v0, 4
la $a0, msg2
syscall

    # Read  y
li $v0, 5
syscall
move $t1, $v0
sw $t1, y

#load word into register here
 lw $t0,x
 lw $t1,y   

 
calcul:
beq $t3, 1, addition
beq $t3, 2, subtraction
beq $t3, 3, multiplication
 beq $t3, 4, division
beq $t3, 5, modulo

addition:


addu $t6, $t4, $t5
sw $t6, result
j msg_result

subtraction:


subu $t6, $t4, $t5
sw $t6, result
j msg_result

multiplication:

mult $t4, $t5
mflo $t6
sw $t6, result
j msg_result

division:


bnez $t5, divv
li $t6, 0
sw $t6, result
j msg_result

divv:
    div $t4, $t5
    mflo $t6
    sw $t6, result
    j msg_result

modulo:


bnez $t5, rest
li $t6, 0
sw $t6, result
j msg_result

rest:
    div $t4, $t5
    mfhi $t6
    sw $t6, result
    j msg_result

negation:

     # Display msg1
li $v0, 4
la $a0, msg1
syscall

    # Read  x
li $v0, 5
syscall
move $t0, $v0
sw $t0, x

lw $t4, x
negu $t6, $t4
sw $t6, result
j msg_result

exit:
li $v0, 10
 syscall

msg_result:
    # Display msg3
li $v0, 4
la $a0, msg3
syscall

    # Display the result
li $v0, 1
lw $t7, result
    syscall

    j main

    ## HANZA HAMANENGA
    #G1Ca
    ##19-19041101 
    
