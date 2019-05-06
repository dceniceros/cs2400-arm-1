		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds.
		;		Assume you are given the count of array elements.
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.

		ADR		r0, chars
		LDR		r1, [r0]
		MOV		r3, #4
loop	TST		r2, #1048576
		BGE		work
		SUBS	r5, count, r3
		BNE		loop
		END
work	ADD		r6, r6, #16
		ADD		r6, r6, #15
		ADD		r6, r6, #10
		ADD		r6, r6, #9
		ADD		r6, r6, #7
		ADD		r6, r6, #5
		ADD		r4, r6, r1
		STR		r4, [r0]
		SUBS	r5, count, r3
		BNE		loop
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
count	DCD		11
caps	FILL	4
