    processor 6502
    org $200

    BIT $4000
    BMI IS_SET
    RTS
IS_SET:

    BIT $5000
    BPL IS_CLEAR
    RTS
IS_CLEAR:
