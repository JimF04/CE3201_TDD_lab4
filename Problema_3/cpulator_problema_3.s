.global _start
_start:

    //Direcciones de memoria
	LDR     R0, =0x1000     // dirección del teclado (input)
	MOV     R2, #0
	STR     R2, [R0]        // inicializar a 0

	LDR     R1, =0x2000     // dirección del contador (posición en pantalla)
	STR     R2, [R1]        // inicializar a 0

loop:        
	// Leer valor actual del contador
	LDR     R2, [R0]
	// Leer valor actual del contador
	LDR     R3, [R1]

	// Comparar con flecha arriba (0xE048)
	LDR     R4, =0xE048
	CMP     R2, R4
	BEQ     key_up

	// Comparar con flecha abajo (0xE050)
	LDR     R4, =0xE050
	CMP     R2, R4
	BEQ     key_down

	// Si no es válida, repetir
	B       loop

key_up:      
	ADD     R3, R3, #1
	STR     R3, [R1]
	B       loop

key_down:   
	SUB     R3, R3, #1
	STR     R3, [R1]
	B       loop

