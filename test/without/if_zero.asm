    processor 6502
    org $200

    CMP #7
    BNE non_zero
    STA $20
    JMP END
non_zero:
    STA $40
END:
    CLC
