    processor 6502
    org $200

    ADC #$23
    BCS ge 
    STA $54
    JMP END
ge:
    LDA #$57
END:
    RTI
