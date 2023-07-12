    processor 6502
    org $200

    ADC #$11
    BIT $4525
    BPL pos
    STA $FF
    JMP end
pos:
    STA $F3
end:
    RTI
