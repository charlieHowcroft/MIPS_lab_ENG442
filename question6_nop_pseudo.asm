.text
.globl main

# set temporary register $t0 to 0
lui $at, 0x0000
ori $t0, $at, 0x0000
# set temporary register $t1 to first address of mem
lui $at, 0x1001
ori $t1, $at, 0x0000
# store 0 in first address mem
sw $t0, 0x0($t1) # save 0 to the first memory address

main:
	# allocate space on the stack, 3 subroutines, 3 places on stack, subtract 12
	lui $at, 0x0000
	ori $t2, $at, 0x000c
	sub $sp,$sp,$t2 
	# call fred
	jal fred

	# exit program
    	lui $at, 0x0000
	ori $v0, $at, 0x000a
    	syscall
    	
fred:
	# increase stack pointer to next stack address
	addi $sp, $sp, 4 
	# store return address at this new place on the stack
	sw $ra, 0x0($sp)
	# load x
	lw $t0, 0x0($t1)
	# load 1 into temporary register $t2
	lui $at, 0x0000
	ori $t2, $at, 0x0001
	# x = x + 1
	add $t0, $t0, $t2
	# store new x in memory
	sw $t0, 0x0($t1) 
	# call fred
	jal bill
	# decrease stack pointer to previous stack address, (pop)
	lui $at, 0x0000
	ori $t3, $at, 0x0004
	sub $sp, $sp, $t3
	# load the return address at this new place on stack
	lw $ra, 0x0($sp)
	# return to main
	jr $ra
bill:
	# increase stack pointer to next stack address
	addi $sp, $sp, 4
	# store return address at this new place on the stack
	sw $ra, 0x0($sp) 
	# load x from memory
	lw $t0, 0x0($t1)
	# load 2 into temporary register $t2
	lui $at, 0x0000
	ori $t2, $at, 0x0002
	# x = x + 1
	add $t0, $t0, $t2
	# save x in memory
	sw $t0, 0x0($t1) 
	# call charlie
	jal charlie
	# decrease stack pointer (pop)
	sub $sp, $sp, $t3
	# store return address on stack
	lw $ra, 0x0($sp)
	# return to fred
	jr $ra
	
charlie:
	addi $sp, $sp, 4
	sw $ra, 0x0($sp) 
	
	# do the addition
	lw $t0, 0x0($t1)
	
	lui $at, 0x0000
	ori $t2, $at, 0x0003

	add $t3, $t0, $t2
	sw $t3, 0x0($t1) 
	
	jr $ra # return to bill
	
	
	
	
