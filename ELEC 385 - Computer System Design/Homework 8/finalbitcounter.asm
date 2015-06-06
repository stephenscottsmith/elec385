.text  
	addi 	$a0, $0, 4294967295	# Store program's argument
	addi	$t0, $0, 0		# Take immediate value of 0, add it with 0, and store it in the $t0 for the 1-bit counter
	addi	$t1, $0, 0		# Take immediate value of 0, add it with 0, and store it in the $t0 for the loop counter
	addi 	$t4, $0, 32		# Take immediate value of 32, add it with 0, store it in $t4 register for upper bound
loop:
 	slt	$t3, $t1, $t4		# If loop counter is less than 32, set $t3 
	bne	$t3, 1, exit		# If #t3 is a 0 keep going through loop, otherwise exit b/c loop counter now >= 32
	
 	andi 	$t2, $a0, 1 		# Determine what least sig bit of argument anded with a 1 is (bit = least significant bit of input & 1)
 	beq 	$t2, $0, skip 		# If bit is a 0 then skip it
 	addi 	$t0, $t0, 1 		# Increment bit counter
skip:
 	srl 	$a0, $a0, 1 		# Right shift argument 1 bit to get next bit (argument = argument >> 1)
 	addi 	$t1, $t1, 1 		# Increment loop counter
 	j 	loop			# Go back through loop
exit:
	addiu 	$v0, $0, 10		# Add the immediate value of 10 (the exit program syscall) to 0 and store it in the $v0 register 
	syscall				# Call syscall with the now stored value of 10 in the $v0 register