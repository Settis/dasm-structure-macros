    processor 6502
    org $200

    LDX #$F0
loop:
    DEX
    BNE loop
