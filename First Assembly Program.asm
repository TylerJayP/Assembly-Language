.data 


  integerOne:		.word 
  integerTwo:		.word 
  integerThree:		.word 
  sumOfAllThree: 	.word
  smallestOfThree:	.word
  largestOfThree:	.word
  goAgain:		.word
  newLine: 		.word

  
  integerOnePrompt:	    .asciiz "Enter the first integer: "
  integerTwoPrompt:	    .asciiz "Enter the second integer: "
  integerThreePrompt:	    .asciiz "Enter the third integer: "
  newline:		    .asciiz "\n"
  sumOfThreeInts:	    .asciiz "The sum of the 3 integers: "
  smallestOfThreeInts:      .asciiz "The smallest of the 3 integers: "
  largestOfThreeInts:	    .asciiz "The largest of the 3 integers: "
  userGoAgain:		    .asciiz "Input 0 to exit OR 1 to input new integers: " 

  


.text 

main:
Loop:

				   # Print the prompt for integerOne
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, integerOnePrompt 		# address of integerOnePromt is in $a0
  syscall           			# print the string


				   # Read the first integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy the first integer into $8


				   # Print the prompt for integerTwo
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, integerTwoPrompt 		# address of integerTwoPrompt is in $a0
  syscall           			# print the string
  
  
				   # Read the second integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$9, $0, $v0			# copy the second integer into $9
  
  
 				   # Print the prompt for integerThree
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, integerThreePrompt 	# address of integerThree is in $a0
  syscall           			# print the string
  
  
				  # Read the third integer
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$10, $0, $v0			# copy the thirs integer into $10
  
  
    				# Print a newline
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of newLine string is in $a0
  syscall           			# print the string
  
 
  				# Calculating the sum of the 3 integers that have been input
  add $t3, $8, $9			# adding integerOne + integerTwo and putting it onto $t3
  add $t4, $t3, $10			# adding integerOne+integerTwo($t3) + integerThree and putting it onto $t4
 

   				# Print "The sum of the 3 integers"	
  addi $v0, $0, 4			# system call 4 is for print a string
  la $a0, sumOfThreeInts		# address of sumOfThreeInts string is in $a0
  syscall				# print the string
  
  				# Print the numeric sum of the 3 integers
  addi $v0, $0, 1			# system call 1 is for printing an integer
  add $a0, $0, $t4			# bring the sum of all 3 integers value from $t4 into $a0
  syscall				# print the integer
  
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of newLine string is in $a0
  syscall           			# print the string
  
  
  blt $8, $9, elseOne 	 		# if ($8 < $9) go to elseOne
  bgt $8, $10 anotherElseOne	
  
  #$9 is smallest
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  syscall
  
  addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  add 	$a0, $0, $9 			# bring the second integer value from $9 into $a0
  syscall  				# print the integer

  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of newLine string is in $a0
  syscall   				# print the string
  
  #$10 is bigges
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  syscall
  
  addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  add 	$a0, $0, $10 			# bring the third integer value from $10 into $a0a0
  syscall  

  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 			# address of newLine string is in $a0
  syscall   
  
  j runAgain
 
 
elseOne:
	blt $8, $10, elseTwo 	 	# if ($8 < $10)
 	
  	#$10 is smallest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $10 			# bring the third integer value from $10 into $a0
  	syscall  				# print the integer

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   				# print the string
  
  	#$9 is biggest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $9 			# bring the second integer value from $9 into $a0
  	syscall  

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall           			# print the string
  
  	j runAgain
  
  
elseTwo:
	blt $9, $10, elseThree 		# if ($9 < $10)
	
	#$8 is smallest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $8 			# bring the first integer value from $8 into $a0
  	syscall  				# print the integer

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   				# print the string
  
        #$9 is biggest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $9 			# bring the second integer value from $9 into $a0
  	syscall  

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   

	j runAgain


elseThree:
	#$8 is smallest
		
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $8			# bring the first integer value from $8 into $a0
  	syscall  				# print the integer

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   				# print the string
  
  	#$10 is biggest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $10 			# bring the third integer value from $10 into $a0
  	syscall  

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   

	j runAgain

		
anotherElseOne:
	blt $9, $10, anotherElseTwo
	
	#$1o is smallest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $10 			# bring the third integer value from $10 into $a0
  	syscall  				# print the integer

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   				# print the string
  
  	#$8 is biggest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $8			# bring the first integer value from $8 into $a0
  	syscall  

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   

	j runAgain

		
anotherElseTwo:

	#9 is smallest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, smallestOfThreeInts 	# address of smallestOfThreeInts is in $a0
  	syscall
  
	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $9 			# bring the second integer value from $9 into $a0
  	syscall  				# print the integer

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   				# print the string
  
  	#8 is biggest
  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, largestOfThreeInts 	# address of largestOfThreeInts is in $a0
  	syscall
  
  	addi 	$v0, $0, 1  		 # system call 1 is for printing an integer
  	add 	$a0, $0, $8 			# bring the first integer value from $8 into $a0
  	syscall  

  	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall   

  	j runAgain


runAgain:	
	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, newline 			# address of newLine string is in $a0
  	syscall           			# print the string
  
  
			  	 	# Print the prompt for tryAgain
	addi 	$v0, $0, 4  			# system call 4 is for printing a string
  	la 	$a0, userGoAgain		# address of userGoAgain is in $a0
  	syscall           			# print the string


				  	# Read the first integer
  	addi	$v0, $0, 5			# system call 5 is for reading an integer
  	syscall 				# integer value read is in $v0
  	add	$11, $0, $v0			# copy the first integer into $8
  

	bgtz $11, Loop
	j exit
	
  			 
  				 # Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
  