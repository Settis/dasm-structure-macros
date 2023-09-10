    processor 6502
    org $200

    CMP #5
    BEQ zero_1
    NOP
    JMP END_1
zero_1:
    CLC
END_1:
    BEQ zero_2
    NOP
    JMP END_2
zero_2:
    CLC
END_2:
    ADC #5
