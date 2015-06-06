.data
	x:	.word	5
	y:	.word 	7

.text
notMain:
	la 	$t0, x
	la 	$t1, y
	lw 	$t2, ($t0)
	sw	$t2, ($t1)