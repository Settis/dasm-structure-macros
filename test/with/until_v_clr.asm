    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    BEGIN
        BIT $3e23
    UNTIL_V_CLR
