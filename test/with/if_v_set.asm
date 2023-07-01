    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    ADC #$93
    IF_V_SET
        STA $F3
    ELSE_
        STA $D3
    END_IF
    JMP $3000
