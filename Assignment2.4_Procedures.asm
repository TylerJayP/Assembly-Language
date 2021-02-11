.data 


  alphabetG:	.word 
  alphabetH:	.word 
  alphabetI:	.word 
  alphabetJ:	.word
  newlinee:	.word
  result: 	.word
  
  enterG:	.asciiz "Enter g: "
  enterH:	.asciiz "Enter h: "
  enterI:	.asciiz "Enter i: "
  enterJ:	.asciiz "Enter j: "
  newline:      .asciiz "\n"
  resultText: .asciiz "leaf_example (int g, int h, int i, int j) returns f \n f = (g+h)-(i+j)\n f = "



.text

main:
				   # Print the prompt for integer for G
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, enterG 			# address of enterG is in $a0
  syscall           			# print the string


				   # Read the first integer for G
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$t0, $0, $v0			# copy the first integer into $t0
  
  				
  				    # Print the prompt for integer for H
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, enterH 			# address of enterH is in $a0
  syscall           			# print the string


				   # Read the first integer for H
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$t1, $0, $v0			# copy the first integer into $t1
  
  				   # Print the prompt for integer for I
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, enterI 			# address of enterI is in $a0
  syscall           			# print the string


				   # Read the first integer for I
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$t2, $0, $v0			# copy the first integer into $t2
  
  
  				   # Print the prompt for integer for J
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, enterJ 			# address of enterJ is in $a0
  syscall           			# print the string


				   # Read the first integer for J
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$t3, $0, $v0			# copy the first integer into $t3
  
  jal leaf_example
	

leaf_example:

	addi $sp, $sp, -4		
	sw $s0, 0($sp)			# save $s0 on the stack
	
	add $t4, $t0, $t1
	add $t5, $t2, $t3		# procedure body
	sub $t6, $t4, $t5
	
	add $v0, $s0, $zero		# result
	 
	lw $s0, 0($sp)			# restore $s0
	addi $sp, $sp, 4

	li $v0, 4 			# call for printing string
	la $a0, resultText 		# loads string to print into argument $a0
	syscall
	li $v0, 1 			# call for printing string
	move $a0, $t6 			# loads string to print into argument $a0
	syscall

	li $v0, 10
	syscall
  
	jr $ra
  
  
