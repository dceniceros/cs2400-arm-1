		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		ADR		r0, numbers
		LDR		r1, [r0]		;this register loads the top multiplier
		LDR		r2, [r0, #4]	;this is for the bottom
		MOV		r3, #0
		MOV		r4, #0
loop	TST		r2, #1
		BEQ		shift
		ADDS	r4, r4, r1
shift	LSR		r2, r2, #1	;logical shift right for top multiplier
		LSL		r3, r3, #1	;logical shift left for top multiplier
		LSLS	r1, r1, #1
		ADC		r3, r3, #0
		CMP		r2, #0
		BGT		loop
		ADR		r0, result
		STR		r4, [r0]
		END
numbers DCD     0b1100101010010001, 0b1111010101000011
result	FILL	4
carry	FILL	4


