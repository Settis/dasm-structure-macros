    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"
    
    ADC #$11

    IF_MEM_BYTE_NEG $4525
        STA $FF
    ELSE_
        STA $F3
    END_IF

    RTI
