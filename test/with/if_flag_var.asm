    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

FLAG_LINK = $4000

    IF_FLAG_VAR FLAG_LINK, IS_SET
        LDA #$2
    END_IF

    IF_FLAG_VAR FLAG_LINK, IS_CLEAR
        LDA #$5
    END_IF

    STA $54
