# The Burrito String Library

[← Back to Home](../Natives.md)

> **Note:** String methods operate on Burrito strings.
> All indexing operations use zero-based indices.

---

## Information Methods

| Function               | Description                                 |
| ---------------------- | ------------------------------------------- |
| `string.len()`         | Returns the length of the string.           |
| `string.find(x)`       | Returns the index of a substring.           |
| `string.contains(x)`   | Returns whether a substring exists.         |
| `string.startsWith(x)` | Returns whether the string starts with `x`. |
| `string.endsWith(x)`   | Returns whether the string ends with `x`.   |
| `string.isAlpha()`     | Returns whether the string is alphabetic.   |
| `string.isNumeric()`   | Returns whether the string is numeric.      |

---

## Transformation Methods

| Function                        | Description                                  |
| ------------------------------- | -------------------------------------------- |
| `string.substr(start, end)`     | Returns part of the string.                  |
| `string.split(delimiter)`       | Splits the string into an array.             |
| `array.join(delimiter)`         | Joins an array of strings together.          |
| `string.trim()`                 | Removes surrounding whitespace.              |
| `string.upper()`                | Converts the string to uppercase.            |
| `string.lower()`                | Converts the string to lowercase.            |
| `string.replace(a, b)`          | Replaces the first occurrence of `a`.        |
| `string.replaceAll(a, b)`       | Replaces all occurrences of `a`.             |
| `string.repeat(count)`          | Repeats the string multiple times.           |

---

# Method Reference

---

## `string.len()`

Returns the number of characters in the string.

### Returns

`Number`

### Example

```js
decl len = "Burrito".len();

// len = 7;
```

---

## `string.substr(start, end)`

Returns a substring from `start` to `end`.

### Parameters

| Name    | Type   | Description                  |
| ------- | ------ | ---------------------------- |
| `start` | Number | Starting index (inclusive).  |
| `end`   | Number | Ending index (exclusive).    |

### Notes

- Indices must be valid.
- Invalid ranges raise an error.

### Example

```js
decl x = "Burrito".substr(0, 4);

// x = "Burr";
```

---

## `string.find(x)`

Finds the first occurrence of a substring.

### Returns

- Index of the substring.
- `-1` if not found.

### Example

```js
decl idx = "hello world".find("world");

// idx = 6;
```

---

## `string.split(delimiter)`

Splits the string into an array of substrings.

### Returns

An array of strings.

### Notes

- The delimiter cannot be an empty string.

### Example

```js
decl parts = "a,b,c".split(",");

// parts = {"a", "b", "c"};
```

---

## `array.join(delimiter)`

Joins an array of strings into a single string.

### Returns

`String`

### Example

```js
decl arr = {"a", "b", "c"};

decl joined = arr.join("-");

// joined = "a-b-c";
```

---

## `string.trim()`

Removes leading and trailing whitespace.

### Notes

Removes:

- Spaces
- Tabs
- Newlines
- Carriage returns

### Example

```js
decl x = "   hello world   ".trim();

// x = "hello world";
```

---

## `string.upper()`

Converts the string to uppercase.

### Returns

`String`

### Example

```js
decl x = "burrito".upper();

// x = "BURRITO";
```

---

## `string.lower()`

Converts the string to lowercase.

### Returns

`String`

### Example

```js
decl x = "BURRITO".lower();

// x = "burrito";
```

---

## `string.startsWith(x)`

Returns whether the string begins with a prefix.

### Returns

`Boolean`

### Example

```js
"burrito".startsWith("bur");

// true;
```

---

## `string.endsWith(x)`

Returns whether the string ends with a suffix.

### Returns

`Boolean`

### Example

```js
"burrito".endsWith("ito");

// true;
```

---

## `string.contains(x)`

Returns whether the string contains a substring.

### Returns

`Boolean`

### Example

```js
"hello world".contains("world");

// true;
```

---

## `string.replace(a, b)`

Replaces the first occurrence of a substring.

### Returns

`String`

### Notes

- Only the first match is replaced.

### Example

```js
decl x = "one two two".replace("two", "three");

// x = "one three two";
```

---

## `string.replaceAll(a, b)`

Replaces all occurrences of a substring.

### Returns

`String`

### Example

```js
decl x = "one two two".replaceAll("two", "three");

// x = "one three three";
```

---

## `string.repeat(count)`

Repeats the string multiple times.

### Parameters

| Name    | Type   | Description              |
| ------- | ------ | ------------------------ |
| `count` | Number | Number of repetitions.   |

### Notes

- `count` must be non-negative.

### Example

```js
decl x = "ha".repeat(3);

// x = "hahaha";
```

---

## `string.isAlpha()`

Returns whether the string contains only alphabetic characters.

### Returns

`Boolean`

### Notes

- Empty strings return `false`.
- Only ASCII letters are supported.

### Example

```js
"Hello".isAlpha();

// true;
```

```js
"Hello123".isAlpha();

// false;
```

---

## `string.isNumeric()`

Returns whether the string contains only numeric characters.

### Returns

`Boolean`

### Notes

- Empty strings return `false`.
- Only digits `0-9` are accepted.

### Example

```js
"12345".isNumeric();

// true;
```

```js
"12.5".isNumeric();

// false;
```

---