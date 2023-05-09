li $s2, 0x32 # h
li $s3, 0x10010000  # A
li $s4, 0x4 # i
li $t0, 0x32 # random value

sw $t0, 0x10($s3) # set number at A[4]
sll $t0, $s4, 0x2 # multiply i by 4 to get to word boundary
add $t1, $t0, $s3 # get memory adress of A[i]
lw $t2, 0x0($t1)    # Load A[i] into $t2
add $s1, $s2, $t2 # Compute h + A[i], store in $s1

