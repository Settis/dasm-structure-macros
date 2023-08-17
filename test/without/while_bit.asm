    processor 6502
    org $200

    LDX #$0
loop:
    LDA #$B5
    STA $404F
    LDA #%00001000
    BIT $3023
    BNE end
    INX
    JMP loop
end:
