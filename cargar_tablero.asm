
pantalla 	.equ    0xFF00
teclado 	.equ    0XFF02
fin 		.equ    0xFF01

		.globl	pedir_tablero
		.globl	puzzle_elegido
		.globl	mostrar_tablero
		.globl	recoger_movimiento
		.globl	imprime_cadena
			
		.include "tableros.asm"

		;; Variables

salto_linea:				.asciz		"\n"

puzzle_elegido:				.asciz		""
num_puzzle_elegido:			.byte		0
inicio_cargar_puzzle:			.byte		0

opcion_no_correcta_txt:			.asciz		"\nLa opcion seleccionada no es correcta.\n"

tablero_seleccionado_txt:		.asciz		"\nTablero seleccionado ("

introduzca_puzzle:			.asciz		"\nPara cargar un tablero, introduce un numero del 1 al 8:\n"
cola_introduzca_puzzle:			.asciz		":\n"

        	;; Fin Variables

        	;; Programa

pedir_tablero:

		lda		#'\0
		sta		puzzle_lista+128

		ldx		#introduzca_puzzle
		jsr		imprime_cadena

		ldb		teclado
		stb		num_puzzle_elegido
		
		ldx		#salto_linea
		jsr		imprime_cadena
		
		cmpb		#'1
		blo		opcion_no_correcta
		cmpb 		#'8		
		bhi		opcion_no_correcta

		ldx		#tablero_seleccionado_txt
		jsr		imprime_cadena
		
		lda		num_puzzle_elegido
		sta		pantalla
			
		lda		#')
		sta		pantalla
		ldx		#cola_introduzca_puzzle
		jsr		imprime_cadena
		
		ldx		#puzzle_lista
		jmp		seleccionar_tablero

seleccionar_tablero:
		
		ldb		num_puzzle_elegido
		cmpb		#'1
		beq		llamada_cargar_puzzle_1
		cmpb		#'2
		beq		llamada_cargar_puzzle_2
		cmpb		#'3
		beq		llamada_cargar_puzzle_3
		cmpb		#'4
		beq		llamada_cargar_puzzle_4
		cmpb		#'5
		beq		llamada_cargar_puzzle_5
		cmpb		#'6
		beq		llamada_cargar_puzzle_6
		cmpb		#'7
		beq		llamada_cargar_puzzle_7
		cmpb		#'8
		beq		llamada_cargar_puzzle_8

opcion_no_correcta:				
		ldx		#opcion_no_correcta_txt
		jsr		imprime_cadena
		jmp		pedir_tablero

llamada_cargar_puzzle_1:
		lda		#1
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_2:
		lda		#17
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_3:
		lda		#33
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_4:
		lda		#49
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_5:
		lda		#65
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_6:
		lda		#81
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_7:
		lda		#97
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle
llamada_cargar_puzzle_8:
		lda		#113
		sta		inicio_cargar_puzzle
		jsr		cargar_puzzle
		jmp		volver_cargar_puzzle

volver_cargar_puzzle:
		rts

cargar_puzzle:
		pshs   		a
		ldb		#0
cargar_puzzle_siguiente:
		lda    		,x+
		beq    		ret_cargar_puzzle
     		incb
		cmpb		inicio_cargar_puzzle
		blo		cargar_puzzle_siguiente
		
		sta		puzzle_elegido+0
		lda     	,x+
		sta		puzzle_elegido+1
		lda     	,x+
		sta		puzzle_elegido+2
		lda     	,x+
		sta		puzzle_elegido+3
		lda     	,x+
		sta		puzzle_elegido+4
		lda     	,x+
		sta		puzzle_elegido+5
		lda     	,x+
		sta		puzzle_elegido+6
		lda     	,x+
		sta		puzzle_elegido+7
		lda     	,x+
		sta		puzzle_elegido+8
		lda     	,x+
		sta		puzzle_elegido+9
		lda     	,x+
		sta		puzzle_elegido+10
		lda    		,x+
		sta		puzzle_elegido+11
		lda     	,x+
		sta		puzzle_elegido+12
		lda     	,x+
		sta		puzzle_elegido+13
		lda     	,x+
		sta		puzzle_elegido+14
		lda     	,x+
		sta		puzzle_elegido+15
		lda		#'\0
		sta		puzzle_elegido+16
ret_cargar_puzzle:
		puls    	a
		rts
