    processor 6502
    org $200

loop:
    BIT $6543
    BVC loop
