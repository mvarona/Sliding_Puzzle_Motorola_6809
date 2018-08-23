# SLIDING PUZZLE / PUZZLE DESLIZANTE EN ENSAMBLADOR MOTOROLA 6809
# SLIDING PUZZLE MOTOROLA 6809 ASSEMBLER

======

## Español:

En vista de la escasa documentación que el microprocesador Motorola 6809 y su ensamblador tienen disponible en Internet, y como agradecimiento al usuario [Javserher]Javserher(https://github.com/javserher/), decido publicar un Sliding Puzzle o Puzzle Deslizante realizado bajo este procesador. Sus instrucciones de uso son tan buenas que me permito reproducirlas parcialmente a continuación:

Instalación:

Es necesario para hacerlo funcionar los archivos del emulador para el 6809 disponibles para Linux (6809emu-UbuntuXXXX.tar. En caso de usar una distro distinta a Ubuntu probar las dos versiones) donde se incluye el ensamblador y enlazador:

1. Descomprimir el archivo .tar con "tar xvf 6809emu-UbuntuXXXX.tar" donde XXXX es la version del archivo que estás intentando instalar. Volver a abrir sesión para que se apliquen los cambios.

• Si al ejecutar,ensamblar o enlazar da un problema del tipo "bash: /home/javserher/bin/as6809: No such file or directory" en 64bits, instalar el siguiente paquete "sudo apt-get install libc6-i386".

** Para ensamblar y enlazar o para ejecutar en un paso se deben especificar todos los nombres de ficheros .asm (ensamblado) disponibles en este proyecto, y a la hora de enlazar todos los .rel generados tras ensamblar **

EJECUCION EN UN PASO:

`ensambla <nombre_fichero.asm>`

ENSAMBLADO,ENLAZADO,EJECUCIÓN:

`as6809 -o <nombre_fichero.asm>` --> Genera ficheros .rel

`aslink -s <nombre_fichero.rel>`

Para ejecutar tras ensamblado/enlazado:

`m6809-run <nombre_fichero.s19>`

** IMPORTANTE: **

• Para ejecutar el puzzle basta con entrar a la carpeta contenedora (con la orden `cd ruta/hasta/Sliding_Puzzle`) y escribir en el terminal la siguiente orden (también presente en el archivo `orden.txt`):

`ensambla puzzle cargar_tablero movimiento_izquierda comprobar_movimiento_legal ejecutar_movimiento imprime_cadena imprime_numero_2_cifras mostrar_menu mostrar_tablero cargar_trofeo recoger_movimiento movimiento_abajo recoger_nombre movimiento_arriba movimiento_derecha`

** Bugs documentados: **

 #1: Si se entra en una partida, se realiza algún movimiento en el tablero, se abandona volviendo al menú principal y se comienza otra partida, el programa aborta. Se puede evitar entrando y saliendo de una partida *sin hacer ningún movimiento en el tablero elegido*, introduciendo por ejemplo diferentes nombres de jugadores. Si no se hace ningún movimiento en el tablero, se puede salir de la partida y empezar otra con normalidad. Se desconocen las causas del bug.

* Si lo encuentras útil, recuerda por favor que tu trabajo también puede ser útil en el futuro para otra persona. Gracias. *

***

# Enlish:

Considering the limited documentation that the Motorola 6809 microprocessor and its assembler have available on the Internet, and as acknowledgment to the user [Javserher](https://github.com/javserher/), I decide to publish a Sliding Puzzle made for this processor. His instructions for use are so good that I allow myself to partially reproduce them below:

Installation:

It is necesary to download the emulator archives (assembler,linker and executer) available for Linux (6809emu-UbuntuXXXX.tar. If you use a different Linux distro from Ubuntu, just try both versions of the archives).

1. Decompress the file with the command "tar xvf 6809emu-UbuntuXXXX.tar" where XXXX is the rest of the name of the version you are trying to install. After that, reopen your session to apply the changes.

• If you receive an error in 64bits like "bash: /home/javserher/bin/as6809: No such file or directory" trying to assembly,linking or executing, install the following package with the command "sudo apt-get install libc6-i386".

** When assemblying,linking or 1-step-executing you need to specify all .asm (while assemblying or 1-step-executing) or .rel files generated after assemblying for linking **

** 1-STEP-EXECUTION **

`ensambla <file_name.asm>`

**ASSEMBLYING,LINKING AND EXECUTING**

`as6809 -o <file_name.asm>` --> Generates .rel files

`aslink -s <file_name.rel>`

To execute finally:

`m6809-run <file_name.s19>`

** IMPORTANT: **

• To run the puzzle is enough with access the container folder (with `cd root/to/Sliding_Puzzle_Folder` command), and write on the Terminal the following command (it is also contained on the file `orden.txt`):

`ensambla puzzle cargar_tablero movimiento_izquierda comprobar_movimiento_legal ejecutar_movimiento imprime_cadena imprime_numero_2_cifras mostrar_menu mostrar_tablero cargar_trofeo recoger_movimiento movimiento_abajo recoger_nombre movimiento_arriba movimiento_derecha`

** Reported bugs: **

 #1: If a game is started, the user makes a movement on the board, the game is abandoned returning to the main menu and the user starts a new game, the program crashes. It can be avoided by starting and exiting a game *without making any movement on the chosen board*, typing for example different user names. If no movements are made, the user is able to close the game and start another as usually. Causes of the bug are unknown.

* If you find this useful, please remember that your work can be useful in the future for other person too. Thank you. *