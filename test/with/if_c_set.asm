    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #7
    IF_C_SET
        STA $4
    ELSE_
        STA $6
    END_IF
    ADC #$50
