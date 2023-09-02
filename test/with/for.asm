    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

COUNTER = $45

    FOR COUNTER, 1, TO, 5000
        LDA $1234
        STA $4321
    NEXT
