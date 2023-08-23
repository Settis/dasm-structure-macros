    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    BEGIN
        LDA $4867
    UNTIL_C_CLR
