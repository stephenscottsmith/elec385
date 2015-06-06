.data
	N:	.word 	15
	Array:	.word	13578, 945730, 34, -85873, 0, -843909, 777, 11111111, 98, 99, 75, 40, 86, -5, -1000000
	Large:	.word	0

.text
	la	$a0, Array
	lw	$a1, N
	bge	$v0, $t3, over
	sw	$v0, Large($a0)
	li	$v0, 10

over:
	move	$v0, $t3