    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    LDY $B0
    BEGIN
        INY
    UNTIL_PLUS
