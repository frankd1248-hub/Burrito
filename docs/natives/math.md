# The Burrito Math Library

[← Back to Home](../Natives.md)

> **Note:** All functions accept only numeric arguments.

Name: `math`

---

## Constants

| Constant  | Description                    |
| --------- | ------------------------------ |
| `math.pi` | The mathematical constant π.   |
| `math.e`  | Euler’s number.                |

---

## Powers

| Function           | Description                              |
| ------------------ | ---------------------------------------- |
| `math.power(b, p)` | [Details](#mathpowerb-p)                 |
| `math.sqrt(x)`     | Returns the positive square root of `x`. |
| `math.cbrt(x)`     | Returns the cube root of `x`.            |

---

## Trigonometric Functions

> Trigonometric functions use **radians**.
> Use `math.degToRad()` to convert degrees to radians.

| Function              | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| `math.sin(x)`         | Returns the sine of `x`.                                      |
| `math.cos(x)`         | Returns the cosine of `x`.                                    |
| `math.tan(x)`         | Returns the tangent of `x`.                                   |
| `math.asin(x)`        | Returns the inverse sine of `x`.                              |
| `math.acos(x)`        | Returns the inverse cosine of `x`.                            |
| `math.atan(x)`        | Returns the inverse tangent of `x`.                           |
| `math.atan2(y, x)`    | Returns the arctangent of `y / x`, preserving quadrant info.  |
| `math.degToRad(x)`    | Converts degrees to radians.                                  |
| `math.radToDeg(x)`    | Converts radians to degrees.                                  |
| `math.hypot(x, y)`    | Returns the hypotenuse length for legs `x` and `y`.           |

---

## Rounding

| Function          | Description                               |
| ----------------- | ----------------------------------------- |
| `math.floor(x)`   | Rounds `x` down to the nearest integer.   |
| `math.ceil(x)`    | Rounds `x` up to the nearest integer.     |
| `math.round(x)`   | Rounds `x` to the nearest integer.        |

---

## Utility Functions

| Function                           | Description                                                |
| ---------------------------------- | ---------------------------------------------------------- |
| `math.abs(x)`                      | Returns the absolute value of `x`.                         |
| `math.min(x1, x2, ...)`            | Returns the smallest value in the list.                    |
| `math.max(x1, x2, ...)`            | Returns the largest value in the list.                     |
| `math.rand()`                      | Returns a random number between `0` and `1` (inclusive).   |
| `math.randRange(lo, hi)`           | Returns a random number between `lo` and `hi` (inclusive). |
| `math.distance(x1, y1, x2, y2)`    | Returns the distance between two Cartesian points.         |

---

### `math.power(b, p)`

Raises a double b to a power p.

#### Parameters

| Name | Type   | Description                     |
| ---- | ------ | ------------------------------- |
| `b`  | Number | The base.                       |
| `p`  | Number | The power to raise the base by. |

#### Returns

`Number` — b^p.

#### Notes

- You cannot raise a negative number to a fractional power.
- You cannot raise zero to a negative power (essentially dividing by zero)


#### Example

```js
math.power(5, 2); // 25
```

---