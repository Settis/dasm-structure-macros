    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    LDA #$50
    BEGIN
        SEC
        SBC #$1
    UNTIL_MINUS
