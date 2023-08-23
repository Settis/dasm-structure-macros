    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    BEGIN
        LDA $45
    UNTIL_NEQ
