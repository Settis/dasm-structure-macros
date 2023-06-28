    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #5
    IF_EQ
        SEI
    END_IF
    ADC #5
