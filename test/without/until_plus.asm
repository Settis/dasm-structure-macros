    processor 6502
    org $200

    LDY $B0
loop:
    INY
    BMI loop
