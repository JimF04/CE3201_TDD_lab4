.data
array: 
    .word 1,2,3,4,5,6,7,8,9,10

.global _start
_start:
    LDR     R0, =array
    MOV     R3, #0       // index_array
    MOV     R4, #3       // value_y

loop:
    CMP     R3, #10
    BEQ     end

    LDR     R1, [R0, R3, LSL #2] // cargar dato en R1
    CMP     R1, R4

    BHS     index_greater_same   // si R1 >= R4

    ADD     R1, R1, R4           // si R1 < R4
    B       loop_done    

index_greater_same:
    MUL     R2, R1, R4
    MOV     R1, R2

loop_done:         
    STR     R1, [R0, R3, LSL #2]
    ADD     R3, R3, #1
    B       loop