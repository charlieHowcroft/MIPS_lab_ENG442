li $s3, 0x0 # i
li $s4, 0x1 # j
li $s5, 0x4 # k
li $s6, 0x10010000  # save

li $t0, 0x0 # 0
sw $t0, 0x0($s6) # set number Save[0] = 0
li $t0, 0x1 # 1
sw $t0, 0x4($s6) # set number Save[1] = 1
li $t0, 0x2 # 2
sw $t0, 0x8($s6) # set number Save[2] = 2
li $t0, 0x3 # 3
sw $t0, 0xc($s6) # set number Save[3] = 3
li $t0, 0x4 # 4
sw $t0, 0x10($s6) # set number Save[4] = 4

loop:
	sll $t0, $s3, 2 # multiply i by 4
	add $t1, $t0, $s6 # get address of A[i]
	lw $t0, ($t1) # load A[i]
	beq $t0, $s5, end
	add $s3, $s3, $s4
	j loop
end:
	
