    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"
    
    ADC #$23
    IF_LT
        STA $54
    ELSE_
        LDA #$57
    END_IF
    RTI
