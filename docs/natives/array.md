# The Burrito Array Library

[← Back to Home](../Natives.md)

> **Note:** Array methods operate on Burrito array objects.
> Some methods mutate the original array, while others return a new one.

Name: N/A (Bound to array objects)

---

## Mutation Methods

| Function                           | Description                                          |
| ---------------------------------- | ---------------------------------------------------- |
| `array.push(value)`                | Appends `value` to the end of the array.             |
| `array.pop()`                      | Removes and returns the last element.                |
| `array.insert(index, value)`       | Inserts `value` at `index`.                          |
| `array.remove(index)`              | Removes and returns the value at `index`.            |
| `array.concat(other)`              | Appends all elements of `other` onto the array.      |
| `array.reverse()`                  | Reverses the array in place.                         |
| `array.sort(comparator)`           | Sorts the array in place using a comparator.         |
| `array.fill(start, length, value)` | Replaces a range of elements with `value`.           |

---

## Non-Mutating Methods

| Function                          | Description                                          |
| --------------------------------- | ---------------------------------------------------- |
| `array.slice(start, end)`         | Returns a copy of a section of the array.            |
| `array.copy()`                    | Returns a shallow copy of the array.                 |
| `array.sorted(comparator)`        | Returns a sorted copy of the array.                  |
| `array.flatten()`                 | Recursively flattens nested arrays.                  |

---

## Search & Query Methods

| Function                    | Description                                      |
| --------------------------- | ------------------------------------------------ |
| `array.contains(value)`     | Returns whether the array contains `value`.      |
| `array.indexOf(value)`      | Returns the index of `value`, or `-1`.           |
| `array.every(function)`     | Returns `true` if all elements pass a test.      |
| `array.some(function)`      | Returns `true` if at least one element passes.   |

---

## Functional Methods

| Function                          | Description                                         |
| --------------------------------- | --------------------------------------------------- |
| `array.map(function)`             | Returns a new array with transformed elements.      |
| `array.filter(function)`          | Returns a new array containing matching elements.   |
| `array.reduce(function, initial)` | Reduces the array into a single value.              |
| `array.forEach(function)`         | Calls a function once for every element.            |

---

## Method Reference

---

### `array.push(value)`

Appends a value to the end of the array.

#### Returns

`Boolean` — Always returns `true`.

#### Example

```js
decl arr = {1, 2};

arr.push(3);

// arr = {1, 2, 3};
```

---

### `array.pop()`

Removes and returns the last element.

#### Returns

The removed value, or `null` if the array is empty.

#### Example

```js
decl arr = {1, 2, 3};

decl x = arr.pop();

// x = 3;
// arr = {1, 2};
```

---

### `array.insert(index, value)`

Inserts a value at the given index.

#### Notes

- Valid indices range from `0` to `array.length`.
- Elements after the insertion point are shifted right.

#### Example

```js
decl arr = {1, 3};

arr.insert(1, 2);

// arr = {1, 2, 3};
```

---

### `array.remove(index)`

Removes and returns the element at the given index.

#### Notes

- Elements after the removed value are shifted left.

#### Example

```js
decl arr = {1, 2, 3};

decl x = arr.remove(1);

// x = 2;
// arr = {1, 3};
```

---

### `array.slice(start, end)`

Returns a copy of part of the array.

#### Notes

- `start` is inclusive.
- `end` is exclusive.
- Out-of-range indices are clamped automatically.

#### Example

```js
decl arr = {1, 2, 3, 4};

decl x = arr.slice(1, 3);

// x = {2, 3};
```

---

### `array.concat(other)`

Appends all elements from another array.

#### Returns

`Boolean` — Always returns `true`.

#### Example

```js
decl a = {1, 2};
decl b = {3, 4};

a.concat(b);

// a = {1, 2, 3, 4};
```

---

### `array.reverse()`

Reverses the array in place.

#### Returns

`Boolean` — Always returns `true`.

#### Example

```js
decl arr = {1, 2, 3};

arr.reverse();

// arr = {3, 2, 1};
```

---

### `array.sort(comparator)`

Sorts the array in place using a comparator function.

#### Comparator Rules

The comparator should return:

- `true` if the first value should come before the second.
- `false` otherwise.

#### Example

```js
decl arr = {5, 2, 8, 1};

arr.sort(lambda (a, b) => {
    return a < b;
});

// arr = {1, 2, 5, 8};
```

---

### `array.contains(value)`

Returns whether the array contains a value.

#### Returns

`Boolean`

#### Example

```js
{1, 2, 3}.contains(2);

// true;
```

---

### `array.indexOf(value)`

Returns the index of the first matching value.

#### Returns

- Index of the value.
- `-1` if not found.

#### Example

```js
{"a", "b", "c"}.indexOf("b");

// 1;
```

---

### `array.fill(start, length, value)`

Fills part of the array with a value.

#### Notes

- Modifies the array in place.
- The fill range must stay inside array bounds.

#### Example

```js
decl arr = {1, 2, 3, 4};

arr.fill(1, 2, 0);

// arr = {1, 0, 0, 4};
```

---

### `array.copy()`

Returns a shallow copy of the array.

#### Example

```js
decl arr = {1, 2, 3};

decl copy = arr.copy();
```

---

### `array.map(function)`

Transforms every element into a new value.

#### Returns

A new array.

#### Example

```js
decl arr = {1, 2, 3};

decl doubled = arr.map(lambda (x) => {
    return x * 2;
});

// doubled = {2, 4, 6};
```

---

### `array.filter(function)`

Returns only elements matching a condition.

#### Returns

A new array.

#### Example

```js
decl arr = {1, 2, 3, 4};

decl even = arr.filter(lambda (x) => {
    return x % 2 == 0;
});

// even = {2, 4};
```

---

### `array.reduce(function, initial)`

Reduces the array into a single value.

#### Notes

The reducer function receives:

1. The accumulator.
2. The current element.

#### Example

```js
decl arr = {1, 2, 3, 4};

decl sum = arr.reduce(lambda (acc, x) => {
    return acc + x;
}, 0);

// sum = 10;
```

---

### `array.forEach(function)`

Calls a function once for every element.

#### Returns

`null`

#### Example

```js
{1, 2, 3}.forEach(lambda (x) => {
    print(x);
});
```

---

### `array.every(function)`

Returns `true` if all elements satisfy a condition.

#### Returns

`Boolean`

#### Example

```js
{2, 4, 6}.every(lambda (x) => {
    return x % 2 == 0;
});

// true;
```

---

### `array.some(function)`

Returns `true` if at least one element satisfies a condition.

#### Returns

`Boolean`

#### Example

```js
{1, 3, 4}.some(lambda (x) => {
    return x % 2 == 0;
});

// true;
```

---

### `array.flatten()`

Recursively flattens nested arrays.

#### Returns

A new flattened array.

#### Example

```js
decl arr = {1, {2, {3, 4}}, 5};

decl flat = arr.flatten();

// flat = {1, 2, 3, 4, 5};
```

---

### `array.sorted(comparator)`

Returns a sorted copy of the array.

#### Notes

- Does not modify the original array.
- Uses the same comparator rules as `array.sort()`.

#### Example

```js
decl arr = {3, 1, 2};

decl sorted = arr.sorted(lambda (a, b) => {
    return a < b;
});

// sorted = {1, 2, 3};
// arr = {3, 1, 2};
```

---