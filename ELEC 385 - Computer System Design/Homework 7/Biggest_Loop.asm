# MIPS assembly code
# Used average program as basis for building out this program
.data
N:	.word	7
Arr: 	.word	1, 10, 0, 2016, 2015, 1999, 7
Current_Biggest:.word	0

.text
  add	$t1,$0,$0	 			# Clear t1 register to store current biggest number
  add	$t2,$0,$0	 			# Clear t2 register to store array pointer
  la	$t2,Arr	 	 			# Initialize the pointer to the array
  add	$t4,$0,$0        			# Clear t4 register to store the counter
  la	$t4,N		 			# Initialize counter
  lw	$t4,0($t4)        
  add	$t3,$0,$0				# Clear t3, it will be used to store the array element later, 0 for now	 
  add   $t1,$t1,$t3  	 			# Set t1 to first element of array

iterate_over_array_of_ints:
  lw	$t3,0($t2)       			# Get first element
  bgt 	$t3, $t1, set_current_biggest     	# Check if current index is bigger than current biggest, if so go set it
  addi	$t2,$t2,4				# Remove current element in array
  addi	$t4,$t4,-1 				# Decrement counter
  bne	$t4,$0,iterate_over_array_of_ints  	# If counter does not equal N, keep iterating
  li   	$v0, 10          			# system call for exit
  syscall                			# Exit!

set_current_biggest:
  lw 	$t1, 0($t2)				# Move new biggest into t1 where we store biggest
  addi	$t2,$t2,4				# Remove first element (by moving pointer up 4 bytes)
  addi	$t4,$t4,-1				# Decrement Counter
  j  	iterate_over_array_of_ints		# Jump back to main iteration
