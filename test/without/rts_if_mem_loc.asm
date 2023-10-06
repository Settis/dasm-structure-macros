    processor 6502
    org $200

MEMORY = $5432

    BIT MEMORY
    BMI not_pos
    RTS
not_pos:

    BIT MEMORY
    BPL not_neg
    RTS
not_neg:

    LDY MEMORY
    BNE is_non_0
    RTS
is_non_0:

    LDY MEMORY
    BEQ is_0
    RTS
is_0:
