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
IS_HIGH  = 3
IS_LOW   = 4

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
_STRUC_MAC_I SET _STRUC_MAC_I + 1
.tmp set _STRUCT_MAC_LABEL_,_STRUC_MAC_I
    JMP .tmp
_STRUCT_MAC_LABEL_,_STK_LVL_1
_STK_LVL_1 SET _STRUC_MAC_I
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
