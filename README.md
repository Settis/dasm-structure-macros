## Implementation of structure macros for DAMS.

The original is here: https://wilsonminesco.com/StructureMacros/

## Differences

The original macros was written for Cross-32 assembly, but this varian is targeted to DASM.
Because of DASM limitations and features macros implementation is different and here is a list of them:

- in `begin while repeat` I use `REPEAT_`, because the `repeat` is a reserved word in DASM
- in `case` there is no limitation of cases number, you can have as many, as you want
- `case` macro can be nested

## The project structure

The macros files are in "lib" folder.
The "test" folder as it's obvious for tests. Each macro is present in tests in two forms: how it can be used in "test/with" and how the same code can be written in pure assembly in "test/without". Both versions (eg. test/with/if_eq.asm and test/without/if_eq.asm) assembles in the same binary outputs.
