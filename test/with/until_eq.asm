    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    LDX #$F0
    BEGIN
        DEX
    UNTIL_EQ
