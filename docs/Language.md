# Burrito Language Reference

[← Back to Home](../README.md)

Burrito is a general-purpose dynamically-typed language. It supports several programming styles including procedural, functional (via closures and lambdas), and object-oriented.

Quick navigation:

| Language Construct         | Link                              |
| -------------------------- | --------------------------------- |
| Variable Declarations      | [Link](#variable-declarations)    |
| Operators                  | [Link](#operators)                |
| Bitwise Operations         | [Link](#bitwise-operations)       |
| Strings                    | [Link](#strings)                  |
| Arrays                     | [Link](#arrays)                   |
| Maps                       | [Link](#maps)                     |
| Control Flow               | [Link](#control-flow)             |
| Switch Blocks              | [Link](#switch-blocks)            |
| For Loops                  | [Link](#for-loops)                |
| While Loops                | [Link](#while-loops)              |
| Functions                  | [Link](#functions)                |
| Lambda Expressions         | [Link](#lambda-expressions)       |
| Classes and Instances      | [Link](#classes-and-instances)    |
| Inheritance                | [Link](#inheritance)              |
| Error Handling             | [Link](#error-handling)           |
| Modules and Imports        | [Link](#modules-and-imports)      |
| Standard Library           | [Link](#standard-library)         |

---

## Variable Declarations

[↑ Back to top](#burrito-language-reference)

Variables are declared with the `decl` keyword. They are dynamically typed — a variable can hold any value.

```js
decl number = 5;
decl message = "Hello, world!";
decl flag = true;
decl nothing = null;
```

Use `const` to declare a constant. Constants cannot be reassigned.

```js
const PI = 3.14159;
const MAX_RETRIES = 3;
```

Attempting to reassign a constant raises a runtime error.

### First-class functions

Functions are values and can be stored in variables, passed as arguments, and returned from other functions.

```js
fn increment(x) {
    return x + 1;
}

decl fn = increment;
print("%d\n", fn(5));
// 6
```

You can also store bound instance methods and native methods:

```js
class Vector2 {
    init(x, y) {
        this.x = x;
        this.y = y;
    }

    add(other) {
        this.x += other.x;
        this.y += other.y;
    }

    printVector() {
        print("(%d, %d)\n", this.x, this.y);
    }
}

decl a = Vector2(1, 3);
decl addToA = a.add;

addToA(Vector2(2, 3));
a.printVector();
// (3, 6)
```

---

## Operators

[↑ Back to top](#burrito-language-reference)

### Precedence

Higher precedence means tighter binding. For example, `*` binds more tightly than `+`, so `3 + 5 * 7` evaluates as `3 + (5 * 7) = 38`.

| Precedence | Operators                         |
| ---------- | --------------------------------- |
| 14         | `.`  `()`  `[]`                   |
| 13         | `!`  `-`  `~`  `++`  `--`         |
| 12         | `*`  `/`  `%`                     |
| 11         | `+`  `-`                          |
| 10         | `<<`  `>>`                        |
| 9          | `<`  `>`  `<=`  `>=`              |
| 8          | `==`  `!=`                        |
| 7          | `&`                               |
| 6          | `^`                               |
| 5          | `\|`                              |
| 4          | `and`                             |
| 3          | `or`                              |
| 2          | `?:`                              |
| 1          | `=`  `+=`  `-=`  `*=`  `/=`  `%=` |

### Operator reference

| Operator              | Arity  | Description                                                         |
| --------------------- | ------ | ------------------------------------------------------------------- |
| `!`                   | 1      | Logical negation — flips a boolean                                  |
| `~`                   | 1      | Bitwise NOT — see [Bitwise Operations](#bitwise-operations)         |
| `-`                   | 1 or 2 | Negates a number, or subtracts two numbers                          |
| `++`                  | 1      | Pre-increment: `++x` adds 1 to `x` and returns the new value        |
| `--`                  | 1      | Pre-decrement: `--x` subtracts 1 from `x` and returns the new value |
| `*`                   | 2      | Multiplication                                                      |
| `/`                   | 2      | Division                                                            |
| `%`                   | 2      | Modulus (remainder)                                                 |
| `+`                   | 2      | Addition, or string concatenation                                   |
| `-`                   | 2      | Subtraction                                                         |
| `<<`  `>>`            | 2      | Bitwise shifts — see [Bitwise Operations](#bitwise-operations)      |
| `<`  `>`  `<=`  `>=`  | 2      | Numeric comparisons                                                 |
| `==`  `!=`            | 2      | Equality comparisons — work on any value type                       |
| `&`                   | 2      | Bitwise AND                                                         |
| `^`                   | 2      | Bitwise XOR                                                         |
| `\|`                  | 2      | Bitwise OR                                                          |
| `and`                 | 2      | Logical AND — `true` only if both operands are `true`               |
| `or`                  | 2      | Logical OR — `true` if either operand is `true`                     |
| `x ? y : z`           | 3      | Ternary — evaluates to `y` if `x` is true, else `z`                 |
| `=`                   | 2      | Assignment                                                          |
| `+=`  `-=`  `*=`  `/=`  `%=` | 2 | Compound assignment — shorthand for `x = x op y`                  |

### Compound assignment and increment

```js
decl x = 10;
x += 5;   // x is 15
x -= 3;   // x is 12
x *= 2;   // x is 24
x /= 4;   // x is 6
x %= 4;   // x is 2

decl y = 0;
++y;      // y is 1
--y;      // y is 0
```

---

## Bitwise Operations

[↑ Back to top](#burrito-language-reference)

Bitwise operators cast their operands to 32-bit integers before operating.

### Bitwise NOT

`~x` casts `x` to a 32-bit signed integer and flips every bit.

```js
print("%d\n", ~0);   // -1
print("%d\n", ~7);   // -8
```

### Bitwise shifts

`<<` and `>>` cast both operands to 32-bit unsigned integers and shift the bits of the left operand.

```js
decl x = 1 << 5;   // 32
decl y = 64 >> 2;  // 16
```

### Bitwise AND, OR, XOR

| Inputs | AND (`&`) | OR (`\|`) | XOR (`^`) |
| ------ | --------- | --------- | --------- |
| 0, 0   | 0         | 0         | 0         |
| 0, 1   | 0         | 1         | 1         |
| 1, 0   | 0         | 1         | 1         |
| 1, 1   | 1         | 1         | 0         |

### Example: flag masks

```js
const FLAG_VERBOSE = 1 << 0;
const FLAG_DRY_RUN = 1 << 1;
const FLAG_FORCE   = 1 << 2;

fn run(flags) {
    if (flags & FLAG_VERBOSE) { print("verbose mode\n"); }
    if (flags & FLAG_DRY_RUN) { print("dry run\n"); }
    if (flags & FLAG_FORCE)   { print("forced\n"); }
}

run(FLAG_VERBOSE | FLAG_DRY_RUN);
```

---

## Strings

[↑ Back to top](#burrito-language-reference)

Strings are immutable sequences of characters. String literals use double quotes.

```js
decl greeting = "Hello, world!";
decl escaped  = "Line one\nLine two\tTabbed";
```

### String interpolation

Embed any expression inside a string using `${...}`. Non-string values are automatically converted.

```js
decl name = "Alice";
decl score = 99;

print("${name} scored ${score} points!\n");
// Alice scored 99 points!
```

### `print()` and format strings

`print()` is a built-in variadic function using `printf`-style format specifiers.

```js
print("%s scored %d points\n", "Alice", 42);
```

| Specifier | Accepts      |
| --------- | ------------ |
| `%s`      | String       |
| `%d`      | Number       |
| `%b`      | Boolean      |
| `%o`      | Any value    |

### String methods

| Method                          | Description                                     |
| ------------------------------- | ----------------------------------------------- |
| `len()`                         | Returns the number of characters                |
| `substr(begin, end)`            | Returns the substring from `begin` to `end`     |
| `find(str)`                     | Returns the first index of `str`, or `-1`       |
| `split(delim)`                  | Splits into an array on a delimiter             |
| `join(delim)`                   | Joins an array of strings with a delimiter      |
| `trim()`                        | Removes leading and trailing whitespace         |
| `upper()`                       | Converts to uppercase                           |
| `lower()`                       | Converts to lowercase                           |
| `startsWith(prefix)`            | `true` if the string begins with `prefix`       |
| `endsWith(suffix)`              | `true` if the string ends with `suffix`         |
| `contains(str)`                 | `true` if `str` appears anywhere in the string  |
| `replace(find, replacement)`    | Replaces the first occurrence of `find`         |
| `replaceAll(find, replacement)` | Replaces all occurrences of `find`              |
| `repeat(n)`                     | Returns the string repeated `n` times           |
| `isAlpha()`                     | `true` if every character is `[a-zA-Z]`         |
| `isNumeric()`                   | `true` if every character is `[0-9]`            |

### Examples

```js
decl phrase = "  burrito language  ";

print("%d\n", phrase.len());           // 20
print("%s\n", phrase.trim());          // "burrito language"
print("%s\n", phrase.trim().upper());  // "BURRITO LANGUAGE"
print("%b\n", phrase.contains("lang")); // true
```

```js
decl csv = "apple,banana,orange";
decl fruits = csv.split(",");

print("%o\n", fruits);             // { apple, banana, orange }
print("%s\n", fruits.join(" | ")); // apple | banana | orange
```

```js
decl s = "hello";
print("%s\n", s.repeat(3));           // hellohellohello
print("%b\n", s.isAlpha());           // true
print("%s\n", s.replace("l", "r"));   // herlo
print("%s\n", s.replaceAll("l", "r")); // herro
```

---

## Arrays

[↑ Back to top](#burrito-language-reference)

Arrays use `{}` literals and are dynamically sized. They may hold mixed types.

```js
decl numbers = { 1, 2, 3, 4 };
decl mixed   = { 5, "hello", true, null };
decl empty   = {};
```

### Indexing

```js
decl arr = { 10, 20, 30 };

print("%d\n", arr[0]);  // 10
arr[1] = 99;
print("%o\n", arr);     // { 10, 99, 30 }
```

Negative indexing is not supported. Accessing an out-of-bounds index raises an error.

### Array methods

| Method                       | Description                                               |
| ---------------------------- | --------------------------------------------------------- |
| `push(value)`                | Appends a value to the end                                |
| `pop()`                      | Removes and returns the last value                        |
| `insert(index, value)`       | Inserts a value before `index`                            |
| `remove(index)`              | Removes and returns the value at `index`                  |
| `slice(start, end)`          | Returns a new sub-array `[start, end)`                    |
| `concat(other)`              | Appends all elements of `other` in-place                  |
| `reverse()`                  | Reverses the array in-place                               |
| `sort(comparator)`           | Sorts the array in-place with a comparator                |
| `sorted(comparator)`         | Returns a sorted copy, leaving original intact            |
| `contains(value)`            | `true` if `value` exists in the array                     |
| `indexOf(value)`             | Returns the index of `value`, or `-1`                     |
| `fill(start, length, value)` | Fills a region with `value`                               |
| `copy()`                     | Returns a shallow copy                                    |
| `map(fn)`                    | Returns a new array with `fn` applied to each element     |
| `filter(fn)`                 | Returns a new array of elements where `fn` returns `true` |
| `reduce(fn, initial)`        | Folds the array into a single value                       |
| `forEach(fn)`                | Calls `fn` for each element; returns nothing              |
| `every(fn)`                  | `true` if `fn` returns `true` for all elements            |
| `some(fn)`                   | `true` if `fn` returns `true` for any element             |
| `flatten()`                  | Recursively flattens nested arrays                        |

[More details](natives/array.md)

### Examples

```js
decl arr = { 1, 2, 3 };
arr.push(4);
print("%o\n", arr);          // { 1, 2, 3, 4 }
print("%d\n", arr.pop());    // 4
print("%o\n", arr);          // { 1, 2, 3 }
```

```js
decl nums = { 1, 2, 3, 4, 5, 6 };

decl doubled = nums.map(lambda (x) => { return x * 2; });
print("%o\n", doubled);      // { 2, 4, 6, 8, 10, 12 }

decl evens = nums.filter(lambda (x) => { return x % 2 == 0; });
print("%o\n", evens);        // { 2, 4, 6 }

decl sum = nums.reduce(lambda (acc, x) => { return acc + x; }, 0);
print("%d\n", sum);          // 21
```

```js
// sort() modifies in-place; sorted() returns a copy
decl nums = { 5, 1, 7, 3 };
decl asc = nums.sorted(lambda (x, y) => { return x < y; });

print("%o\n", nums);   // { 5, 1, 7, 3 }  — unchanged
print("%o\n", asc);    // { 1, 3, 5, 7 }
```

```js
decl nested = { 1, { 2, 3 }, { 4, { 5, 6 } } };
print("%o\n", nested.flatten());  // { 1, 2, 3, 4, 5, 6 }
```

```js
decl nums = { 2, 4, 6 };
print("%b\n", nums.every(lambda (x) => { return x % 2 == 0; }));  // true
print("%b\n", nums.some(lambda (x) => { return x > 5; }));        // true
```

---

## Maps

[↑ Back to top](#burrito-language-reference)

Maps are associative containers of key-value pairs. Keys must be strings.

```js
decl scores = map();
scores.set("Alice", 100);
scores.set("Bob", 95);

print("%d\n", scores.get("Alice"));   // 100
print("%b\n", scores.has("Charlie")); // false
```

### Map methods

| Method              | Description                                                 |
| ------------------- | ----------------------------------------------------------- |
| `set(key, value)`   | Adds or updates a key                                       |
| `get(key)`          | Returns the value for `key`, or `null` if absent            |
| `has(key)`          | `true` if `key` exists                                      |
| `delete(key)`       | Removes a key                                               |
| `keys()`            | Returns an array of all keys                                |
| `values()`          | Returns an array of all values                              |
| `size()`            | Returns the number of entries                               |
| `copy()`            | Returns a shallow copy of the map                           |
| `merge(other)`      | Returns a new map combining both; `other` wins on collision |

[More details](natives/map.md)

### Examples

```js
decl m = map();
m.set("x", 1);
m.set("y", 2);
m.set("z", 3);

print("%o\n", m.keys());    // { x, y, z }
print("%o\n", m.values());  // { 1, 2, 3 }
print("%d\n", m.size());    // 3
```

```js
decl defaults = map();
defaults.set("timeout", 30);
defaults.set("retries", 3);

decl overrides = map();
overrides.set("retries", 5);

decl config = defaults.merge(overrides);
print("%d\n", config.get("timeout"));  // 30
print("%d\n", config.get("retries"));  // 5
```

---

## Control Flow

[↑ Back to top](#burrito-language-reference)

### if / else if / else

```js
decl score = 85;

if (score >= 90) {
    print("Excellent\n");
} else if (score >= 70) {
    print("Passing\n");
} else {
    print("Failing\n");
}
```

### Ternary expression

```js
decl age = 20;
decl label = age >= 18 ? "adult" : "minor";

print("%s\n", label);  // adult
```

---

## Switch Blocks

[↑ Back to top](#burrito-language-reference)

`switch` compares a value against a list of `case` labels. An optional `default` case matches anything not covered by another case.

```js
decl command = "quit";

switch (command) {
    case "help": {
        print("Showing help\n");
    }

    case "quit": {
        print("Exiting\n");
    }

    default: {
        print("Unknown command: %s\n", command);
    }
}
```

> **Note:** Cases do not fall through. Each matched case executes its block and then exits the switch.

---

## For Loops

[↑ Back to top](#burrito-language-reference)

### Traditional for loop

```js
for (decl i = 0; i < 5; i++) {
    print("%d\n", i);
}
```

### for-in loop

Iterates over each element in an array.

```js
decl fruits = { "apple", "banana", "pear" };

for (decl fruit in fruits) {
    print("%s\n", fruit);
}
```

---

## While Loops

[↑ Back to top](#burrito-language-reference)

```js
decl i = 0;

while (i < 5) {
    print("%d\n", i);
    i++;
}
```

### break and continue

`break` exits the nearest enclosing loop immediately. `continue` skips the rest of the current iteration and proceeds to the next.

```js
for (decl i = 0; i < 10; i++) {
    if (i == 3) { continue; }  // skip 3
    if (i == 7) { break; }     // stop at 7
    print("%d\n", i);
}
// 0 1 2 4 5 6
```

---

## Functions

[↑ Back to top](#burrito-language-reference)

Functions are declared with the `fn` keyword.

```js
fn add(a, b) {
    return a + b;
}

print("%d\n", add(2, 5));  // 7
```

Functions return `null` if execution reaches the end without a `return` statement. Early return is supported.

```js
fn abs(x) {
    if (x < 0) { return -x; }
    return x;
}
```

Functions are first-class values and can be passed as arguments:

```js
fn apply(x, fn) {
    return fn(x);
}

print("%d\n", apply(5, lambda (x) => { return x * 2; }));  // 10
```

### Recursion

```js
fn factorial(n) {
    if (n <= 1) { return 1; }
    return n * factorial(n - 1);
}

print("%d\n", factorial(6));  // 720
```

---

## Lambda Expressions

[↑ Back to top](#burrito-language-reference)

Lambdas are anonymous functions using the `lambda (params) => { body }` syntax.

```js
decl square = lambda (x) => {
    return x * x;
};

print("%d\n", square(9));  // 81
```

### Closures

Lambdas capture variables from their enclosing scope.

```js
fn makeMultiplier(factor) {
    return lambda (x) => {
        return x * factor;
    };
}

decl triple = makeMultiplier(3);
print("%d\n", triple(7));  // 21
```

### With array methods

```js
decl words = { "apple", "banana", "pear" };

decl upper = words.map(lambda (w) => {
    return w.upper();
});

print("%o\n", upper);  // { APPLE, BANANA, PEAR }
```

---

## Classes and Instances

[↑ Back to top](#burrito-language-reference)

### Declaring a class

```js
class Person {

    init(name, age) {
        this.name = name;
        this.age  = age;
    }

    greet() {
        print("Hi, I'm %s and I'm %d years old.\n", this.name, this.age);
    }
}
```

The `init` method is the constructor. It runs automatically when you create an instance.

### Creating instances

```js
decl alice = Person("Alice", 22);
alice.greet();
// Hi, I'm Alice and I'm 22 years old.
```

### Instance fields

Fields are created by assigning to `this.fieldName` inside any method. They can be read and written from outside the instance too.

```js
class Counter {

    init() {
        this.count = 0;
    }

    increment() {
        this.count++;
    }
}

decl c = Counter();
c.increment();
c.increment();
print("%d\n", c.count);  // 2
```

### Bound methods

Accessing a method through an instance returns a *bound method* — a callable that remembers its receiver.

```js
class Logger {
    log(message) {
        print("LOG: %s\n", message);
    }
}

decl logger = Logger();
decl logFn  = logger.log;

logFn("Hello from a bound method");  // LOG: Hello from a bound method
```

---

## Inheritance

[↑ Back to top](#burrito-language-reference)

A class can inherit from another using `:`.

```js
class Animal {

    init(name) {
        this.name = name;
    }

    speak() {
        print("%s makes a sound.\n", this.name);
    }
}

class Dog : Animal {

    init(name) {
        super.init(name);
    }

    speak() {
        print("%s barks.\n", this.name);
    }
}

decl d = Dog("Rex");
d.speak();  // Rex barks.
```

`super` refers to the parent class. You can call parent methods with `super.methodName(...)`.

A class cannot inherit from itself. Only single inheritance is supported.

### Runtime type inspection

```js
import cast;

print("%s\n", cast.typeOf(Dog));          // Class
print("%s\n", cast.typeOf(Dog("Rex")));   // Instance
```

---

## Error Handling

[↑ Back to top](#burrito-language-reference)

### try / catch

Use `try`/`catch` to handle errors without crashing. The caught value is the error message as a string.

```js
try {
    decl n = cast.ston("not a number");
} catch (err) {
    print("Caught: %s\n", err);
}
```

### throw

Any value can be thrown. It will be converted to a string and becomes the error message.

```js
fn divide(a, b) {
    if (b == 0) {
        throw "Division by zero";
    }
    return a / b;
}

try {
    print("%d\n", divide(10, 0));
} catch (err) {
    print("Error: %s\n", err);  // Error: Division by zero
}
```

You can throw any type — numbers, booleans, arrays, instances. They are all stringified:

```js
throw 404;                  // error message: "404"
throw { "code", 404 };      // error message: "{ code, 404 }"
```

### Re-throwing

Nothing prevents you from throwing inside a `catch` block to propagate an error upward.

```js
try {
    riskyOperation();
} catch (err) {
    print("Logging: %s\n", err);
    throw err;
}
```

---

## Modules and Imports

[↑ Back to top](#burrito-language-reference)

### Importing a file

`import` loads another `.bur` file and binds its exported names into the current scope.

```js
import mymodule;
```

This loads `mymodule.bur` from the same directory.

### Selective import

Use `from ... import ...` to import specific names only.

```js
from utils import formatDate, formatTime;
```

> **Note:** Burrito detects circular imports and raises an error if a file tries to import itself — directly or transitively.

---

## Standard Library

[↑ Back to top](#burrito-language-reference)

Full reference: [Natives.md](Natives.md)

### Built-in globals

These functions are available everywhere without importing.

| Function                          | Description                                              |
| --------------------------------- | -------------------------------------------------------- |
| `print(fmt, ...)`                 | Prints to stdout using a format string                   |
| `hasField(instance, name)`        | `true` if the instance has the named field               |
| `getField(instance, name)`        | Returns the value of a field by name                     |
| `setField(instance, name, value)` | Sets a field on an instance by name                      |
| `assert(condition, message)`      | Raises an error with `message` if `condition` is `false` |
| `map()`                           | Creates a new empty map                                  |