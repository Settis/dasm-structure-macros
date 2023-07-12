    processor 6502
    org $200

MEMORY = $4056
BIT_4_LOW = $60f3
BIT_2_HIGH = $60d2
BIT_6_HIGH = $60a3
BIT_6_LOW = $60a5
BIT_7_HIGH = $60aa
BIT_7_LOW = $60ab

    LDA #%00010000
    BIT MEMORY
    BNE not_4_low
    JMP BIT_4_LOW
not_4_low:

    LDA #%00000100
    BIT MEMORY
    BEQ not_2_high
    JMP BIT_2_HIGH
not_2_high:

    BIT MEMORY
    BVC not_6_high
    JMP BIT_6_HIGH
not_6_high:

    BIT MEMORY
    BVS not_6_low
    JMP BIT_6_LOW
not_6_low:

    BIT MEMORY
    BPL not_7_high
    JMP BIT_7_HIGH
not_7_high:

    BIT MEMORY
    BMI not_7_low
    JMP BIT_7_LOW
not_7_low:
