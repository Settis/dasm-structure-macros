    processor 6502
    org $200

    LDX #$1
loop:
    DEX
    BNE end
    STA $30,X
    JMP loop
end:
