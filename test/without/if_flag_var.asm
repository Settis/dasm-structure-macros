    processor 6502
    org $200

FLAG_LINK = $4000
    BIT FLAG_LINK
    BPL minus
    LDA #$2
minus:

    BIT FLAG_LINK
    BMI plus
    LDA #$5
plus:

    STA $54
