    processor 6502
    org $200

loop:
    LDA $45
    BEQ loop
