    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #5
    IF_EQ
        CLC
    ELSE_
        SEI
    END_IF
    ADC #5
