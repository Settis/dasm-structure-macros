    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    LDX #$1
    BEGIN
        DEX
    WHILE_EQ
        STA $30,X
    REPEAT_
