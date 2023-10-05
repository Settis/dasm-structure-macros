    processor 6502
    org $200
    INCDIR "../../lib"
    INCLUDE "STRUCMAC.ASM"
    
    RTS_IF_FLAG_VAR $4000, IS_CLEAR
    RTS_IF_FLAG_VAR $5000, IS_SET    
