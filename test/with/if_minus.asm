    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    CMP #7
    IF_MINUS
        BIT $6732
    ELSE_
        STA $4f7e
    END_IF
    RTS
