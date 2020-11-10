# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	# TODO: Write your initializations here
	myArray:
        .word 1 2 3 4 5 6 7 8 9 10

	contentStr: 
	   	.asciiz "The contents of the array are:\n"
	newLine: 
	   	.asciiz "\n"
.text
printA:
    # TODO: Write your function code here
	
	li $t0, 0 
	j loop

loop:
	bge $t0, $a1, printAReturn
	
	move $t5, $a0
	lw $t2, 0($a0)
	move $a0, $t2

	li $v0, 1
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	move $a0, $t5
	addiu $a0, $a0, 4
	addiu $t0, $t0, 1

	j loop


printAReturn:
	jr $ra


main:
	la $a0, myArray
	li $a1, 10
	move $s0, $a0
	
	li $v0, 4
	la $a0, contentStr
	syscall
	move $a0, $s0
	jal printA
	
	# TODO: Write your main function code here

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall