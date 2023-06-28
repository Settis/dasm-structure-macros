    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #7
    IF_ZERO
        STA $20
    ELSE_
        STA $40
    END_IF
    CLC
