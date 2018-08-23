; ************* IMPRIME_NUMERO_2_CIFRAS *************
; 
; IMPRIME UN NUMERO DE DOS CIFRAS ALMACENADO EN 'A'
; LO GUARDA EN NUM_1CIFRA Y NUM_2CIFRA.
;
; Entrada:
;
; 	numero_a_presentar:		.byte		0
; 	num_1cifra:			.byte		#'0
; 	num_2cifra:			.byte		#'0
; 	num_1cifra_aux:			.byte		#0
; 	num_2cifra_aux:			.byte		#0
;
; Salida: (Pantalla)
; Registros modificados: A,B,CC
;
; **************************************************

		.module			imprime_numero_2_cifras
			
pantalla   	.equ   	 		0xFF00
teclado    	.equ    		0XFF02
fin        	.equ    		0xFF01

	
        	.globl 			imprime_numero_2_cifras
		.globl			numero_a_presentar
		.globl			num_1cifra
		.globl			num_2cifra
		.globl			num_1cifra_aux
		.globl			num_2cifra_aux

        	;; Variables:

num_1cifra:				.byte		#'0
num_2cifra:				.byte		#'0
num_1cifra_aux:				.byte		#0
num_2cifra_aux:				.byte		#0

        	;; Fin Variables

        	;; Programa
imprime_numero_2_cifras:
		
		lda			numero_a_presentar
		ldb			#'0
		cmpa			#10
		bgt			restar10
		cmpa			#10
		beq			es10
		cmpa			#10
		blt			menor10
		bra			continuar
menor10:
		ldb			#'0
		lda			#0
comparar_unidad:
		cmpa			numero_a_presentar
		bne			sumar_unidad
		stb			num_1cifra
		stb			pantalla		
		rts
sumar_unidad:
		inca
		incb
		bra			comparar_unidad
es10:
		ldb			#'1
		stb			num_1cifra
		stb			pantalla
		bra			continuar
restar10:
		suba			#10
		incb
		cmpa			#10
		bgt			restar10
		cmpa			#10
		beq			restar10
		stb			num_1cifra
		stb			pantalla
continuar:
		ldb			num_1cifra
		cmpb			#'0
		beq			cargar_0_1cifra_aux
		cmpb			#'1
		beq			cargar_10_1cifra_aux
		cmpb			#'2
		beq			cargar_20_1cifra_aux
		cmpb			#'3
		beq			cargar_30_1cifra_aux
		cmpb			#'4
		beq			cargar_40_1cifra_aux
		cmpb			#'5
		beq			cargar_50_1cifra_aux
		cmpb			#'6
		beq			cargar_60_1cifra_aux
		cmpb			#'7
		beq			cargar_70_1cifra_aux
		cmpb			#'8
		beq			cargar_80_1cifra_aux
		cmpb			#'9
		beq			cargar_90_1cifra_aux

cargar_0_1cifra_aux:
		lda			#0
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_10_1cifra_aux:
		lda			#10
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_20_1cifra_aux:
		lda			#20
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_30_1cifra_aux:
		lda			#30
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_40_1cifra_aux:
		lda			#40
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_50_1cifra_aux:
		lda			#50
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_60_1cifra_aux:
		lda			#60
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_70_1cifra_aux:
		lda			#70
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_80_1cifra_aux:
		lda			#80
		sta			num_1cifra_aux
		bra			restar_decenas
cargar_90_1cifra_aux:
		lda			#90
		sta			num_1cifra_aux
		bra			restar_decenas

restar_decenas:
		lda			numero_a_presentar
		suba			num_1cifra_aux
		sta			num_2cifra_aux
imprimir_2cifra:
		ldb			num_2cifra_aux
		cmpb			#0
		beq			cargar_0_2cifra_aux
		cmpb			#1
		beq			cargar_1_2cifra_aux
		cmpb			#2
		beq			cargar_2_2cifra_aux
		cmpb			#3
		beq			cargar_3_2cifra_aux
		cmpb			#4
		beq			cargar_4_2cifra_aux
		cmpb			#5
		beq			cargar_5_2cifra_aux
		cmpb			#6
		beq			cargar_6_2cifra_aux
		cmpb			#7
		beq			cargar_7_2cifra_aux
		cmpb			#8
		beq			cargar_8_2cifra_aux
		cmpb			#9
		beq			cargar_9_2cifra_aux
cargar_0_2cifra_aux:
		lda			#'0
		sta			num_2cifra
		sta			pantalla
		rts
cargar_1_2cifra_aux:
		lda			#'1
		sta			num_2cifra
		sta			pantalla
		rts
cargar_2_2cifra_aux:
		lda			#'2
		sta			num_2cifra
		sta			pantalla
		rts
cargar_3_2cifra_aux:
		lda			#'3
		sta			num_2cifra
		sta			pantalla
		rts
cargar_4_2cifra_aux:
		lda			#'4
		sta			num_2cifra
		sta			pantalla
		rts
cargar_5_2cifra_aux:
		lda			#'5
		sta			num_2cifra
		sta			pantalla
		rts
cargar_6_2cifra_aux:
		lda			#'6
		sta			num_2cifra
		sta			pantalla
		rts
cargar_7_2cifra_aux:
		lda			#'7
		sta			num_2cifra
		sta			pantalla
		rts
cargar_8_2cifra_aux:
		lda			#'8
		sta			num_2cifra
		sta			pantalla
		rts
cargar_9_2cifra_aux:
		lda			#'9
		sta			num_2cifra
		sta			pantalla
		rts
