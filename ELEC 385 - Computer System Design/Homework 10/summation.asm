.data
	arr: 	.float		82.6, -1.0, -6.7348483, 0.0, 100.9, 82.0116
	counter:.word		6
	const:	.float		82.0116
	sum:	.float		0.0
.text
	la	$t0, arr	# Initialize pointer
	lw	$t1, counter	# Load the counter into $t1
	lwc1 	$f12, sum	# Initialize the sum (which starts at 0.0) into $f12 (also the register printing a double reads from in future syscall)
	lwc1	$f1, const	# Initialize the constant we're going to subtract by
loop:
	lwc1	$f2, 0($t0)	# load the value from the array
	sub.s	$f3, $f2, $f1	# subtract the value from array by the constant, place in $f3
	mul.s	$f3, $f3, $f3	# (x-82.0116)^2
	add.s	$f12, $f12, $f3	# add to the running total
	addi	$t0, $t0, 4	# increment the address for the array index
	addi	$t1, $t1, -1	# decrement the counter
	beq	$t1, $0, exit	# if the counter is 0, exit
	j	loop		# keep looping
exit:
	li	$v0, 2 		# the syscall to print a float to the console
	syscall			# print to screen
	li	$v0, 10		# load syscall to exit program
	syscall			# exit program
