li $s1, 0 # g
li $s2, 4 # h
li $s3, 0 # i
li $s4, 1 # j
li $s5, 0x10010000

# create A = [1, 1, 1, 2, 2]
li $t0, 1
li $t1, 2
sw $t0, ($s5)
sw $t0, 0x4($s5)
sw $t0, 0x8($s5)
sw $t1, 0xc($s5)
sw $t1, 0x10($s5)

j loop

loop:
	sll $t0, $s3, 2       # Multiply i by 4 to get A offset
	add $t0, $t0, $s5     # Add the address of A to the offset to get address of A[i]
	lw $t1, ($t0)         # Load A[i] into $t1

	add $s1, $s1, $t1 # g = g + A[i]
	add $s3, $s3, $s4 # i = i + j
	
	bne $s3, $s2, loop    # If i != h, jump to loop
	
	