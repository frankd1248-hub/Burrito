# Graphics Module Reference

[← Back to Home](../Natives.md)

The graphics module provides 2D rendering, image/audio loading, input handling, and window management using Raylib.

Burrito exposes this functionality through two modules:

* `graphics` handles rendering, textures, fonts, sounds, and the window.
* `game` handles input and event polling.

---

# Table of Contents

| Topic                 | Link                           |
| --------------------- | ------------------------------ |
| Initializing Graphics | [Link](#initializing-graphics) |
| Drawing Frames        | [Link](#drawing-frames)        |
| Colors                | [Link](#colors)                |
| Shapes                | [Link](#shapes)                |
| Text Rendering        | [Link](#text-rendering)        |
| Images                | [Link](#images)                |
| Audio                 | [Link](#audio)                 |
| Delta Time            | [Link](#delta-time)            |
| Keyboard Input        | [Link](#keyboard-input)        |
| Mouse Events          | [Link](#mouse-events)          |
| Constants             | [Link](#constants)             |

---

# Initializing Graphics

Before drawing anything, you must create a window.

```js
import graphics;

graphics.init(800, 600, "My Game");
graphics.targetFPS(60);
```

## Closing the Window

```js
graphics.closeWindow();
```

## Detecting Window Close

```js
while (!graphics.windowShouldClose()) {
    
}
```

This becomes `true` when:

* The user presses the window close button.
* The user presses Escape.

---

# Drawing Frames

Rendering in Burrito uses a begin/end frame model.

```js
while (!graphics.windowShouldClose()) {
    graphics.beginDraw();

    graphics.clearColor(30, 30, 30);

    graphics.endDraw();
}
```

You should:

1. Call `beginDraw()`.
2. Draw everything.
3. Call `endDraw()`.

Every frame.

---

# Colors

Colors are almost always arrays containing RGB or RGBA values.

```js
decl red = { 255, 0, 0 };
decl transparentBlue = { 0, 0, 255, 120 };
```

The format is:

```js
{ red, green, blue };
{ red, green, blue, alpha };
```

Each value should be between `0` and `255`.

If alpha is omitted, it defaults to `255`.

---

# Shapes

## Rectangles

```js
graphics.drawRect({ 255, 0, 0 }, 100, 100, 200, 80);
```

Arguments:

```js
graphics.drawRect(color, x, y, width, height);
```

---

## Circles

```js
graphics.drawCircle({ 0, 255, 0 }, 400, 300, 50);
```

Arguments:

```js
graphics.drawCircle(color, x, y, radius);
```

---

## Lines

```js
graphics.drawLine({ 255, 255, 255 }, 0, 0, 800, 600);
```

Arguments:

```js
graphics.drawLine(color, x1, y1, x2, y2);
```

---

## Triangles

Triangles use 3 vector arrays.

```js
graphics.drawTriangle(
    { 255, 255, 0 },
    { 400, 100 },
    { 300, 300 },
    { 500, 300 }
);
```

Arguments:

```js
graphics.drawTriangle(color, v1, v2, v3);
```

Each vector is:

```js
{ x, y };
```

---

# Text Rendering

## Basic Text

```js
graphics.drawText(
    "Hello, world!",
    { 255, 255, 255 },
    100,
    100,
    32
);
```

Arguments:

```js
graphics.drawText(text, color, x, y, size);
```

---

## Fonts

Fonts are resources loaded from disk.

```js
decl font = graphics.loadFont("assets/font.ttf", 64);
```

Arguments:

```js
graphics.loadFont(path, size);
```

---

## Advanced Text Rendering

```js
graphics.drawTextEx(
    font,
    "Burrito",
    { 255, 200, 50 },
    100,
    200,
    64
);
```

Arguments:

```js
graphics.drawTextEx(font, text, color, x, y, size);
```

---

# Images

## Loading Images

```js
decl image = graphics.loadImage("assets/player.png");
```

---

## Drawing Images

```js
graphics.drawImage(
    image,
    255,
    255,
    255,
    100,
    200
);
```

Arguments:

```js
graphics.drawImage(image, r, g, b, x, y);
```

The RGB values tint the image.

To draw normally:

```js
graphics.drawImage(image, 255, 255, 255, x, y);
```

---

# Audio

## Loading Sounds

```js
decl sound = graphics.loadSound("assets/jump.wav");
```

---

## Playing Sounds

```js
graphics.playSound(sound);
```

---

# Delta Time

`graphics.getDeltaTime()` returns the time elapsed since the previous frame.

This is useful for frame-independent movement.

```js
import graphics;

class Player {

    init() {
        this.x = 100;
        this.speed = 200;
    }

    update() {
        decl dt = graphics.getDeltaTime();
        this.x += this.speed * dt;
    }
}
```

---

# Keyboard Input

Keyboard input is provided through the `game` module.

```js
import game;
```

## Checking Keys

```js
if (game.isKeyDown(game.KEY_SPACE)) {
    print("Space pressed\n");
}
```

The argument must be a key constant.

---

# Mouse Events

Mouse input is event-based.

## Polling Events

Before reading events, call:

```js
game.pollEvents();
```

This updates the internal event queue.

---

## Reading Events

```js
decl events = game.getEvents();

for (decl i = 0; i < events.len(); i += 1) {
    decl event = events[i];

    decl type = event[0];
    decl button = event[1];
    decl x = event[2];
    decl y = event[3];

    print("Event at ${x}, ${y}\n");
}
```

Each event is an array:

```js
{ type, button, x, y };
```

---

## Event Types

| Constant          | Meaning               |
| ----------------- | --------------------- |
| `game.MOUSE_DOWN` | Mouse button pressed  |
| `game.MOUSE_UP`   | Mouse button released |

---

## Mouse Buttons

| Constant            | Meaning             |
| ------------------- | ------------------- |
| `game.MOUSE_LEFT`   | Left mouse button   |
| `game.MOUSE_RIGHT`  | Right mouse button  |
| `game.MOUSE_MIDDLE` | Middle mouse button |

---

# Constants

The `game` module exposes many keyboard constants.

Examples:

```js
game.KEY_A;
game.KEY_SPACE;
game.KEY_ENTER;
game.KEY_ESCAPE;
game.KEY_LEFT;
game.KEY_RIGHT;
game.KEY_UP;
game.KEY_DOWN;
```

Function keys are also available:

```js
game.KEY_F1;
game.KEY_F2;
game.KEY_F3;
```

As well as modifiers:

```js
game.KEY_LEFT_SHIFT;
game.KEY_RIGHT_SHIFT;
game.KEY_LEFT_CONTROL;
game.KEY_RIGHT_CONTROL;
```

---

# Complete Example

```js

graphics.init(800, 600, "Graphics Demo");
graphics.targetFPS(60);

decl playerX = 100;
decl playerY = 100;
decl speed = 200;

while (!graphics.windowShouldClose()) {
    decl dt = graphics.getDeltaTime();

    if (game.isKeyDown(game.KEY_A)) {
        playerX -= speed * dt;
    }

    if (game.isKeyDown(game.KEY_D)) {
        playerX += speed * dt;
    }

    if (game.isKeyDown(game.KEY_W)) {
        playerY -= speed * dt;
    }

    if (game.isKeyDown(game.KEY_S)) {
        playerY += speed * dt;
    }

    game.pollEvents();

    graphics.beginDraw();

    graphics.clearColor(25, 25, 30);

    graphics.drawRect(
        { 50, 200, 255 },
        playerX,
        playerY,
        64,
        64
    );

    graphics.drawText(
        "Use WASD to move",
        { 255, 255, 255 },
        20,
        20,
        24
    );

    graphics.endDraw();
}

graphics.closeWindow();
```

---
