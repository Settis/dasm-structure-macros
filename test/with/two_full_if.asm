    processor 6502
    org $200
    LIST OFF
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"
    LIST ON

    CMP #5

    IF_NEQ
        NOP
    ELSE_
        CLC
    END_IF
    IF_NEQ
        NOP
    ELSE_
        CLC
    END_IF

    ADC #5
