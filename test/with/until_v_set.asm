    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    BEGIN
        BIT $6543
    UNTIL_V_SET
