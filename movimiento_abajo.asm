        	.module			movimiento_abajo

pantalla	.equ    	0xFF00
teclado		.equ    	0XFF02
fin       	.equ    	0xFF01
		
		.globl		puzzle_elegido
		.globl 		movimiento_abajo
		.globl		imprime_cadena	

		;; Variables:

temp:				.byte		0
posicion_espacio:		.byte		0

        	;; Fin Variables

        	;; Programa

movimiento_abajo:

		ldx		#puzzle_elegido
		jsr		calcular_posicion_espacio

		ldx		#puzzle_elegido		
		jsr		mover_abjo
		
		rts

calcular_posicion_espacio:

		ldb		#0

calcular_posicion_espacio_siguiente:  

		lda     	,x+
		beq    		calcular_posicion_espacio_return
		cmpa		#32
		beq		calcular_posicion_espacio_return
		incb
		bra		calcular_posicion_espacio_siguiente

calcular_posicion_espacio_return:
		stb		posicion_espacio
		rts

mover_abjo:

       		pshs   		a, b
		ldb		#0

mover_abjo_siguiente:  

		lda     	,x+
		cmpb		posicion_espacio
		beq     	mover_abjo_saltar
		incb
		cmpb		#17			; Longitud maxima tablero
		beq		salir

mover_abjo_volver:

		sta		puzzle_elegido-1,x
       		bra     	mover_abjo_siguiente

salir:
		puls		a,b
		rts

mover_abjo_saltar:
		pshs		b		
		ldb		posicion_espacio
		cmpb		#0
		beq		llamar_mover_abjo_0
		cmpb		#1
		beq		llamar_mover_abjo_1
		cmpb		#2
		beq		llamar_mover_abjo_2
		cmpb		#3
		beq		llamar_mover_abjo_3
		cmpb		#4
		beq		llamar_mover_abjo_4
		cmpb		#5
		beq		llamar_mover_abjo_5		
		cmpb		#6
		beq		llamar_mover_abjo_6
		cmpb		#7
		beq		llamar_mover_abjo_7
		cmpb		#8
		beq		llamar_mover_abjo_8
		cmpb		#9
		beq		llamar_mover_abjo_9
		cmpb		#10
		beq		llamar_mover_abjo_10
		cmpb		#11
		beq		llamar_mover_abjo_11
		jmp		mover_abjo_siguiente

llamar_mover_abjo_0:
		jmp		mover_abjo_0 	
llamar_mover_abjo_1:
		jmp		mover_abjo_1
llamar_mover_abjo_2:
		jmp		mover_abjo_2
llamar_mover_abjo_3:
		jmp		mover_abjo_3
llamar_mover_abjo_4:
		jmp		mover_abjo_4
llamar_mover_abjo_5:
		jmp		mover_abjo_5
llamar_mover_abjo_6:
		jmp		mover_abjo_6
llamar_mover_abjo_7:
		jmp		mover_abjo_7
llamar_mover_abjo_8:
		jmp		mover_abjo_8
llamar_mover_abjo_9:
		jmp		mover_abjo_9
llamar_mover_abjo_10:
		jmp		mover_abjo_10
llamar_mover_abjo_11:
		jmp		mover_abjo_11
mover_abjo_0:
		ldd		puzzle_elegido+4
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+4	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido		; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente
		
mover_abjo_1:
		ldd		puzzle_elegido+5
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+5	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+1	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_2:
		ldd		puzzle_elegido+6
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+6	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+2	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_3:	
		ldd		puzzle_elegido+7
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+7	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+3	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_4:
		ldd		puzzle_elegido+8
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+8	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+4	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_5:	
		ldd		puzzle_elegido+9
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+9	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+5	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_6:
		ldd		puzzle_elegido+10
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+10	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+6	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_7:
		ldd		puzzle_elegido+11
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+11	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+7	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_8:	
		ldd		puzzle_elegido+12
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+12	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+8	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_9:	
		ldd		puzzle_elegido+13
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+13	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+9	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_10:	
		ldd		puzzle_elegido+14
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+14	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+10	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente

mover_abjo_11:	
		ldd		puzzle_elegido+15
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+15	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+11	; Posicion para el caracter
		puls		b
		jmp		mover_abjo_siguiente
