    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #5
    IF_EQ
        LDA #0
        IF_EQ
            CLC
        END_IF
        SEI
    END_IF
    ADC #5
