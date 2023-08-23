    processor 6502
    org $200

    LDA #$50
loop:
    SEC
    SBC #$1
    BPL loop
