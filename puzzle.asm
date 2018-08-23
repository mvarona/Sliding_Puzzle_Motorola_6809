			.module			puzzle_main

pantalla	.equ    0xFF00
teclado		.equ    0XFF02
fin		.equ    0xFF01			

			.globl			imprime_menu
			.globl			recoger_nombre
			.globl			pedir_tablero
			.globl			mostrar_tablero
			.globl			recoger_movimiento
			.globl			puzzle_main
			.globl			acabar

			; Programa:

puzzle_main:

 			jsr 			imprime_menu
			jsr 			recoger_nombre
			jsr 			pedir_tablero
			jsr 			mostrar_tablero
			jsr 			recoger_movimiento
			jmp 			acabar

acabar:			
			.area 			FIJA (ABS)
			.org 			0xFFFE     	; Vector de RESET
			.word 			puzzle_main
