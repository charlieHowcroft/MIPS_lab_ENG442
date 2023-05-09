li $t0, 1
li $t1, 2
li $t2, 2
li $s3, 0x10010000
li $s4, 0x10010004
sw $t0, 100($s3)
sw $t1, 104($s3)

j Loop

#Loop: 
#	addi $s3, $s3, 4
#	beq $s3, $s4, Loop
#	lw $s2, 96($s3) # branch delay slot
	
Loop: 
	lw $s2, 100($s3)
	addi $s3, $s3, 4
	beq $s3, $s4, Loop
	
	