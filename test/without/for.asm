    processor 6502
    org $200

COUNTER = $45

    LDA #$1
    STA COUNTER
    LDA #$0
    STA COUNTER+1
loop:
    LDA $1234
    STA $4321

    INC COUNTER
    BNE check_loop_condition
    INC COUNTER+1

check_loop_condition:
    LDA COUNTER
    CMP #[5001 & $FF]
    BNE loop
    LDA COUNTER+1
    CMP #[(5001 >> 8 ) & $FF]
    BNE loop
