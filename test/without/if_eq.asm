    processor 6502
    org $200

    CMP #5
    BNE END
    SEI
END:
    ADC #5
