.global _start
_start:
    MOV     R0, #5      // Número: X = 4
    MOV     R1, #1      // Resultado = 1
    MOV     R2, #2      // i = 2

factorial_loop:
    CMP     R2, R0
    BGT     end // Terminar si i > X (caso donde X es 0 o 1)

    MUL     R1, R1, R2  // R1 = R1 * i
    ADD     R2, R2, #1  // i++
    B       factorial_loop