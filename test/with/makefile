ASM_FILES := $(wildcard *.asm)
OUT_FILES := $(patsubst %.asm, %.out, $(ASM_FILES))

%.out: %.asm
	dasm $< -o$@

assemble: $(OUT_FILES)

checkDiff:
	for out_file in $(OUT_FILES); do \
		diff $$out_file ../without/$$out_file; \
	done
