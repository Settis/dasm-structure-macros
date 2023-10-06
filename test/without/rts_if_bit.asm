    PROCESSOR 6502
    ORG $200

MEMORY = $4056

    LDA #%00010000
    BIT MEMORY
    BNE not_4_low
    RTS
not_4_low:

    LDA #%00000100
    BIT MEMORY
    BEQ not_2_high
    RTS
not_2_high:

    BIT MEMORY
    BVC not_6_high
    RTS
not_6_high:

    BIT MEMORY
    BVS not_6_low
    RTS
not_6_low:

    BIT MEMORY
    BPL not_7_high
    RTS
not_7_high:

    BIT MEMORY
    BMI not_7_low
    RTS
not_7_low:
