    processor 6502
    org $200

    CMP #7
    BCC clear
    STA $4
    JMP END
clear:
    STA $6
END:
    ADC #$50
