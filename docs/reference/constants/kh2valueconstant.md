# Class: `KH2ValueConstant`

A base class for all other classes of constants. Provides some basic properties and functions
to the metatable extended by subclasses. KH2ValueConstant should not be instantiated directly,
with the exception of once per subclass, at its declaration.

## `KH2ValueConstant:new([options])`

- `options` {table}
  - `id` {integer} ID of constant (from game).
  - `name` {string} English name of constant.
- Returns: {KH2ValueConstant} Newly-instantiated KH2ValueConstant

Base class consisting of ID value and human-readable name of in-game constant.

All instances contain, at minimum, the following properties:

- `id` {integer} ID of constant (from game).
- `name` {string} English name of constant.
- `__name` {string} Class identifier (always `'KH2ValueConstant'`, overridden by child classes).

## Metatable functions

### `KH2ValueConstant.__concat(a, b)`

- `a` {any|KH2ValueConstant} Left side of concat operator
- `b` {any|KH2ValueConstant} Right side of concat operator
- Returns: {string} Concatenated string

Concatenate two values, at least one of which is this KH2ValueConstant.
This is a special metatable operator function, called whenever the concatenation operator (`..`)
is used on a KH2ValueConstant. It simply calls the built-in `tostring()` method on each parameter,
concatenates them, and returns the result.

Example:

```lua
-- World is a subclass of KH2ValueConstant, and inherits the __concat() function
local my_constant = World:new{id = 1, name = 'World of Darkness'}
Log('The world name is ' .. my_constant) -- The world name is World of Darkness
```

### `KH2ValueConstant.__tostring()`

Alias of [`KH2ValueConstant.tostring()`](#kh2valueconstanttostring).
This is a special metatable operator function called by some of Lua's built-in functions,
such as `tostring()` and `print()`.

## `KH2ValueConstant:tostring()`

- Returns: {string} Human-readable name of constant

Provide a string representation of this constant (`name`).

## `KH2ValueConstant:super_mt()`

- Returns: {KH2ValueConstant} Copy of metatable for this class

Return copy of metatable for use in child classes. This function somewhat mimics the behavior
of `super()` in class constructors of proper OOP languages.
