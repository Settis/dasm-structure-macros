    processor 6502
    org $200

MEMORY = $4056
BIT_4_LOW = $60f3
BIT_2_HIGH = $60d2
BIT_6_HIGH = $60a3
BIT_6_LOW = $60a5
BIT_7_HIGH = $60aa
BIT_7_LOW = $60ab

not_4_low:
    JSR BIT_4_LOW
    LDA #%00010000
    BIT MEMORY
    BNE not_4_low

not_2_high:
    JSR BIT_2_HIGH
    LDA #%00000100
    BIT MEMORY
    BEQ not_2_high

not_6_high:
    JSR BIT_6_HIGH
    BIT MEMORY
    BVC not_6_high

not_6_low:
    JSR BIT_6_LOW
    BIT MEMORY
    BVS not_6_low

not_7_high:
    JSR BIT_7_HIGH
    BIT MEMORY
    BPL not_7_high

not_7_low:
    JSR BIT_7_LOW
    BIT MEMORY
    BMI not_7_low
