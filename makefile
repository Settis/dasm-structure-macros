test: assemble compareAll

ASM_WITH_FILES := $(wildcard test/with/*.asm)
ASM_WITHOUT_FILES := $(wildcard test/without/*.asm)
OUT_WITH_FILES := $(patsubst %.asm, %.out, $(ASM_WITH_FILES))
OUT_WITHOUT_FILES := $(patsubst %.asm, %.out, $(ASM_WITHOUT_FILES))
CPM := $(patsubst test/with/%.out, test/%.cmp, $(OUT_WITH_FILES))

%.out: %.asm
	dasm $< -Ilib -o$@

assemble: $(OUT_WITH_FILES) $(OUT_WITHOUT_FILES)

compareAll: $(CPM)

test/%.cmp: test/with/%.out test/without/%.out
	diff $^ && echo "OK" > $@

clean:
	$(RM) test/with/*.out
	$(RM) test/without/*.out
	$(RM) test/*.cmp
