    LIST OFF
_STK_LVL_1 SET 0
_STK_LVL_2 SET 0
_STK_LVL_3 SET 0
_STK_LVL_4 SET 0
_STK_LVL_5 SET 0
_STK_LVL_6 SET 0
_STK_LVL_7 SET 0
_STK_LVL_8 SET 0
_STK_LVL_9 SET 0
_STK_LVL_10 SET 0
_STK_LVL_11 SET 0
_STK_LVL_12 SET 0
_STK_LVL_13 SET 0
_STK_LVL_14 SET 0
_STK_LVL_15 SET 0
_STK_LVL_16 SET 0
_STK_LVL_17 SET 0
_STK_LVL_18 SET 0
_STK_LVL_19 SET 0
_STK_LVL_20 SET 0
    LIST ON

_STRUC_MAC_I SET 1

; Arguments
IS_SET   = 1
IS_CLEAR = 2
IS_HIGH  = 1
IS_LOW   = 2
UP_TO    = 5
DOWN_TO  = 6

NEG_NRs  = $101
POS_NRs  = $102
ACCUM    = $104
X_REG    = $105
Y_REG    = $103

;                         +--------------------------+
;                         |  IF_xx...ELSE_...END_IF  |
;                         +==========================+
    MACRO IF_EQ
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BNE .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO ELSE_
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    JMP .tmp
_STRUCT_MAC_LABEL_,_STK_LVL_1
_STK_LVL_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    ENDM
 ;----------------

    MACRO END_IF
_STRUCT_MAC_LABEL_,_STK_LVL_1
    INCLUDE "STACKPOP.ASM"
    ENDM
 ;----------------

    MACRO IF_ZERO
    IF_EQ
    ENDM
 ;----------------

    MACRO IF_NEQ
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BEQ .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_NOT_ZERO
    IF_NEQ
    ENDM
 ;----------------

    MACRO IF_PLUS
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BMI .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_MINUS
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BPL .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_NEG
    IF_MINUS
    ENDM
 ;----------------

    MACRO IF_C_SET
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BCC .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_C_CLR
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BCS .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_GE
    IF_C_SET
    ENDM
 ;----------------

    MACRO IF_LT
    IF_C_CLR
    ENDM
 ;----------------

    MACRO IF_V_SET
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BVC .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_V_CLR
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BVS .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_FLAG_VAR
    IF ![ {2} == IS_SET || {2} == IS_CLEAR ]
        ECHO "Condition must be: IS_SET or IS_CLEAR"
        ERR
    ENDIF
    BIT {1}
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    IF {2} == IS_SET
        BPL .tmp
    ELSE
        BMI .tmp
    ENDIF
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_BIT
    IF [ {2} < 0 || {2} > 7 ]
        ECHO "BIT_NR must be from 0 to 7"
        ERR
    ENDIF
    IF ![ {3} == IS_HIGH || {3} == IS_LOW ]
        ECHO "Condition must be: IS_HIGH or IS_LOW"
        ERR
    ENDIF
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    IF [ {2} < 6 ]
        LDA #[1 << {2}]
        BIT {1}
        IF [ {3} == IS_HIGH ]
            BEQ .tmp
        ELSE
            BNE .tmp
        ENDIF
    ELSE
        BIT {1}
        IF [ {2} == 7 ]
            IF [ {3} == IS_HIGH ]
                BPL .tmp
            ELSE
                BMI .tmp
            ENDIF
        ELSE
            IF [ {3} == IS_HIGH ]
                BVC .tmp
            ELSE
                BVS .tmp
            ENDIF
        ENDIF
    ENDIF
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO IF_MEM_BYTE_NEG
    BIT {1}
    IF_MINUS
    ENDM
 ;----------------

    MACRO IF_MEM_BYTE_POS
    BIT {1}
    IF_PLUS
    ENDM
 ;----------------


;                        +--------------------------+
;                        |      BEGIN...AGAIN       |
;                        |      BEGIN...UNTIL       |
;                        |  BEGIN...WHILE...REPEAT  |
;                        +==========================+

    MACRO BEGIN
_STRUCT_MAC_LABEL_,_STRUC_MAC_I
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO AGAIN
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    JMP .tmp
    INCLUDE "STACKPOP.ASM"
    ENDM
 ;----------------

    MACRO WHILE_EQ
    IF_EQ
    ENDM
 ;----------------

    MACRO REPEAT_
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_2
    JMP .tmp
_STRUCT_MAC_LABEL_,_STK_LVL_1
    INCLUDE "STACKPOP2.ASM"
    ENDM
 ;----------------

    MACRO WHILE_NEQ
    IF_NEQ
    ENDM
 ;----------------

    MACRO WHILE_ZERO
    IF_EQ
    ENDM
 ;----------------

    MACRO WHILE_NOT_ZERO
    IF_NEQ
    ENDM
 ;----------------

    MACRO WHILE_PLUS
    IF_PLUS
    ENDM
 ;----------------

    MACRO WHILE_MINUS
    IF_MINUS
    ENDM
 ;----------------

    MACRO WHILE_NEG
    IF_MINUS
    ENDM
 ;----------------

    MACRO WHILE_C_CLR
    IF_C_CLR
    ENDM
 ;----------------

    MACRO WHILE_C_SET
    IF_C_SET
    ENDM
 ;----------------

    MACRO WHILE_GE
    IF_C_SET
    ENDM
 ;----------------

    MACRO WHILE_LT
    IF_C_CLR
    ENDM
 ;----------------

    MACRO WHILE_V_CLR
    IF_V_CLR
    ENDM
 ;----------------

    MACRO WHILE_V_SET
    IF_V_SET
    ENDM
 ;----------------

    MACRO WHILE_BIT
    IF_BIT {1}, {2}, {3}
    ENDM
 ;----------------

    MACRO UNTIL_EQ
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BNE .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_ZERO
    UNTIL_EQ
    ENDM
 ;----------------

    MACRO UNTIL_NEQ
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BEQ .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_NOT_ZERO
    UNTIL_NEQ
    ENDM
 ;----------------

    MACRO UNTIL_PLUS
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BMI .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_MINUS
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BPL .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_NEG
    UNTIL_MINUS
    ENDM
 ;----------------

    MACRO UNTIL_C_CLR
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BCS .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_C_SET
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BCC .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_GE
    UNTIL_C_SET
    ENDM
 ;----------------

    MACRO UNTIL_LT
    UNTIL_C_CLR
    ENDM
 ;----------------

    MACRO UNTIL_V_CLR
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BVS .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_V_SET
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    BVC .tmp
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

    MACRO UNTIL_BIT
    IF [ {2} < 0 || {2} > 7 ]
        ECHO "BIT_NR must be from 0 to 7"
        ERR
    ENDIF
    IF ![ {3} == IS_HIGH || {3} == IS_LOW ]
        ECHO "Condition must be: IS_HIGH or IS_LOW"
        ERR
    ENDIF
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    IF [ {2} < 6 ]
        LDA #[1 << {2}]
        BIT {1}
        IF [ {3} == IS_HIGH ]
            BEQ .tmp
        ELSE
            BNE .tmp
        ENDIF
    ELSE
        BIT {1}
        IF [ {2} == 7 ]
            IF [ {3} == IS_HIGH ]
                BPL .tmp
            ELSE
                BMI .tmp
            ENDIF
        ELSE
            IF [ {3} == IS_HIGH ]
                BVC .tmp
            ELSE
                BVS .tmp
            ENDIF
        ENDIF
    ENDIF
    INCLUDE "STACKPOP.ASM"    
    ENDM
 ;----------------

;                        +--------------------+
;                        |   CASE statement   |
;                        +====================+

    MACRO CASE
    IF ![ {1} == ACCUM || {1} == X_REG || {1} == Y_REG ]
        ECHO "Register must be one of: ACCUM, X_REG or Y_REG"
        ERR
    ENDIF
_TO_PUSH_1 SET {1}
_TO_PUSH_2 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STKPUSH2.ASM"
    ENDM
 ;----------------

    MACRO CASE_OF
    IF [ _STK_LVL_1 == ACCUM ]
        CMP #{1}
    ENDIF
    IF [ _STK_LVL_1 == X_REG ]
        CPX #{1}
    ENDIF
    IF [ _STK_LVL_1 == Y_REG ]
        CPY #{1}
    ENDIF
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    BNE .tmp
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STACKPUSH.ASM"
    ENDM
 ;----------------

    MACRO END_OF
.case_end set _STRUCT_MAC_LABEL_,_STK_LVL_3
    JMP .case_end
_STRUCT_MAC_LABEL_,_STK_LVL_1
    INCLUDE "STACKPOP.ASM"
    ENDM
 ;----------------

    MACRO END_CASE
_STRUCT_MAC_LABEL_,_STK_LVL_2
    INCLUDE "STACKPOP2.ASM"
    ENDM
 ;----------------

;                       +--------------------+
;                       |     FOR...NEXT     |
;                       +====================+

    MACRO FOR
    LDA #[ {2} & $FF ]
    STA {1}
    LDA #[ ({2} >> 8) & $FF ]
    STA {1}+1
_TO_PUSH_3 SET {1}
_TO_PUSH_2 SET {4}
_STRUCT_MAC_LABEL_,_STRUC_MAC_I
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STKPUSH3.ASM"
    ENDM
 ;----------------

    MACRO NEXT
    INC _STK_LVL_3
    BNE .check_condition
    INC _STK_LVL_3+1
.check_condition:
.tmp set _STRUCT_MAC_LABEL_,_STK_LVL_1
    LDA _STK_LVL_3
    CMP #[ (_STK_LVL_2+1) & $FF ]
    BNE .tmp
    LDA _STK_LVL_3+1
    CMP #[ ((_STK_LVL_2+1) >> 8) & $FF ]
    BNE .tmp
    INCLUDE "STACKPOP3.ASM"
    ENDM
 ;----------------

;                        +--------------------+
;                        |   FOR_X...NEXT_X   |
;                        +====================+

    MACRO FOR_X
    IF [ !({1} == ACCUM || {1} == X_REG || {1} == Y_REG || {1} < $100) ]
        ECHO "Index must be one of: ACCUM, X_REG, Y_REG of value below $100"
        ERR
    ENDIF
    IF [ !({2} == UP_TO || {2} == DOWN_TO) ]
        ECHO "Direction must be UP_TO or DOWN_TO"
        ERR
    ENDIF
    IF [ {1} == ACCUM ]
        TAX
    ELSE
        IF [ {1} == Y_REG ]
            PHA
            TYA
            TAX
            PLA
        ELSE
            IF [ {1} != X_REG ]
                LDX #{1}
            ENDIF
        ENDIF
    ENDIF
_TO_PUSH_3 SET {3}
_TO_PUSH_2 SET {2}
_STRUCT_MAC_LABEL_,_STRUC_MAC_I
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STKPUSH3.ASM"
    ENDM
 ;----------------

    MACRO NEXT_X
.loop set _STRUCT_MAC_LABEL_,_STK_LVL_1
    IF [ _STK_LVL_2 == DOWN_TO ]
        DEX
        IF [ _STK_LVL_3 == 0 ]
            BNE .loop
        ELSE
            IF [ _STK_LVL_3 == $FF || _STK_LVL_3 == -1 || _STK_LVL_3 == NEG_NRs ]
                BPL .loop
            ELSE
                IF [ _STK_LVL_3 == POS_NRs ]
                    BMI .loop
                ELSE
                    IF [ _STK_LVL_3 > $102 ]
                        CPX _STK_LVL_3
                    ELSE
                        CPX #_STK_LVL_3
                    ENDIF
                    BNE .loop
                ENDIF
            ENDIF
        ENDIF 
    ELSE ; UP_TO
        INX
        IF [ _STK_LVL_3 == 0 ]
            BNE .loop
        ELSE
            IF [ _STK_LVL_3 == POS_NRs ]
                BMI .loop
            ELSE
                IF [ _STK_LVL_3 == NEG_NRs ]
                    BPL .loop
                ELSE
                    IF [ _STK_LVL_3 > $102 ]
                        CPX _STK_LVL_3
                    ELSE
                        CPX #_STK_LVL_3
                    ENDIF
                    BNE .loop
                ENDIF
            ENDIF
        ENDIF
    ENDIF
    INCLUDE "STACKPOP3.ASM"
    ENDM
 ;----------------

;                        +--------------------+
;                        |   FOR_Y...NEXT_Y   |
;                        +====================+

    MACRO FOR_Y
    IF [ !({1} == ACCUM || {1} == X_REG || {1} == Y_REG || {1} < $100) ]
        ECHO "Index must be one of: ACCUM, X_REG, Y_REG of value below $100"
        ERR
    ENDIF
    IF [ !({2} == UP_TO || {2} == DOWN_TO) ]
        ECHO "Direction must be UP_TO or DOWN_TO"
        ERR
    ENDIF
    IF [ {1} == ACCUM ]
        TAY
    ELSE
        IF [ {1} == X_REG ]
            PHA
            TXA
            TAY
            PLA
        ELSE
            IF [ {1} != Y_REG ]
                LDY #{1}
            ENDIF
        ENDIF
    ENDIF
_TO_PUSH_3 SET {3}
_TO_PUSH_2 SET {2}
_STRUCT_MAC_LABEL_,_STRUC_MAC_I
_TO_PUSH_1 SET _STRUC_MAC_I
_STRUC_MAC_I SET _STRUC_MAC_I + 1
    INCLUDE "STKPUSH3.ASM"
    ENDM
 ;----------------

    MACRO NEXT_Y
.loop set _STRUCT_MAC_LABEL_,_STK_LVL_1
    IF [ _STK_LVL_2 == DOWN_TO ]
        DEY
        IF [ _STK_LVL_3 == 0 ]
            BNE .loop
        ELSE
            IF [ _STK_LVL_3 == $FF || _STK_LVL_3 == -1 || _STK_LVL_3 == NEG_NRs ]
                BPL .loop
            ELSE
                IF [ _STK_LVL_3 == POS_NRs ]
                    BMI .loop
                ELSE
                    IF [ _STK_LVL_3 > $102 ]
                        CPY _STK_LVL_3
                    ELSE
                        CPY #_STK_LVL_3
                    ENDIF
                    BNE .loop
                ENDIF
            ENDIF
        ENDIF 
    ELSE ; UP_TO
        INY
        IF [ _STK_LVL_3 == 0 ]
            BNE .loop
        ELSE
            IF [ _STK_LVL_3 == POS_NRs ]
                BMI .loop
            ELSE
                IF [ _STK_LVL_3 == NEG_NRs ]
                    BPL .loop
                ELSE
                    IF [ _STK_LVL_3 > $102 ]
                        CPY _STK_LVL_3
                    ELSE
                        CPY #_STK_LVL_3
                    ENDIF
                    BNE .loop
                ENDIF
            ENDIF
        ENDIF
    ENDIF
    INCLUDE "STACKPOP3.ASM"
    ENDM
 ;----------------

 ;                       +--------------------+
 ;                       |     Accessories    |
 ;                       +====================+

    MACRO RTS_IF_EQ
    BNE .tmp
    RTS
.tmp
    ENDM
 ;----------------

    MACRO RTS_IF_NE
    BEQ .tmp
    RTS
.tmp
    ENDM
 ;----------------

    MACRO RTS_IF_PLUS
    BMI .tmp
    RTS
.tmp
    ENDM
 ;----------------

    MACRO RTS_IF_MINUS
    BPL .tmp
    RTS
.tmp
    ENDM
 ;----------------

    MACRO RTS_IF_FLAG_VAR
    IF ![ {2} == IS_SET || {2} == IS_CLEAR ]
        ECHO "Condition must be: IS_SET or IS_CLEAR"
        ERR
    ENDIF
    BIT {1}
    IF [ {2} == IS_SET ]
        BPL .tmp
    ELSE
        BMI .tmp
    ENDIF
    RTS
.tmp
    ENDM
 ;----------------
