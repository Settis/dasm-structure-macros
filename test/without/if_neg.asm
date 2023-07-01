    processor 6502
    org $200

    CMP #5
    BPL END
    SEI
END:
    ADC #5
