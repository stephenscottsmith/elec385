.text
	addi    $s0,$0, 9	# Take the immediate value of 9, add it with 0, and store it in the $s0 register
	addi	$s1,$0, 10	# Take the immediate value of 10, add it with 0, and store it in the $s0 register
	slt	$t0, $s1, $s0	# If $s1 (h) < $s0 (g), then set the $t0 register to 1 else set it to 0
	bne	$t0, 1, else	# Break to the else section if the value stored in $t0 is not equal to 1
	add	$t1, $s0, $s1	# Add the values stores in $s0 (g) and $s1 (h) and store the sum in $t0 register
	add	$s0, $0, $t1	# Add the previous sum that was stored in $t0 to 0 and store that back in to $s0 (so g = g + h)
	j exit			# Jump to exit section of code to skip the else section
else: 	
	sub	$t1, $s0, $s1	# Subtract $s1 (h) from $s0 (g) and place value in $t1 (so g = g - h)
	add	$s0, $0, $t1	# Add the previously computed value stored in $t1 with 0 and store it back in $s0
exit:
	addiu 	$v0, $0, 10	# Add the immediate value of 10 (the exit program syscall) to 0 and store it in the $v0 register 
	syscall			# Call syscall with the now stored value of 10 in the $v0 register