    processor 6502
    org $200

    ADC #$8
    BVS set
    STA $76
    JMP end
set:
    STA $23
end:
    RTI
