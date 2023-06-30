    processor 6502
    org $200

    CMP #7
    BEQ zero
    STA $20
    JMP END
zero:
    STA $40
END:
    CLC
