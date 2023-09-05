    processor 6502
    org $200

    TAY
LOOP_1:
    NOP
    INY
    CPY #$20
    BNE LOOP_1

LOOP_2:
    NOP
    INY
    BPL LOOP_2

    PHA
    TXA
    TAY
    PLA
LOOP_3:
    NOP
    INY
    BMI LOOP_3

    LDY #$4
LOOP_4:
    NOP
    INY
    BNE LOOP_4

LOOP_5:
    NOP
    INY
    CPY $1234
    BNE LOOP_5

LOOP_6:
    NOP
    DEY
    CPY #$44
    BNE LOOP_6

LOOP_7:
    NOP
    DEY
    BPL LOOP_7

LOOP_8:
    NOP
    DEY
    BMI LOOP_8

LOOP_9:
    NOP
    DEY
    BNE LOOP_9

LOOP_10:
    NOP
    DEY
    CPY $4444
    BNE LOOP_10
