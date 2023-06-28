ASM_FILES := $(wildcard *.asm)
OUT_FILES := $(patsubst %.asm, %.out, $(ASM_FILES))

%.out: %.asm
	dasm $< -o$@

assemble: $(OUT_FILES)
