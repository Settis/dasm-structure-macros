    processor 6502
    org $200

loop:
    ADC #$3
    STA $4f
    JMP loop
