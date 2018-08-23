pantalla	.equ		#0xFF00

		.globl 		mostrar_tablero
		.globl		puzzle_elegido
		.globl		imprime_cadena
		.globl		recoger_movimiento
		.globl		puzzle_tamano
		.globl		puzzle_numero
	
		.include	"tableros.asm"	

        	;; Variables:

separador_horizontal_inicio:	.asciz		"\n_________________________________________\n\n|\t\t\t\t\t|\n\n|"
separador_horizontal_fin:	.asciz		"\n_________________________________________\n\n"

        	;; Fin Variables

        	;; Programa

mostrar_tablero:

		ldb		puzzle_tamano
		ldx		#separador_horizontal_inicio
		jsr		imprime_cadena

		ldx 		#puzzle_elegido
		jsr		imprime_tablero
		
		ldx		#separador_horizontal_fin
		jsr		imprime_cadena
		
		rts

imprime_tablero:  		

		cmpb 		#0
		beq		imprime_tablero_nueva_fila

		lda		#'\t
		sta		pantalla
		lda 		,x+					
		sta		pantalla
		decb

		cmpa 		#'\0
		beq		imprime_tablero_salir

		bra		imprime_tablero

imprime_tablero_nueva_fila:
			
		ldb		#'\t
		stb		pantalla
		
		ldb		#124
		stb		pantalla
		
		ldb		#'\n
		stb		pantalla
		
		ldb		#'\n
		stb		pantalla
		
		ldb		#124
		stb		pantalla
		
		ldb		puzzle_tamano
		
		bra		imprime_tablero

imprime_tablero_salir:
			
		ldb		#'\t
		stb		pantalla
		
		ldb		#'\t
		stb		pantalla
		
		ldb		#'\t
		stb		pantalla
		
		ldb		#'\t
		stb		pantalla
		
		ldb		#124
		stb		pantalla
			
		rts
