    processor 6502
    org $200

    CMP #7

    BIT $23FF
    BMI plus
    STA $20
    JMP end
plus:
    STA $40
end:

    CLC
