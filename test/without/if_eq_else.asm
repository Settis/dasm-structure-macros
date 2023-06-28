    processor 6502
    org $200

    CMP #5
    BNE not_equal
    CLC
    JMP END
not_equal:
    SEI
END:
    ADC #5
