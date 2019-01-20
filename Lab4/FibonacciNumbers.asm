;CLASS: CSE 313 - MACHINE ORGANIZATION
;INSTRUCTOR: TALINE GEORGIOU
;TERM: FALL 2018
;NAME: YOUSEF JARRAR, AUDREY CARDS
;LAB 4 - FIBONACCI NUMBERS
;DESCRIPTION: THIS PROGRAM WILL CALCULATE FIBONACCI NUMBER PROVIDED
; IT WILL ALSO LOCATE THE HIGHEST FIBONACCI NUMBER (Fn, n-th Fibonacci #)
; The program will locate the largest Fn so no overflow happens, Takes Fn
; N, and FN. The "n" value lis located in the data file. 

	.ORIG x3000

	LDI R1, INPUT
	AND R2, R2, #0
	ADD R2, R1, #-2
	BRn X
	BRz Y

	BRp MORE
	X STI R1, F

	BR END

	Y ADD R1, R1, #-1
	STI R1, F

	BR END

	MORE  AND R3, R3, #0
	ADD R3, R3, #1
	AND R4, R4, #0
	ADD R4, R4, #1
	AND R5, R5, #0
	AND R6, R6, #0
	ADD R6, R6, R1
	ADD R6, R6 ,#-2

	LOOP ADD R5, R3, R4 ;F = R3 + R4 which is == (X + Y )

	AND R3, R3, #0
	ADD R3, R3, R4
	AND R4, R4, #0
	ADD R4, R4, R5
	ADD R6, R6, #-1
	BRp LOOP

	STI R5, F

	END AND R3, R3, #0

	ADD R3, R3, #1
	AND R4, R4, #0
	ADD R4, R4, #1
	AND R2, R2, #0
	ADD R2, R2, #2
	AND R5, R5, #0

	LOOP2 ADD R5, R3, R4 ;R5 = R3 + R4 (Fn = X + Y)

	BRn STORES
	AND R3, R3, #0
	ADD R3, R3, R4
	AND R4, R4, #0
	ADD R4, R4, R5
	ADD R2, R2 ,#1

	BR LOOP2

	STORES NOT R3, R3
	ADD R3, R3, #1
	ADD R5, R5, R3

	STI R5, Fn
	STI R2, N
	HALT

	INPUT	.FILL x3100
	F		.FILL x3101
	N		.FILL X3102
	Fn		.FILL x3103


	.END
