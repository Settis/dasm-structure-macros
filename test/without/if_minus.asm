    processor 6502
    org $200

    CMP #7
    BPL plus
    BIT $6732
    JMP end
plus:
    STA $4f7e
end:
    RTS
