li $s0, 0x0 #f
li $s1, 0x3#g
li $s2, 0x1 #h
li $s3, 0x1 #i
li $s4, 0x1 #j

bne $s3, $s4, else # if i!=j jump to else
add $s0, $s1, $s2 # f = g+h
j end             # jump to the end of the program
	else:
sub $s0, $s1, $s2 # f = g-h
	end:
