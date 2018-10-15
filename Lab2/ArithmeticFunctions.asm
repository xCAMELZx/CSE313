; Class: CSE 313 Machine Organization Lab 
; Term: Fall 2018 
; Name(s): Yousef Jarrar, Audrey Cards 
; Lab #2: Arithmetic Functions 
; Description: We are going to take the values from x3120 and x3121 from 1 and 0 
; We then take the values and subtract them, and store the data into x3122. 
; We have to remember to take 1's compliments and add a 1 to it. EG: if it was 7 - 2, it turns into 7 + (-2)
; We store the values into x3123 and x3124 -- this does the comparison 
; It then places the final value into x3125

.ORIG x3000 

	LDI R0, X;				; R0 defined as X
	LDI R1, Y;				; R1 defined as Y 

;SUBTRACT 
	NOT R2, R1				; 1's Compliment of R1 (Y) 
	ADD R2, R2, #1				; 2s Compliment of R2 is (Y) 
	ADD R3, R0, R2				; Perform Subtraction 
	STI R3, subtraction 			; Stores values into [x3122]

;ABSOLUTE VALUE (X) 
	ADD R4, R0 #0				;R4 becomes X 
	BRzp ZPX
	NOT R4, R4
	ADD R4, R4, #1 

	ZPX STI R4, abs_x			;Store into [x3123] 

	
;ABSOLUTE VALUE (Y)
	ADD R5, R1, #0				;R5 becomes Y 
	BRzp ZPY 
	NOT R5, R5
	ADD R5, R5, #1 

	ZPY STI R5, abs_y			;Stores in [x3124] 

	
;Z CODE
		

	NOT R5, R5				;1's Compliment of Absolute Value of Y
		
	ADD R5, R5, #1				;2's compliment of Y
		
	ADD R6, R4, R5				; X + (-Y)
		
	BRn yBig
		
	BRz Equal
		
	BRp xBig

		

	Equal	
		
	ADD R7, R7, #0		
		
	STI R7, larger				; 0 stored in [x3125] if X = Y


	ADD R7, R7, #0

	STI R7, larger				; 0 stored in x3125 if X = Y

	
	
	HALT

	

	xBig
	
	ADD R7, R7, #1
	
	STI R7, larger				; 1 stored in [x3125] if X > Y

	
	STI R7, larger				; 1 stored in x3125 if X > Y

	
	HALT 

	

	yBig
	
	ADD R7, R7, #2
	
	STI R7, larger		; 2 stored in [x3125] if Y > X
	

	
	STI R7, larger		; 2 in x3125 if Y > X

	
	
	HALT

	
	
	X .FILL x3120			; Value in x3120 and stores it into X
	
	Y .FILL x3121			; Value in x3121 and stores it into Y
	
	subtraction .FILL x3122 	; Difference of X and Y
	
	abs_x .FILL x3123		; Store the value of |X|
	
	abs_y .FILL x3124		; Store the value of |Y|
	
	larger .FILL x3125 		; Compares the values and stores the information in the register. 

	

	.END
