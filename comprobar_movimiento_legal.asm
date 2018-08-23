		.module			comprobar_movimiento_legal
			
	
	;definicion de constantes
fin			.equ	0xFF01
teclado		.equ	0xFF02
pantalla	.equ	0xFF00


espacio:		.byte	32
error_comprobar_movimiento:	.asciz "\nERROR: movimiento no valido\n"
es_movimiento_legal:	.byte	0
posicion_espacio:	.byte	0

		.globl	comprobar_movimiento_legal	
		.globl	puzzle_elegido
		.globl	movimiento
		.globl	movimiento_legal
		.globl	es_movimiento_legal
	

comprobar_movimiento_legal:

	ldx	#puzzle_elegido
	jsr	calcular_posicion_espacio
	
	ldx	#puzzle_elegido
	jsr	permitidos

	rts

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

permitidos:
;aqui comparamos si los movimientos estan permitidos o no
	
	lda movimiento
	cmpa #'a 
	beq  permitidos_mov_a	
	cmpa #'A
	beq permitidos_mov_a
	cmpa #'d
	beq permitidos_mov_d
	cmpa #'D
	beq permitidos_mov_d
	cmpa #'w
	beq permitidos_mov_w
	cmpa #'W
	beq permitidos_mov_w
	cmpa #'s
	beq permitidos_mov_s
	cmpa #'S
	beq permitidos_mov_s
	

	permitidos_mov_d:
		ldb posicion_espacio	
		cmpb #3	
		beq salir_movimiento_ilegal
		cmpb #7
		beq salir_movimiento_ilegal	
		cmpb #11
		beq salir_movimiento_ilegal
		cmpb #15
		beq salir_movimiento_ilegal

		jmp salir_movimiento_legal
		;jmp movimiento_legal

	permitidos_mov_a:
		ldb posicion_espacio
		cmpb #0
		beq salir_movimiento_ilegal
		cmpb #4
		beq salir_movimiento_ilegal
		cmpb #8
		beq salir_movimiento_ilegal
		cmpb #12
		beq salir_movimiento_ilegal

		jmp salir_movimiento_legal
		;jmp movimiento_legal		

	permitidos_mov_s:
		
		ldb posicion_espacio		
		cmpb #12
		beq salir_movimiento_ilegal		
		cmpb #13
		beq salir_movimiento_ilegal		
		cmpb #14
		beq salir_movimiento_ilegal
		cmpb #15
		beq salir_movimiento_ilegal

		jmp salir_movimiento_legal
		;jmp movimiento_legal

	permitidos_mov_w:
		ldb posicion_espacio
		cmpb #0
		beq salir_movimiento_ilegal
		cmpb #1
		beq salir_movimiento_ilegal
		cmpb #2
		beq salir_movimiento_ilegal
		cmpb #3
		beq salir_movimiento_ilegal

		jmp salir_movimiento_legal	
   		;jmp movimiento_legal
	


	rts

salir_movimiento_ilegal:
	lda #0
	sta es_movimiento_legal
	rts

salir_movimiento_legal:
	lda #1
	sta es_movimiento_legal
	rts


acabar:	 ; el programa acaba
    clra
	sta fin

    ;.org 0xFFFE     ; vector de RESET
    .word comprobar_movimiento_legal


