## Implementation of structure macros for DAMS.

The original is here: https://wilsonminesco.com/StructureMacros/

## The project structure

The macros files are in "lib" folder.
The "test" folder as it's obvious for tests. Each macro is present in tests in two forms: how it can be used in "test/with" and how the same code can be written in pure assembly in "test/without". Both versions (eg. test/with/if_eq.asm and test/without/if_eq.asm) assembles in the same binary outputs.
