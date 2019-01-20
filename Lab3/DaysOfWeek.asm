; CLASS: CSE 313 MACHINE ORGANIZATION
; INSTRUCTOR: TALINE GEORGIOU
; TERM: FALL 2018
; NAME(S): YOUSEF JARRAR, AUDREY CARDS
; LAB #3 - DAYS OF THE WEEK
; DESCRIPTION: The purpose of this lab is to take the user's input and output the corresponding day.
; They will have the ability to select all 7 days. Formatted in LC3 as 0-6. 0 is Sunday; 6 is Saturday.
; If the input is other than defined #'s. It will not output anything.
; Version 2 -- The original submitted DID NOT LOOP

	.ORIG x3100
RESTART	LEA R0, PROMPT
	PUTS	;Outputs the message "Enter a Number"
	GETC	;User input, # inputted

	ADD R3, R0, x0
	ADD R3, R3, #-16
	ADD R3, R3, #-16
	ADD R3, R3, #-16  ;Subtracted -16 (3 times).. We can only add 5 bits at a time

	AND R6, R6, #0 	  ; LOAD R6 WITH 0
	ADD R6, R6, R3	  ; LOAD CONTENT OF R3 INTO R6
	ADD R6, R6, #-6   ; R6 + (-6) = LOADS INTO R6

	BRp EXIT          ; IF CONDITION IS TRUE THEN HALT

	LEA R0, DAYS
	ADD R3, R3, x0


LOOP	BRz DISPLAY
	ADD R0, R0, #10
	ADD R3, R3, #-1
	BR LOOP

DISPLAY PUTS
	BR RESTART

EXIT	HALT

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
