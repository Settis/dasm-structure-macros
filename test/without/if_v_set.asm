    processor 6502
    org $200

    ADC #$93
    BVC clear
    STA $F3
    JMP end
clear:
    STA $D3
end:
    JMP $3000
