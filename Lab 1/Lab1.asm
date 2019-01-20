; Class CSE 313 : Machine Organization 
; Term :: Fall 2018 
; Name(s): Audrey Cards, Yousef Jarrar 
; Lab 1: ALU Operations 
; Description: We do some basic functions like adding, subtract, and NOT  & OR
; Before we can begin we must make sure our registers are set to 0 
; We start at x3000, and copied to values to the X & Y Registers. By defining that they are R1, and R2. 
; We then define functions that we learned in lab -- ex: x+y , x OR y , x AND y, etc... 
; Remember that LC3 does not have the OR option like it was described in class, We do this by completing a NOT ( X' AND Y')
; We need to test (10,20) (-11, 15) (11, -15) and (9, 12). We are testing 4 sets of variables when we compile 
; We have to insert the numbers in a DataFile.asm which starts at x3100 
; Where the first fill function is = x
; Where the second fill function is = y 
; Load the simulation program. First with the Data1.obj then Lab1.obj 

.ORIG x3000 
LEA R2, xFF
LDR R1, R2 x0 
LDR R3, R2 x1 

; X+Y 
ADD R4, R1, R3 ;R4 <-- R1 + R3 
STR R4, R2, x2 ; R4 <- [R2 + X2] = x3102

; X AND Y 
AND R4, R1, R3 ; R4 <-R1 and R3 
STR R4, R2, x3 ; R4 --> x3103 


; X OR Y 
NOT R5, R1 	; R5 <- X BAR 
NOT R6, R3 	; R6 <- Y BAR 
AND R4, R5, R6  ; R4 <- X BAR OR Y BAR 
NOT R4, R4  	; R4 <- X BAR BAR OR Y BAR BAR = X + Y 
STR R4, R2 x4 	; R4 [R2+x4] 
 
; NOT (X)
NOT R4, R1 	; R4 <- X BAR 
STR R4, R2, x5	; R4  -> x3105 

;NOT(Y) 
NOT R4, R3 	; R4 <- Y BAR 
STR R4, R2, x6  ; R4 -> x3106 


; X+3 
ADD R4, R1, x3	; R4 <- x+3 
STR R4, R2, x7	; R4 -> x3107 

;Y-3 
ADD R4, R3, x-3	; R4 <- Y-3 
STR R4, R2, x8	; R4 ->x3108 

; x even or odd 
AND R4, R1, x1	; R4 = x AND 00......01 
STR R4, R2, x9 	; R4 -> x3109 

HALT 
.END