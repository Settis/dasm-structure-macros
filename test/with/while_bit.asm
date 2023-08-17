    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    LDX #$0
    BEGIN
        LDA #$B5
        STA $404F
    WHILE_BIT $3023, 3, IS_LOW
        INX
    REPEAT_
