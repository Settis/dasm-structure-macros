    processor 6502
    org $200

    ADC #$11
    BCC less
    STA $FF
    JMP end
less:
    STA $F3
end:
    RTI
