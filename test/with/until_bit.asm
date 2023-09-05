    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

MEMORY = $4056
BIT_4_LOW = $60f3
BIT_2_HIGH = $60d2
BIT_6_HIGH = $60a3
BIT_6_LOW = $60a5
BIT_7_HIGH = $60aa
BIT_7_LOW = $60ab

    BEGIN
        JSR BIT_4_LOW
    UNTIL_BIT MEMORY, 4, IS_LOW

    BEGIN
        JSR BIT_2_HIGH
    UNTIL_BIT MEMORY, 2, IS_HIGH

    BEGIN
        JSR BIT_6_HIGH
    UNTIL_BIT MEMORY, 6, IS_HIGH

    BEGIN
        JSR BIT_6_LOW
    UNTIL_BIT MEMORY, 6, IS_LOW

    BEGIN
        JSR BIT_7_HIGH
    UNTIL_BIT MEMORY, 7, IS_HIGH

    BEGIN
        JSR BIT_7_LOW
    UNTIL_BIT MEMORY, 7, IS_LOW