    processor 6502

FROM   = $10
TO     = $12
SIZE   = $14
SIZEL  = SIZE        ; SIZEL and SIZEH are the low and high bytes of
SIZEH  = SIZE+1      ; variable SIZE above.


        ORG  $8000

;         +-----------------------+
;         |   ORIGINAL VERSION    |
;         +-----------------------+


MOVEDOWN: LDY  #0
          LDX  SIZEH
          BEQ  MD2
MD1:      LDA  (FROM),Y    ; Move a page at a time.
          STA  (TO),Y
          INY
          BNE  MD1
          INC  FROM+1
          INC  TO+1
          DEX
          BNE  MD1
MD2:      LDX  SIZEL
          BEQ  MD4
MD3:      LDA  (FROM),Y    ; Move the remaining bytes
          STA  (TO),Y
          INY
          DEX
          BNE  MD3
MD4:      RTS
 ;----------------
