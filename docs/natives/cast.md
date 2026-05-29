# The Burrito Cast Library

[← Back to Home](../Natives.md)

> **Note:** The Cast library provides utilities for converting
> values between types and inspecting runtime types.

Name: `cast`

---

## Conversion Functions

| Function           | Description                                      |
| ------------------ | ------------------------------------------------ |
| `cast.ntos(x)`     | Converts a number into a string.                 |
| `cast.ston(x)`     | Converts a string into a number.                 |
| `cast.toString(x)` | Converts any value into a string representation. |

---

## Type Inspection

| Function               | Description                               |
| ---------------------- | ----------------------------------------- |
| `cast.typeOf(value)`   | Returns the runtime type of a value.      |

---

## Function Reference

---

### `cast.ntos(x)`

Converts a number into a string.

#### Returns

`String`

#### Notes

- Whole numbers are printed without decimal places.
- Decimal numbers are rounded to 4 decimal places.

#### Example

```js
decl a = cast.ntos(42);
decl b = cast.ntos(3.14159);

// a = "42";
// b = "3.1416";
```

---

### `cast.ston(x)`

Converts a string into a number.

#### Returns

`Number`

#### Notes

- The string must contain a valid numeric value.
- Invalid strings raise an error.

#### Example

```js
decl x = cast.ston("123");
decl y = cast.ston("3.14");

// x = 123;
// y = 3.14;
```

---

### `cast.typeOf(value)`

Returns the runtime type of a value.

#### Returns

`String`

#### Possible Results

| Type Name         | Description                      |
| ----------------- | -------------------------------- |
| `"bool"`          | Boolean value.                   |
| `"null"`          | Null value.                      |
| `"number"`        | Numeric value.                   |
| `"String"`        | String object.                   |
| `"Array"`         | Array object.                    |
| `"Map"`           | Map object.                      |
| `"Function"`      | Function object.                 |
| `"Closure"`       | Closure object.                  |
| `"Native"`        | Native function.                 |
| `"BoundMethod"`   | Bound method.                    |
| `"Class"`         | Class object.                    |
| `"Instance"`      | Class instance.                  |
| `"Module"`        | Imported module.                 |
| `"Upvalue"`       | Captured closure value.          |
| `"ResourceFont"`  | Font resource.                   |
| `"ResourceImage"` | Image resource.                  |
| `"ResourceSound"` | Sound resource.                  |

#### Example

```js
cast.typeOf(123);

// "number";
```

```js
cast.typeOf({"a", "b"});

// "Array";
```

```js
cast.typeOf(null);

// "null";
```

---

### `cast.toString(value)`

Converts any value into its string representation.

#### Returns

`String`

#### Notes

- `null` becomes `"null"`.
- Booleans become `"true"` or `"false"`.
- Numbers are formatted with decimal places unless exceedingly close to an integer.
- Arrays and maps are recursively formatted.
- Strings are returned unchanged.

#### Object Formatting

| Value Type | Example Output         |
| ---------- | ---------------------- |
| Array      | `{ 1.0000, 2.0000 }`   |
| Map        | `{ "x": 1.0000 }`      |
| Class      | `<Class Player>`       |
| Function   | `<Function foo>`       |
| Closure    | `<Closure foo>`        |
| Instance   | `<Instance of Player>` |
| Module     | `<Module>`             |
| Native     | `<Native>`             |
| Resource   | `<Resource>`           |
| Upvalue    | `<Upvalue>`            |

#### Example

```js
decl a = cast.toString(42);

// a = "42";
```

```js
decl b = cast.toString(true);

// b = "true";
```

```js
decl c = cast.toString({1, 2, 3});

// c = "{ 1, 2, 3 }";
```

---