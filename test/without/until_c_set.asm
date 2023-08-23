    processor 6502
    org $200

loop:
    LDA $BEEF
    BCC loop
