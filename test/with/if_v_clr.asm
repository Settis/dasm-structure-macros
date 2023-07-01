    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"
    
    ADC #$8
    IF_V_CLR
        STA $76
    ELSE_
        STA $23
    END_IF
    RTI
