		.module		movimiento_derecha
        	
pantalla   	.equ    	0xFF00
teclado     	.equ    	0XFF02
fin         	.equ   		0xFF01

		.globl		puzzle_elegido
        	.globl 		movimiento_derecha
		.globl		imprime_cadena

        	;; Variables:
temp:				.byte			0
posicion_espacio:		.byte			0

        	;; Fin Variables

        	;; Programa
		
movimiento_derecha:

		ldx		#puzzle_elegido
		jsr		calcular_posicion_espacio

		ldx		#puzzle_elegido		
		jsr		mover_dcha
		
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

mover_dcha:

           	pshs   		a, b
		ldb		#0

mover_dcha_siguiente:  

		lda     	,x+
		cmpb		posicion_espacio
		beq    		mover_dcha_saltar
		incb		
		cmpb		#17			; Longitud maxima tablero
		beq		salir

mover_dcha_volver:

		sta		puzzle_elegido-1,x
            	bra     	mover_dcha_siguiente

salir:
		puls		a,b
		jmp		eliminar_primera_posicion
		
eliminar_primera_posicion:
		ldx		#puzzle_elegido
		ldb		#0
		lda     	,x+
		rts

eliminar_primera_posicion_siguiente:  
		lda     	,x+
		incb		
		cmpb		#17			; Longitud maxima tablero
		beq		salir
		bra		eliminar_primera_posicion_siguiente

mover_dcha_saltar:
		pshs		b		
		ldb		posicion_espacio
		cmpb		#0
		beq		llamar_mover_dcha_0
		cmpb		#1
		beq		llamar_mover_dcha_1
		cmpb		#2
		beq		llamar_mover_dcha_2
		cmpb		#4
		beq		llamar_mover_dcha_4
		cmpb		#5
		beq		llamar_mover_dcha_5		
		cmpb		#6
		beq		llamar_mover_dcha_6
		cmpb		#8
		beq		llamar_mover_dcha_8
		cmpb		#9
		beq		llamar_mover_dcha_9
		cmpb		#10
		beq		llamar_mover_dcha_10
		cmpb		#12
		beq		llamar_mover_dcha_12
		cmpb		#13
		beq		llamar_mover_dcha_13
		cmpb		#14
		beq		llamar_mover_dcha_14
		jmp		mover_dcha_siguiente
	
llamar_mover_dcha_0:
		jmp		mover_dcha_0
llamar_mover_dcha_1:
		jmp		mover_dcha_1
llamar_mover_dcha_2:
		jmp		mover_dcha_2
llamar_mover_dcha_4:
		jmp		mover_dcha_4
llamar_mover_dcha_5:
		jmp		mover_dcha_5
llamar_mover_dcha_6:
		jmp		mover_dcha_6
llamar_mover_dcha_8:
		jmp		mover_dcha_8
llamar_mover_dcha_9:
		jmp		mover_dcha_9
llamar_mover_dcha_10:
		jmp		mover_dcha_10
llamar_mover_dcha_12:
		jmp		mover_dcha_12
llamar_mover_dcha_13:
		jmp		mover_dcha_13
llamar_mover_dcha_14:
		jmp		mover_dcha_14

mover_dcha_0:
		ldd		puzzle_elegido+1
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+1	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+0	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente
		
mover_dcha_1:
		ldd		puzzle_elegido+2
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+2	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+1	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_2:	
		ldd		puzzle_elegido+3
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+3	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+2	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_4:	
		ldd		puzzle_elegido+5
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+5	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+4	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_5:	
		ldd		puzzle_elegido+6
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+6	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+5	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_6:	
		ldd		puzzle_elegido+7
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+7	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+6	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente


mover_dcha_8:	
		ldd		puzzle_elegido+9
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+9	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+8	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_9:	
		ldd		puzzle_elegido+10
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+10	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+9	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_10:
		ldd		puzzle_elegido+11
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+11	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+10	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente


mover_dcha_12:
		ldd		puzzle_elegido+13
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+13	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+12	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_13:	
		ldd		puzzle_elegido+14
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+14	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+13	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente

mover_dcha_14:	
		ldd		puzzle_elegido+15
		std		temp
		lda		#32			; Carga el espacio
		sta		puzzle_elegido+15	; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+14	; Posicion para el caracter
		puls		b
		jmp		mover_dcha_siguiente
