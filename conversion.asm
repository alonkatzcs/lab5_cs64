# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
	li $t0, 0
	li $t1, 0
	li $t5, 5
	move $s0, $a0
	move $s1, $a1
	j loop

loop:
	bge $t1, $t5, convReturn
	add $t3, $a0, $a0
	sub $t4, $t3, $a1
	add $t0, $t4, $t0
	li $t2, 3
	bge $a0, $t2, suby
	addi $a0, 1
	move $v0, $t0
	addiu $t1, 1
	j loop

suby:
	addi $a1, -1
	addi $a0, 1
	move $v0, $t0
	addiu $t1, 1
	j loop
	

convReturn:
	jr $ra
main:
	li $a0, 5
	li $a1, 7
	jal conv

	move $a0, $v0
	li $v0, 1
	syscall

	move $a0, $s0
	move $a1, $s1
	# TODO: Write your main function code here

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall