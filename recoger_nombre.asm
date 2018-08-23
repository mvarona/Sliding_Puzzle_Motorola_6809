			.module			recoger_nombre		

pantalla   	.equ		0xFF00
teclado    	.equ   		0XFF02
fin        	.equ    	0xFF01	

			.globl	nombre	
			.globl	adios
			.globl	cola_adios
			.globl	recoger_movimiento
			.globl	imprime_cadena
			.globl	imprime_numero_2_cifras
			.globl	movimiento_legal
			.globl	es_movimiento_legal	
			.globl	puzzle_elegido
			.globl	ejecutar_movimiento
			.globl	mostrar_tablero
			.globl	pedir_tablero
			.globl	recoger_nombre

        	;; Variables:

introduce_nombre:		.asciz		"\nIntroduce tu nombre (max. 10 caracteres):\n"
nombre:				.asciz		"          "
bienvenido:			.asciz		"\nBienvenido "
cola_bienvenido:		.asciz		"!\n"
error_nombre:			.asciz		"\nEl nombre no es correcto. Por favor, vuelve a intentarlo:\n"
salto_linea:			.asciz		"\n"


        	;; Fin Variables

        	;; Programa
recoger_nombre:

		ldx		#introduce_nombre
		jsr		imprime_cadena

		jsr		cargar_nombre

		ldx		#bienvenido
		jsr		imprime_cadena

		ldx		#nombre
		jsr		imprime_cadena

		ldx		#cola_bienvenido
		jsr		imprime_cadena

		rts

volver_de_mostrar_error_nombre:
; Vuelve a intentar la carga del nombre, al cierre vuelve a la
; presentacion de bienvenido (fin del 'jsr cargar_nombre' de recoger_nombre):
		jsr		cargar_nombre
		rts

cargar_nombre:

        	ldb		#0
		jmp		cargar_nombre_siguiente

cargar_nombre_siguiente:
		
		incb
		cmpb		#1
		beq		llamar_cargar_nombre_1
		cmpb		#2
		beq		llamar_cargar_nombre_2
		cmpb		#3
		beq		llamar_cargar_nombre_3
		cmpb		#4
		beq		llamar_cargar_nombre_4
		cmpb		#5
		beq		llamar_cargar_nombre_5
		cmpb		#6
		beq		llamar_cargar_nombre_6
		cmpb		#7
		beq		llamar_cargar_nombre_7
		cmpb		#8
		beq		llamar_cargar_nombre_8
		cmpb		#9
		beq		llamar_cargar_nombre_9
		cmpb		#10
		beq		llamar_cargar_nombre_10
		cmpb		#11
		beq		llamar_cargar_nombre_11
		cmpb		#11
		bhi		mostrar_error_nombre

llamar_cargar_nombre_1:
		jmp		cargar_nombre_1
llamar_cargar_nombre_2:
		jmp		cargar_nombre_2
llamar_cargar_nombre_3:
		jmp		cargar_nombre_3
llamar_cargar_nombre_4:
		jmp		cargar_nombre_4
llamar_cargar_nombre_5:
		jmp		cargar_nombre_5
llamar_cargar_nombre_6:
		jmp		cargar_nombre_6
llamar_cargar_nombre_7:
		jmp		cargar_nombre_7
llamar_cargar_nombre_8:
		jmp		cargar_nombre_8
llamar_cargar_nombre_9:
		jmp		cargar_nombre_9
llamar_cargar_nombre_10:
		jmp		cargar_nombre_10
llamar_cargar_nombre_11:
		jmp		cargar_nombre_11
mostrar_error_nombre:						; Borra nombre
		ldx		#error_nombre
		jsr		imprime_cadena
		ldx		#introduce_nombre
		jsr		imprime_cadena
		jmp		volver_de_mostrar_error_nombre

cargar_nombre_return:
		rts

cargar_nombre_1:
		lda		teclado
		cmpa		#10				; Salto de linea
		beq		cerrar_nombre_1
		sta		nombre+0
		jmp		cargar_nombre_siguiente
cerrar_nombre_1:
		jmp		mostrar_error_nombre
cargar_nombre_2:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_2
		sta		nombre+1
		jmp		cargar_nombre_siguiente
cerrar_nombre_2:
		lda		#'\0
		sta		nombre+1
		jmp		cargar_nombre_return
cargar_nombre_3:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_3
		sta		nombre+2
		jmp		cargar_nombre_siguiente
cerrar_nombre_3:
		lda		#'\0
		sta		nombre+2
		jmp		cargar_nombre_return
cargar_nombre_4:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_4
		sta		nombre+3
		jmp		cargar_nombre_siguiente
cerrar_nombre_4:
		lda		#'\0
		sta		nombre+3
		jmp		cargar_nombre_return
cargar_nombre_5:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_5
		sta		nombre+4
		jmp		cargar_nombre_siguiente
cerrar_nombre_5:
		lda		#'\0
		sta		nombre+4
		jmp		cargar_nombre_return
cargar_nombre_6:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_6
		sta		nombre+5
		jmp		cargar_nombre_siguiente
cerrar_nombre_6:
		lda		#'\0
		sta		nombre+5
		jmp		cargar_nombre_return
cargar_nombre_7:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_7
		sta		nombre+6
		jmp		cargar_nombre_siguiente
cerrar_nombre_7:
		lda		#'\0
		sta		nombre+6
		jmp		cargar_nombre_return
cargar_nombre_8:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_8
		sta		nombre+7
		jmp		cargar_nombre_siguiente
cerrar_nombre_8:
		lda		#'\0
		sta		nombre+7
		jmp		cargar_nombre_return
cargar_nombre_9:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_9
		sta		nombre+8
		jmp		cargar_nombre_siguiente
cerrar_nombre_9:
		lda		#'\0
		sta		nombre+8
		jmp		cargar_nombre_return
cargar_nombre_10:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_10
		sta		nombre+9
		jmp		cargar_nombre_siguiente
cerrar_nombre_10:
		lda		#'\0
		sta		nombre+9
		jmp		cargar_nombre_return
cargar_nombre_11:
		lda		teclado
		cmpa		#10
		beq		cerrar_nombre_11
		jmp		mostrar_error_nombre
cerrar_nombre_11:
		lda		#'\0
		sta		nombre+10
		jmp		cargar_nombre_return
