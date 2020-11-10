# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    # TODO: Write your function code here
    addi $t1, $a2, -5
    li $t4, 4
    mult $t4, $t1
    mflo $v0
    jr $ra
routineA:
    # TODO: Write your function code here
    addiu $sp, $sp, -4
    sw $ra, 0($sp)

    add $t0, $a0, $a0
    li $t1, 3
    mult $a1, $t1
    mflo $a2
    jal routineB
    add $s1, $v0, $t0

    add $a2, $s1, -1
    jal routineB
    move $s0, $v0
    
    lw $ra, 0($sp)
    addiu $sp, $sp, 4

    jr $ra

main:
	# TODO: Write your main function code here
    li $a0, 5
    li $a1, 7
    jal routineA

    li $v0, 1
    move $a0, $s0
    syscall
exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
	syscall