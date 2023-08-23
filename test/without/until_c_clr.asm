    processor 6502
    org $200

loop:
    LDA $4867
    BCS loop
