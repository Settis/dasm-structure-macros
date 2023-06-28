    processor 6502
    org $200

    CMP #5
    BNE END
    LDA #0
    BNE LABEL
    CLC
LABEL:
    SEI
END:
    ADC #5
