    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"

FROM   = $10
TO     = $12
SIZE   = $14
SIZEL  = SIZE        ; SIZEL and SIZEH are the low and high bytes of
SIZEH  = SIZE+1      ; variable SIZE above.


        ORG  $8000

;         +-------------------------+
;         |   STRUCTURED VERSION    |
;         +-------------------------+


MOVEDOWN:
   LDY  #0

   LDX  SIZEH              ; Get the high byte of the size of block to move.
   IF_NOT_ZERO             ; Do this 1st part if there's at least one full page to move.
      BEGIN                ; Do this loop once for each full page to move.
         BEGIN             ; Do this loop once for each byte in the page.
            LDA  (FROM),Y
            STA  (TO),Y
            INY
         UNTIL_ZERO        ; UNTIL_ZERO assembles the BNE up to the BEGIN four lines up.
         INC  FROM+1       ; Increment the high byte of the source
         INC  TO+1         ; and destination addresses, and
         DEX               ; decrement the number of full pages left to do.
      UNTIL_ZERO           ; UNTIL_ZERO assembles the BNE up to the corresponding BEGIN.
   END_IF                  ; END_IF puts the branch distance in the BEQ assembled by the
                           ; IF_NOT_ZERO above, whose operand's addr was on the macro stack.

   LDX  SIZEL              ; After all full pages have been moved, see if there's _part_
   IF_NOT_ZERO             ; of one left to do.  If there is, do the following.
      BEGIN                ; Do this loop once for each byte left.
         LDA  (FROM),Y
         STA  (TO),Y       ; After transferring each byte,
         INY               ; increment the index,
         DEX               ; and decrement the number of bytes left to do.
      UNTIL_ZERO           ; UNTIL_ZERO assembles the BNE up to the BEGIN 5 lines up.
   END_IF                  ; END_IF puts the branch distance in the BEQ assembled
                           ; by the IF_NOT_ZERO above, so a branch taken goes to the RTS below.
   RTS
 ;----------------
