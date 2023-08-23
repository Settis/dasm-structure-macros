    processor 6502
    org $200

loop:
    BIT $3e23
    BVS loop
