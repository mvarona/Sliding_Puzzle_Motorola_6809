				.module				movimiento_izquierda
        

pantalla		.equ    0xFF00
teclado			.equ    0XFF02
fin			.equ    0xFF01

				.globl				puzzle_elegido
				.globl				movimiento_izquierda
				.globl				imprime_cadena

			;; Variables:

temp:				.byte				0
posicion_espacio:		.byte				0

        		;; Fin Variables

        		;; Programa

movimiento_izquierda:
				
		ldx		#puzzle_elegido
		jsr		calcular_posicion_espacio

		ldx		#puzzle_elegido				
		jsr		mover_izqda
		
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

mover_izqda:

		pshs   		a, b
		ldb		#0

mover_izqda_siguiente:  

		lda     	,x+
		incb
		cmpb		posicion_espacio
		beq    		mover_izqda_saltar
		cmpb		17				; Longitud maxima tablero
		beq		salir

mover_izqda_volver:

		sta		puzzle_elegido-1,x
		bra     	mover_izqda_siguiente

salir:
		puls		a,b
		rts

mover_izqda_saltar:
		pshs		b				
		ldb		posicion_espacio
		cmpb		#1
		beq		llamar_mover_izqda_1
		cmpb		#2
		beq		llamar_mover_izqda_2
		cmpb		#3
		beq		llamar_mover_izqda_3
		cmpb		#5
		beq		llamar_mover_izqda_5
		cmpb		#6
		beq		llamar_mover_izqda_6
		cmpb		#7
		beq		llamar_mover_izqda_7
		cmpb		#9
		beq		llamar_mover_izqda_9
		cmpb		#10
		beq		llamar_mover_izqda_10
		cmpb		#11
		beq		llamar_mover_izqda_11
		cmpb		#13
		beq		llamar_mover_izqda_13
		cmpb		#14
		beq		llamar_mover_izqda_14
		cmpb		#15
		beq		llamar_mover_izqda_15
		jmp		mover_izqda_siguiente

llamar_mover_izqda_1:
		jmp		mover_izqda_1
llamar_mover_izqda_2:
		jmp		mover_izqda_2
llamar_mover_izqda_3:
		jmp		mover_izqda_3
llamar_mover_izqda_5:
		jmp		mover_izqda_5
llamar_mover_izqda_6:
		jmp		mover_izqda_6
llamar_mover_izqda_7:
		jmp		mover_izqda_7
llamar_mover_izqda_9:
		jmp		mover_izqda_9
llamar_mover_izqda_10:
		jmp		mover_izqda_10
llamar_mover_izqda_11:
		jmp		mover_izqda_11
llamar_mover_izqda_13:
		jmp		mover_izqda_13
llamar_mover_izqda_14:
		jmp		mover_izqda_14
llamar_mover_izqda_15:
		jmp		mover_izqda_15

mover_izqda_1:		
		ldd		puzzle_elegido+0
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+0		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+1		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_2:		
		ldd		puzzle_elegido+1
		std		temp
		lda		#32						; Carga el espacio
		sta		puzzle_elegido+1		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+2		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_3:		
		ldd		puzzle_elegido+2
		std		temp
		lda		#32						; Carga el espacio
		sta		puzzle_elegido+2		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+3		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente



mover_izqda_5:		
		ldd		puzzle_elegido+4
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+4		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+5		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_6:		
		ldd		puzzle_elegido+5
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+5		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+6		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_7:
		ldd		puzzle_elegido+6
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+6		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+7		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente


mover_izqda_9:		
		ldd		puzzle_elegido+8
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+8		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+9		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_10:
		ldd		puzzle_elegido+9
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+9		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+10		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_11:		
		ldd		puzzle_elegido+10
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+10		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+11		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente


mover_izqda_13:
		ldd		puzzle_elegido+12
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+12		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+13		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_14:		
		ldd		puzzle_elegido+13
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+13		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+14		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente

mover_izqda_15:
		ldd		puzzle_elegido+14
		std		temp
		lda		#32				; Carga el espacio
		sta		puzzle_elegido+14		; Posicion para el espacio
		ldb		temp
		stb		puzzle_elegido+15		; Posicion para el caracter
		puls		b
		jmp		mover_izqda_siguiente
