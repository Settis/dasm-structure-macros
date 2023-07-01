    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #5
    IF_NEG
        SEI
    END_IF
    ADC #5
