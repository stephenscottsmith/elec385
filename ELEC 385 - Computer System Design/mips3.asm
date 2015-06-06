# MIPS assembly code
# Used average program as basis for building out this program
.data
N1:	.word	1
Arr1: 	.word	77
N2:	.word	3
Arr2: 	.word	23, 23, 23
N3: 	.word	10
Arr3: 	.word	1, 2, 3, 4, 23, 72, 99, 1001, 3001, 10

.text
  add	$t1,$0,$0	 		# Clear t1 register to be used to store largest number
  add	$t2,$0,$0	 		# Clear t2 register to store array pointer
  la	$t2,Arr1	 		# Initialize the pointer to the array
  add	$t4,$0,$0	 		# Clear t4 for counter
  la	$t5,N1		 		# Store N
  lw	$t5,0($t5)	 
  lw    $t3,0($t2) 	 
  add   $t1, $t1,$t3  			# Set t1 to first element of Arr1
  jal   determine_biggest
  
  add	$t1,$0,$0	 		# Clear t1 register to be used to store largest number
  add	$t2,$0,$0	 		# Clear t2 register to store array pointer
  la	$t2,Arr2	 		# Initialize the pointer to the array
  add	$t4,$0,$0	 		# Clear t4 for counter
  la	$t5,N2		 		# Store N2
  lw	$t5,0($t5)	 
  lw    $t3,0($t2) 	 
  add   $t1, $t1,$t3  			# Set t1 to first element of Arr2
  jal   determine_biggest
  
  add	$t1,$0,$0	 		# Clear t1 register to be used to store largest number
  add	$t2,$0,$0	 		# Clear t2 register to store array pointer
  la	$t2,Arr3	 		# Initialize the pointer to the array
  add	$t4,$0,$0	 		# Clear t4 for counter
  la	$t5,N3		 		# Store N3
  lw	$t5,0($t5)	 
  lw    $t3,0($t2) 	 
  add   $t1, $t1,$t3  			# Set t1 to first element of Arr3
  jal   determine_biggest
  
  li   $v0, 10           		# system call for exit
  syscall  

determine_biggest:
  lw	$t3,0($t2)			# Get first element
  bgt 	$t3, $t1, set_max 		# Check if current index is bigger than current biggest, if so go set it
  addi	$t2,$t2,4			# Remove current element in array
  addi	$t4,$t4,1			# Increment counter
  bne	$t4,$t5,determine_biggest	# Does the counter equal N? If not go back to loop.
      
  jr 	$ra
  
set_max:
  lw $t1, 0($t2)			# Move new biggest into t1 where we store biggest
  addi	$t2,$t2,4			# Remove first element (by moving pointer up 4 bytes)
  addi	$t4,$t4,1			# Increment counter
  j  	determine_biggest		# Jump back to determine_biggest function
