pantalla   		.equ    0xFF00
teclado    		.equ    0XFF02
fin   		 	.equ    0xFF01

				.globl		nombre
				.globl		adios
				.globl		cola_adios
				.globl		recoger_movimiento
				.globl		imprime_cadena
				.globl		imprime_numero_2_cifras
				.globl		movimiento_legal		
				.globl		es_movimiento_legal
				.globl		puzzle_elegido
				.globl		ejecutar_movimiento
				.globl		puzzle_main
				.globl		comprobar_movimiento_legal
				.globl		movimiento
				.globl		numero_a_presentar
				.globl		num_1cifra
				.globl		num_2cifra
				.globl		num_1cifra_aux
				.globl		num_2cifra_aux
				.globl		volver_de_ejecutar_movimiento
				.globl		cargar_trofeo

				.globl		puzzle_tamano
				.globl		puzzle_numero
	
				.include	"tableros.asm"

        				;; Variables:

puzzle_resuelto:			.asciz			"ABCDEFGHIJKLMNO"
puzzle_pieza:				.asciz			""

separador_horizontal_inicio:	.asciz		"\n_________________________________________\n\n|\t\t\t\t\t|\n\n|"
separador_horizontal_fin:	.asciz		"\n_________________________________________\n\n"

pedir_movimiento_txt:			.asciz			"\nIntroduce el movimiento que quieras realizar (A/W/S/D, X para salir):\n"
movimiento:				.byte			0

movimiento_no_permitido_txt:		.asciz			"\nEse movimiento no esta permitido.\n"
opcion_no_correcta_txt:			.asciz			"\nLa opcion introducida no es correcta.\n"

numero_a_presentar:			.byte			0
num_movimientos:			.byte			0
num_aciertos:				.byte			0

movimientos_txt:			.asciz			"\nMovimientos realizados: "
aciertos_txt:				.asciz			"\nPiezas colocadas: "
salto_linea:				.asciz			"\n"

victoria_txt:				.asciz			"\nHas ganado!! Enhorabuena "
cola_victoria:				.asciz			"!!\n\n"
adios:					.asciz			"\nHasta luego "
cola_adios:				.asciz			"!\n"
max_movimientos_txt:			.ascii			"\nUps, has llegado al numero maximo de movimientos posibles. "
					.asciz			"Vuelve a intentarlo, seguro que ahora necesitas menos ;) \n"

presiona_tecla:				.asciz			"\nPresiona una tecla para continuar: "


        				;; Fin Variables

        		;; Programa

recoger_movimiento:
				
		lda		num_movimientos
		cmpa		#60
		bgt		llamar_max_movimientos

		ldx		#movimientos_txt
		jsr		imprime_cadena
		
		lda		num_movimientos
		sta		numero_a_presentar
		jsr		imprime_numero_2_cifras
		
		ldx		#salto_linea
		jsr		imprime_cadena

		ldx		#aciertos_txt
		jsr		imprime_cadena
		
		jsr		contar_piezas_colocadas
		lda		num_aciertos
		sta		numero_a_presentar
		jsr		imprime_numero_2_cifras
		
		ldx		#salto_linea
		jsr		imprime_cadena
		
		ldx		#pedir_movimiento_txt
		jsr		imprime_cadena
		
		lda		teclado
		sta		movimiento
		
		cmpa		#'a
		bne		comp_A				
		bra		comprobar_movimiento

llamar_max_movimientos:
		bra		max_movimientos
comp_A:
		cmpa		#'A
		bne		comp_d
		bra		comprobar_movimiento
comp_d:
		cmpa		#'d
		bne		comp_D
		bra		comprobar_movimiento
comp_D:
		cmpa		#'D
		bne		comp_w
		bra		comprobar_movimiento
comp_w:		
		cmpa		#'w
		bne		comp_W
		bra		comprobar_movimiento
comp_W:
		cmpa		#'W
		bne		comp_s
		bra		comprobar_movimiento
comp_s:
		cmpa		#'s
		bne		comp_S
		bra		comprobar_movimiento
comp_S:
		cmpa		#'S
		bne		comp_x
		bra		comprobar_movimiento
comp_x:
		cmpa		#'x
		bne		comp_X

		ldx		#adios
		jsr		imprime_cadena
		
		ldx		#nombre
		jsr		imprime_cadena
		
		ldx		#cola_adios
		jsr		imprime_cadena
		
		jmp		puzzle_main
comp_X:
		cmpa		#'X
		bne		movimiento_no_permitido

		ldx		#adios
		jsr		imprime_cadena
		
		ldx		#nombre
		jsr		imprime_cadena
		
		ldx		#cola_adios
		jsr		imprime_cadena
		
		jmp		puzzle_main				

max_movimientos:
		ldx		#max_movimientos_txt
		jsr		imprime_cadena
		jmp		puzzle_main

opcion_no_correcta:
		ldx		#opcion_no_correcta_txt
		jsr		imprime_cadena
		jsr		mostrar_tablero
		jmp		recoger_movimiento

comprobar_movimiento:
		
		jsr 		comprobar_movimiento_legal
		lda 		es_movimiento_legal
		cmpa 		#0
		beq 		movimiento_no_permitido
		cmpa 		#1
		beq 		movimiento_legal

movimiento_no_permitido:
		ldx 		#movimiento_no_permitido_txt
		jsr 		imprime_cadena
		jsr		mostrar_tablero
		jmp 		recoger_movimiento

movimiento_legal:

		lda		num_movimientos
		inca
		sta		num_movimientos				

		jmp 		ejecutar_movimiento

volver_de_ejecutar_movimiento:				
		jsr 		mostrar_tablero 
		jsr 		contar_piezas_colocadas

		ldb		num_aciertos
		cmpb		#15
		beq		victoria
		jmp		recoger_movimiento

victoria:
		ldx		#movimientos_txt
		jsr		imprime_cadena

		lda		num_movimientos
		sta		numero_a_presentar
		jsr		imprime_numero_2_cifras
		
		ldx		#salto_linea
		jsr		imprime_cadena

		ldx		#aciertos_txt
		jsr		imprime_cadena
		
		lda		num_aciertos
		sta		numero_a_presentar
		jsr		imprime_numero_2_cifras
		
		ldx		#salto_linea
		jsr		imprime_cadena
		
		ldx		#victoria_txt
		jsr		imprime_cadena
		
		ldx		#nombre
		jsr		imprime_cadena
		
		ldx		#cola_victoria
		jsr		imprime_cadena

		jsr		cargar_trofeo

		ldx		#presiona_tecla
		jsr		imprime_cadena
		lda 		teclado
		ldx		#salto_linea
		jsr		imprime_cadena

		jmp 		puzzle_main

contar_piezas_colocadas:
		
		ldx		#puzzle_elegido
		ldy		#puzzle_resuelto
		ldb		#0
		stb		num_aciertos
		pshs   		a

siguiente_pieza:  
		
		lda    		,x+
		beq    		ret_pieza

		ldb    		,y+
		stb    		puzzle_pieza

		cmpa   		puzzle_pieza
		beq		incr_aciertos

		bra    		siguiente_pieza

ret_pieza:
		puls    	a
		rts

incr_aciertos:
		ldb    num_aciertos
		incb
		stb    num_aciertos
		bra    siguiente_pieza

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

