# The Burrito Time Library

[← Back to Home](../Natives.md)

> **Note:** The Time library provides utilities for measuring
> elapsed time, retrieving the current system time, and pausing execution.

Name: `time`

---

## Time Functions

| Function          | Description                                      |
| ----------------- | ------------------------------------------------ |
| `time.clock()`    | Returns the program runtime in seconds.          |
| `time.time()`     | Returns the current Unix timestamp.              |
| `time.sleep(x)`   | Pauses execution for a number of seconds.        |

---

## Function Reference

---

### `time.clock()`

Returns the amount of processor time used by the program.

#### Returns

`Number`

#### Notes

- Measured in seconds.
- Useful for benchmarking and profiling.
- Starts counting when the program begins execution.

#### Example

```js
decl start = time.clock();

// expensive work here...

decl end = time.clock();

decl elapsed = end - start;

// elapsed contains runtime in seconds;
```

---

### `time.time()`

Returns the current Unix timestamp or "epoch time".

#### Returns

`Number`

#### Notes

- Measured in whole seconds.
- Represents the number of seconds since:
  `January 1st, 1970 (UTC)`.

#### Example

```js
decl now = time.time();

// Example:
// 1716840271;
```

---

### `time.sleep(x)`

Pauses execution for a number of seconds.

#### Parameters

| Name | Type   | Description                     |
| ---- | ------ | ------------------------------- |
| `x`  | Number | Number of seconds to sleep.     |

#### Notes

- Fractional seconds are supported.
- Blocks program execution until the delay completes.

#### Example

```js
print("Waiting...");

time.sleep(2);

print("Done!");
```

#### Fractional Delay Example

```js
time.sleep(0.5);

// Sleeps for half a second;
```

---