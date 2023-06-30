    processor 6502
    org $200

    ADC #$23
    BMI minus
    STA $54
    JMP end
minus:
    LDA #$57
end:
    RTI
