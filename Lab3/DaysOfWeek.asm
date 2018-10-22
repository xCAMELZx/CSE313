; CLASS: CSE 313 MACHINE ORGANIZATION 
; TERM: FALL 2018 
; NAME(S): YOUSEF JARRAR, AUDREY CARDS 
; LAB #3 - DAYS OF THE WEEK 
; DESCRIPTION: The purpose of this lab is to take the user's input and output the corresponding day. 
; They will have the ability to select all 7 days. Formatted in LC3 as 0-6. 0 is Sunday; 6 is Saturday. 
; If the input is other than defined #'s. It will not output anything. 

	.ORIG x3100
	LEA R0, PROMPT
	PUTS	;Outputs the message "Enter a Number"  
	GETC	;User input, # inputted 
	ADD R3, R0, #0 
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16  ;Subtracted -16 (3 times).. We can only add 5 bits at a time 
	LEA R0, DAYS
	ADD R3, R3, #0 

LOOP
	BRz DISPLAY
	ADD R0, R0, #10
	ADD R3, R3, #-1
	BR LOOP 
	
DISPLAY PUTS 
	HALT 

	PROMPT .STRINGZ " Please enter the number: " 

	DAYS
	 .STRINGZ "Sunday   " 
	 .STRINGZ "Monday   " 
	 .STRINGZ "Tuesday  " 
	 .STRINGZ "Wednesday" 
	 .STRINGZ "Thursday " 
	 .STRINGZ "Friday   " 
	 .STRINGZ "Saturday "

	.END   