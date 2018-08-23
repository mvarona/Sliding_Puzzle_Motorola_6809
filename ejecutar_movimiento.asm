		.module			ejecutar_movimiento
	

pantalla	.equ    0xFF00
teclado		.equ    0XFF02
fin   	 	.equ    0xFF01

		
		.globl	ejecutar_movimiento
		.globl	puzzle_elegido
		.globl	movimiento
		.globl	movimiento_izquierda
		.globl	movimiento_derecha
		.globl	movimiento_arriba
		.globl	movimiento_abajo
		.globl	posicion_espacio
		.globl	volver_de_ejecutar_movimiento	

        ;; Variables:

posicion_espacio:	.byte		0

        ;; Fin Variables

        	;; Programa
ejecutar_movimiento:
		
		ldx	#puzzle_elegido
		jsr	calcular_posicion_espacio
		jmp	ejecutar_movimientos

calcular_posicion_espacio:

		ldb	#0

calcular_posicion_espacio_siguiente:  

		lda     ,x+
		beq    	calcular_posicion_espacio_return
		cmpa	#32
		beq	calcular_posicion_espacio_return
		incb
		bra	calcular_posicion_espacio_siguiente

calcular_posicion_espacio_return:
		stb	posicion_espacio
	    	rts

ejecutar_movimientos:

		pshs   	a,b

		ldb	movimiento		
		cmpb	#'A
		beq	ejecutar_movimiento_izquierda
		cmpb	#'a
		beq	ejecutar_movimiento_izquierda
		cmpb	#'D
		beq	ejecutar_movimiento_derecha
		cmpb	#'d
		beq	ejecutar_movimiento_derecha
		cmpb	#'W
		beq	ejecutar_movimiento_arriba
		cmpb	#'w
		beq	ejecutar_movimiento_arriba
		cmpb	#'S
		beq	ejecutar_movimiento_abajo
		cmpb	#'s
		beq	ejecutar_movimiento_abajo
		
		puls	a,b

ejecutar_movimiento_izquierda:
		jsr 	movimiento_izquierda
		jmp 	volver_de_ejecutar_movimiento
		rts

ejecutar_movimiento_derecha:
		jsr 	movimiento_derecha
		jmp 	volver_de_ejecutar_movimiento
		rts

ejecutar_movimiento_arriba:
		jsr 	movimiento_arriba
		jmp 	volver_de_ejecutar_movimiento
		rts

ejecutar_movimiento_abajo:
		jsr 	movimiento_abajo
		jmp 	volver_de_ejecutar_movimiento
		rts
