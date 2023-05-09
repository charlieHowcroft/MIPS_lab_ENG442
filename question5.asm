li $s0, 0x1 # f
li $s1, 0x2 # g
li $s2, 0x3 # h
li $s3, 0x4 # i
li $s4, 0x5 # j
li $s5, 0x1 # k

	.data
Jump_table: .word case_0, case_1, case_2, case_3
	.text

sll $s5, $s5, 2 # multiply k by 4 to get word address
la $t0, Jump_table # load adress of jump table 
add $t0, $t0, $s5 # Add address of jump table and k
lw $t1, 0x0($t0) # Load address of selected case from jump table
jr $t1 # jump to case

j end

case_0:
	add $s0, $s3, $s4 # f = i + j
	j end
case_1:
	add $s0, $s1, $s2 # f = g + h
	j end
case_2:
	add $s0, $s1, $s2 # f = g + h
	j end
case_3:
	sub $s0, $s3, $s4 # f = i - j
	j end
end:




