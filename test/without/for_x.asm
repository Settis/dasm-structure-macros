    processor 6502
    org $200

    TAX
LOOP_1:
    NOP
    INX
    CPX #$20
    BNE LOOP_1

LOOP_2:
    NOP
    INX
    BPL LOOP_2

    PHA
    TYA
    TAX
    PLA
LOOP_3:
    NOP
    INX
    BMI LOOP_3

    LDX #$4
LOOP_4:
    NOP
    INX
    BNE LOOP_4

LOOP_5:
    NOP
    INX
    CPX $1234
    BNE LOOP_5

LOOP_6:
    NOP
    DEX
    CPX #$44
    BNE LOOP_6

LOOP_7:
    NOP
    DEX
    BPL LOOP_7

LOOP_8:
    NOP
    DEX
    BMI LOOP_8

LOOP_9:
    NOP
    DEX
    BNE LOOP_9

LOOP_10:
    NOP
    DEX
    CPX $4444
    BNE LOOP_10
