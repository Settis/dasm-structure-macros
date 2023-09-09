    processor 6502
    org $200

LINEFEED_SUB = $1234
CARRIAGE_RETURN_SUB = $4321
BACKSPACE_SUB = $3333
PRINT_CHAR_SUB = $2222

    LDA $4567

    CMP #$0A
    BNE linefeed_case
    JSR LINEFEED_SUB
    JMP end_case
linefeed_case:

    CMP #$0D
    BNE carriage_return_case
    JSR CARRIAGE_RETURN_SUB
    JMP end_case
carriage_return_case:

    CMP #$08
    BNE backspace_case
    JSR BACKSPACE_SUB
    JMP end_case
backspace_case:

    JSR PRINT_CHAR_SUB

end_case:
