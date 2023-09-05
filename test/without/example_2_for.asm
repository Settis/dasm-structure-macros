    processor 6502

HTD_IN  = $10   ; Input and output variables.  DFS is DeFine Storage.
HTD_OUT = $11   ; Output is low-byte-first.

    ORG $200

TABLE:  WORD 1, 2, 4, 8, $16, $32, $64, $128  ; Define Word, Low byte first.

;         +-----------------------+
;         |   ORIGINAL VERSION    |
;         +-----------------------+


HTD:    SED              ; Output gets added up in decimal.
        LDA #$0
        STA  HTD_OUT     ; Initialize output word as 0.
        STA  HTD_OUT+1   ; (NMOS 6502 will need LDA#0, STA ...)

        LDX  #$0E        ; $E is 14 for 2x7 bits.  (0-7 is 8 positions.)
loop:   ASL  HTD_IN      ; Look at next high bit.  If it's 0,
        BCC  htd1        ; don't add anything to the output for this bit.
        LDA  HTD_OUT     ; Otherwise get the running output sum
        CLC
        ADC  TABLE,X     ; and add the appropriate value for this bit
        STA  HTD_OUT     ; from the table, and store the new sum.
        LDA  HTD_OUT+1   ; After low byte, do high byte.
        ADC  TABLE+1,X
        STA  HTD_OUT+1

htd1:   DEX              ; Go down to next bit value to loop again.
        DEX
        BPL  loop        ; If still not done, go back for another loop.

        CLD
        RTS
 ;----------------
