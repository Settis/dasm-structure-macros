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

   LDX  SIZEH                   ; Get the high byte of the size of block to move.
   IF_NOT_ZERO                  ; Do this 1st part if there's at least one full page to move.
      FOR_X   X_REG, DOWN_TO, 0 ; Do this loop once for each full page to move.  Start w/ current X contents.
         FOR_Y  Y_REG, UP_TO, 0 ; Do this loop once for each byte in the page.   Start w/ current Y contents.
            LDA  (FROM),Y
            STA  (TO),Y
         NEXT_Y                 ; NEXT_Y assembles the BNE up to the LDA (FROM),Y two lines up.
         INC  FROM+1            ; Increment the high byte of the source and
         INC  TO+1              ; destination addresses.  In next line, decr the number of full pages left to do.
      NEXT_X                    ; NEXT_X does the DEX, and assembles a BNE up to the first line after FOR_X above.
   END_IF                       ; END_IF puts the branch distance in the BEQ assembled by the
                                ; IF_NOT_ZERO above, whose operand's addr was on the macro stack.

   LDX  SIZEL                   ; After all full pages have been moved, see if there's _part_
   IF_NOT_ZERO                  ; of one left to do.  If there is, do the following.
      FOR_X   X_REG, DOWN_TO, 0 ; Do this loop once for each byte left.
         LDA  (FROM),Y
         STA  (TO),Y            ; After transferring each byte,
         INY                    ; increment the index.  In next line, decr the number of bytes left to do.
      NEXT_X                    ; NEXT_Y does the DEX, then assembles the BNE up to the first line after FOR_X above.
   END_IF                       ; END_IF puts the branch distance in the BEQ assembled
                                ; by the IF_NOT_ZERO above, so a branch taken goes to the RTS below.
   RTS
 ;----------------
