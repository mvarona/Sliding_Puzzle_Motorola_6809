	.module puzzle

	.globl 	puzzle_lista
	.globl	puzzle_numero
	.globl	puzzle_tamano

puzzle_tamano:		.byte	4
puzzle_numero:		.byte	8
puzzle_lista:		.ascii	" BCDAFKGEIJHMNOL"	; 7  aciertos aapqppaa		;qqooaoqq 
			.ascii	"BCDHAFGLEJKOIMN "	; 4  aciertos pppaaaoooqqq	;aaapppqqqooo
			.ascii	" BCDAEGHIFJLMNKO"	; 9  aciertos papapa		;qoqoqo
			.ascii	"ABCDEFKGIJOHM NL"	; 9  aciertos aapqqp		;oaaoqq
			.ascii	"ABC EFGDIJKHMNOL"	; 12 aciertos aaa		;qqq
			.ascii	"ABCDEFGHIJKL MNO"	; 12 aciertos ppp		;ooo
			.ascii	"ABCDEFGH NJLIMKO"	; 9  aciertos papqpa		;qoaoqo
			.ascii	"ABC EFGDIJKHMNOL"	; 12 aciertos aaa		;qqq

