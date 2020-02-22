# API

- General Helpers
  - [exists](#exists)
  - [isType](#isType)
- Table Methods
  - [deepExists](#deepExists)
  - [deepGet](#deepGet)
- String Methods
  - [hasPeriod](#hasPeriod)
  - [split](#split)


## General Helpers

### exists

> Check if a variable exists

```lua
sniperlua.exists(var)
```

```lua
sniperlua.exists(undefined_variable)
    > false

local x = nil
sniperlua.exists(x)
    > false (nil is the same as undefined)

local y = false
sniperlua.exists(y)
    > true
```

### isType 

> check if a variable is of a given type(s)

```lua
sniperlua.isType(var, type{s})
```

```lua
local str = 'this is a string'

sniperlua.isType(str, 'string')
    > true

(we can also check if it is any type from a list of types, eg.)

sniperlua.isType(str, { 'string', 'table' })
    > true
```




## Table Methods

### deepExists

> Check if a nested property exists

```lua
sniperlua.deepExists(var, blob)
```

```lua
local deepObject = { x: true, y: '123', z: { a: 'foo', b: nil } }

sniperlua.deepExists(deepObject, 'x')
    > true

sniperlua.deepExists(deepObject, 'z.a')
    > true

sniperlua.deepExists(deepObject, 'z.d')
    > false
```

### deepGet

> Retrieve value of deeply nested property

```lua
sniperlua.deepGet(var, blob)
```

```lua
local deepObject = { x: true, y: '123', z: { a: 'foo', b: nil } }

sniperlua.deepGet(deepObject, 'x')
    > true

sniperlua.deepGet(deepObject, 'y')
    > '123'

sniperlua.deepGet(deepObject, 'z.a')
    > 'foo'
```

## String Methods

### hasPeriod

> Check if a given string contains a '.' character

```lua
sniperlua.hasPeriod(str)
```

```lua
local str = 'this has no period'
local str2 = 'this.has.periods.'

sniperlua.hasPeriod(str)
    > false

sniperlua.hasPeriod(str2)
    > true
```

### split 

> split a string into a table, delimiter is optional (defaults to '.')

```lua
sniperlua.split(str[, delimeter])
```

```lua
local str = 'ihavenothingtosplitby'
local str2 = 'i.have.periods'
local str3 = 'i|am|delimited|by|pipe'

sniperlua.split(str)
    > false

sniperlua.split(str2)
    > { 'i', 'have', 'periods' }

sniperlua.split(str3)
    > { 'i', 'am', 'delimited', 'by', 'pipe' }
```

### wordIsNumeric

> Checks if a given word is purely numeric

```lua
sniperlua.wordIsNumeric(word)
```


```lua
sniperlua.wordIsNumeric('123')
    > true

sniperlua.wordIsNumeric('i123')
    > false
```