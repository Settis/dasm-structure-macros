    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    BEGIN
        ADC #$3
        STA $4f
    AGAIN
