# What is Burrito?

A high-level, general-purpose, multi-paradigm, dynamically typed programming language written with C.
This was based off of the features from Robert Nystrom's Lox, with my own QoL ones sprinkled in.

Namely, break&continue, switch blocks, the ternary operator, mutation and bitwise operators, inc/decrementation, modules to go with natives, string indexing, native printf-style printing, compile-time escape characters, runtime reflection natives, string interpolation, error handling with try/catch, lambda expressions, maps, arrays, and bound native methods for maps and arrays.

Constant folding and constant propagation also included.

I raised the limit on globals to 16777216, and the limit on locals to 16384.

I also wrote some software to help me test the language, see src/testing.cpp.

Did I mention fast native graphics with Raylib's C bindings?

Here is a link to my [Documentation of the standard library](docs/Natives.md)
Here is a [Language reference](docs/Language.md) if you want to do something with Burrito.