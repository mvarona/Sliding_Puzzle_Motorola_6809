; ************* IMPRIME_CADENA *************
; 
; IMPRIME UNA CADENA CUYA DIRECCION ESTA GUARDADA EN X.
; LO PRESENTA POR PANTALLA.
; 
; Entrada: LDX	#CADENA
; Salida: (Pantalla)
; Registros afectados: A, CC
;
; **************************************************

		.module			imprime_cadena
			
pantalla   	.equ    0xFF00
teclado    	.equ    0XFF02
fin        	.equ    0xFF01

		.globl	imprime_cadena

imprime_cadena:
        	pshs   	a
siguiente:  
		lda     ,x+
		beq    	ret_imprime_cadena
      		sta	pantalla
        	bra    	siguiente
ret_imprime_cadena:
		puls    a
	   	rts
