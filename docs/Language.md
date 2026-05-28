# How to use Burrito

[← Back to Home](../README.md)

Burrito is a general-purpose language, meaning it can do the same task in many paradigms, including, but not limited to:
- Procedural
- Functional (with closures / lambdas)
- Object-Oriented
- Generic (with dynamic typing / reflection)

The following is a list of things you may wish to do, and how to do it.
A table for quick navigation:

| Language Construct    | Link                           |
| --------------------- | ------------------------------ |
| Variable Declarations | [Link](#variable-declarations) |

---

## Variable Declarations

[↑ Back to top](#how-to-use-burrito)

```js
    decl number = 5;
    decl string = "Hello, world!";
    decl lambda = lambda (x) => { return x + 2; };
```

Variables in Burrito are declared using the `decl` keyword.
They are dynamically typed, meaning a variable can hold literally any value.
Use the `const` keyword to declare constants, like so:

```js
    const PI = 3.1416;
```

Constants cannot be changed, and will raise an error if you attempt to do so.

---