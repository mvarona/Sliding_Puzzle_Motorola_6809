		.module			mostrar_menu
			
pantalla	.equ    0xFF00
teclado		.equ    0XFF02
fin		.equ    0xFF01

		.globl	imprime_menu
		.globl	imprime_cadena
		.globl	nombre
		.globl	recoger_nombre

menu:
			.ascii		"\nBIENVENIDO A NUESTRO SLIDING PUZZLE!\n"
			.ascii		"Elige una opcion para comenzar:\n"
			.ascii		"1) Jugar\n"
			.ascii		"2) Instrucciones\n"
			.ascii 		"3) Salir\n\n"
        		.asciz  	"Opcion elegida: "

espaciado:		.asciz		"\n\n==============================\n\n"

opcion_no_correcta_txt:	.asciz		"\nLa opcion introducida no es correcta.\n"

instrucciones:
			.ascii		"\n\nINSTRUCCIONES:\n\n"
			.ascii		"El juego consta de un tablero de 15 numeros y 1 hueco.\n\n"
			.ascii 		"Inicialmente, el jugador elige uno de los tableros que quiere cargar "
			.ascii		"introduciendo su numero por teclado.\n\n"
			.ascii		"Posteriormente, puede ir moviendo el hueco con las teclas A (izquierda), D (derecha), "
			.ascii 		"W (arriba) y S (abajo)."
			.ascii		"\n\nEl jugador gana cuando todas las piezas estan colocadas de menor a mayor "
			.ascii		"de izquierda a derecha y de arriba a abajo,\nquedando el hueco en la "
			.ascii		"posicion de ultimas fila y columna.\n\n"
			.ascii		"Cada pieza colocada en el orden correcto se ira contabilizando como acierto, "
			.ascii		"por ello, si varia su posicion pueden\ndisminuir los aciertos. "
			.ascii		"Tambien aparecen el numero de movimientos realizados hasta el momento.\n\n"
			.ascii		"Si no se ve con suficientes fuerzas, "
			.ascii		"el jugador puede abandonar en cualquier momento introduciendo una X en vez de\nlos movimientos anteriores.\n\n"
			.asciz		"Que lo disfrutes!!\n\n(Presiona una tecla para continuar)\n"

empezar_juego:		.asciz		"\n\nA jugar!\n"

adios_menu:		.asciz		"\n\nHasta luego!\n"



imprime_menu:
        		pshs    	a
buclemenu:
			ldx		#espaciado
			jsr		imprime_cadena
			ldx		#menu
			jsr		imprime_cadena
			ldb 		teclado
			cmpb		#'1
			blo		opcion_no_correcta
			cmpb 		#'3
			bhi		opcion_no_correcta
			cmpb    	#'3
			beq		opcion_salir
			cmpb		#'1
			beq		jugar
			cmpb		#'2
			beq		mostrar_instrucciones
			
opcion_salir:
			ldx		#adios_menu
			jsr		imprime_cadena
			clra
 	        	sta		fin

opcion_no_correcta:				
			ldx		#opcion_no_correcta_txt
			jsr		imprime_cadena
			bra		buclemenu

mostrar_instrucciones:
			ldx		#instrucciones
			jsr		imprime_cadena
			lda		teclado
			bra		buclemenu
jugar:
			ldx		#empezar_juego
			jsr		imprime_cadena
			puls		a

			rts
