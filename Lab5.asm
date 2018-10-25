  	.ORIG x3000

    	LDI R1, X       ; get X from data file
    	LDI R2, Y       ; get Y from data file

    	JSR MULT
    	STI R3, Prod	;stores the product 

    	JSR DIV
    	STI R4, Quo	;stores quotient
	STI R5, Rem	;stores reaminder	
	
    	HALT

X	.FILL x3100
Y	.FILL x3101
Prod	.FILL x3102
Quo	.FILL x3103
Rem	.FILL x3104

MULT

    	ADD R1, R1, #0
    	BRn NegX          ; check to see if X is negative
    	ADD R2, R2, #0
    	BRn NegY          ; if X is not negative, check if Y is negative
	
	
 NegX
    	ADD R2, R2, #0    ; initialize Y
    	BRn NegBoth       ; X is negative, check if Y is also negative
    	NOT R1, R1        ; Since X is negative, make it positive
    	ADD R4, R2, #0    ; R4 will be the counter      


XLoop
        ADD R3, R1, R2    ; R3 will store the product
        ADD R4, R4, #-1
        BRp XLoop
        NOT R3, R3
	RET

NegY
    	NOT R2, R2        ; only Y should be negative here
	ADD R4, R2, #0    ; R4 will be the counter

YLoop
    	ADD R3, R1, R2    ; R3 will store the product
    	ADD R4, R4, #-1
    	BRp YLoop
    	NOT R3, R3
    	RET

NegBoth
    	NOT R1, R1
    	NOT R2, R2        ; at this point would have originally been negative
    	;ADD R4, R2, #0    ; R4 will be the counter    		  
BothLoop
	ADD R4, R2, #0	  ; R4 = counter	
	ADD R3, R1, R2    ; R3 will store the product
    	ADD R4, R4, #-1
    	BRp BothLoop
    	RET

DIV	AND R4, R4, #0    ; clear R4, will be quotient
    	AND R5, R5, #0    ; clear R5, will be remainder
    	ADD R1, R1, #0
    	BRz Stop
    	ADD R2, R2, #0
	BRnz Stop

    	ADD R6, R1, #0    ; store X in R6, is temp

DivLoop	NOT R2, R2	  ; make Y negative to subtract
    	ADD R6, R2, #0    ; subtract Y from X
    	ADD R4, R4, #1    ; increase the quotient
    	ADD R6, R6, #0    ; check to make sure temp >= Y
    	BRp DivLoop
    	ADD R5, R6, #0    ; remainder = temp

    	RET

Stop	RET
    	


	.END