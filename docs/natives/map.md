# The Burrito Map Library

[← Back to Home](../Natives.md)

> **Note:** Map keys must always be strings.
> Maps store key-value pairs and provide fast lookup operations.

Name: N/A (Bound to map objects)

---

## Constructor

| Function | Description              |
| -------- | ------------------------ |
| `map()`  | Creates a new empty map. |

---

## Mutation Methods
    
| Function                 | Description                                                 |
| ------------------------ | ----------------------------------------------------------- |
| `map.set(key, value)`    | Stores a value under the given key.                         |
| `map.delete(key)`        | Removes a key from the map.                                 |
| `map.merge(other)`       | Returns a new map combining both; `other` wins on collision |

---

## Lookup Methods

| Function              | Description                                      |
| --------------------- | ------------------------------------------------ |
| `map.get(key)`        | Returns the value associated with a key.         |
| `map.has(key)`        | Returns whether a key exists in the map.         |
| `map.keys()`          | Returns an array containing all keys.            |
| `map.values()`        | Returns an array of all values                   |
| `map.size()`          | Returns the number of entries                    |
| `map.copy()`          | Returns a shallow copy of the map                |

---

# Method Reference

---

### `map()`

Creates a new empty map.

#### Returns

`Map` — a newly initialized map.

---

### `map.set(key, value)`

Stores a value under the given string key.

#### Returns

`Boolean` — Always returns `true`.

#### Notes

- Keys must be strings.
- Existing values are overwritten.

#### Example

```js
decl map = map();

map.set("name", "Burrito");
map.set("version", 1);

// map = {
//     "name": "Burrito",
//     "version": 1
// };
```

---

### `map.get(key)`

Returns the value associated with a key.

#### Returns

- The stored value.
- `null` if the key does not exist.

#### Example

```js
decl map = map();

map.set("language", "Burrito");

decl x = map.get("language");

// x = "Burrito";
```

---

### `map.has(key)`

Returns whether a key exists in the map.

#### Returns

`Boolean`

#### Example

```js
decl map = map();

map.set("enabled", true);

map.has("enabled");

// true;
```

---

### `map.delete(key)`

Removes a key from the map.

#### Returns

`Boolean`

- `true` if the key existed.
- `false` otherwise.

#### Example

```js
decl map = map();

map.set("temp", 123);

map.delete("temp");

// true;
```

---

### `map.keys()`

Returns an array containing all keys in the map.

#### Returns

An array of strings.

#### Notes

- Key order is not guaranteed.

#### Example

```js
decl map = map();

map.set("a", 1);
map.set("b", 2);

decl keys = map.keys();

// keys = {"a", "b"};
```

---