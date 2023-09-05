    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

    FOR_Y ACCUM, UP_TO, $20
        NOP
    NEXT_Y

    FOR_Y Y_REG, UP_TO, NEG_NRs
        NOP
    NEXT_Y

    FOR_Y X_REG, UP_TO, POS_NRs
        NOP
    NEXT_Y

    FOR_Y 4, UP_TO, 0
        NOP
    NEXT_Y

    FOR_Y Y_REG, UP_TO, $1234
        NOP
    NEXT_Y

    FOR_Y Y_REG, DOWN_TO, $44
        NOP
    NEXT_Y

    FOR_Y Y_REG, DOWN_TO, NEG_NRs
        NOP
    NEXT_Y

    FOR_Y Y_REG, DOWN_TO, POS_NRs
        NOP
    NEXT_Y

    FOR_Y Y_REG, DOWN_TO, 0
        NOP
    NEXT_Y

    FOR_Y Y_REG, DOWN_TO, $4444
        NOP
    NEXT_Y
