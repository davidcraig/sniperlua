# API

- General Helpers
  - [exists](#exists)
  - [isType](#isType)
- Table Methods
- String Methods
  - [hasPeriod](#hasPeriod)
  - [split](#split)


## General Helpers

### exists (variable)

> check if a variable exists

```
snipertips.exists(undefined_variable)
    > false

local x = nil
snipertips.exists(x)
    > false (nil is the same as undefined)

local y = false
snipertips.exists(y)
    > true
```

### isType (var, type{s})

> check if a variable is of a given type(s)

```
local str = 'this is a string'

snipertips.isType(str, 'string')
    > true

(we can also check if it is any type from a list of types, eg.)

snipertips.isType(str, { 'string', 'table' })
    > true
```




## Table Methods

### deepExists (var, blob)

> Check if a nested property exists

```
local deepObject = { x: true, y: '123', z: { a: 'foo', b: nil } }

sniperlua.deepExists(deepObject, 'x')
    > true

sniperlua.deepExists(deepObject, 'z.a')
    > true

sniperlua.deepExists(deepObject, 'z.d')
    > false
```

### deepGet (var, blob)

> Retrieve value of deeply nested property

```
local deepObject = { x: true, y: '123', z: { a: 'foo', b: nil } }

sniperlua.deepGet(deepObject, 'x')
    > true

sniperlua.deepGet(deepObject, 'y')
    > '123'

sniperlua.deepGet(deepObject, 'z.a')
    > 'foo'
```

## String Methods

### hasPeriod (str)

> Check if a given string contains a '.' character

```
local str = 'this has no period'
local str2 = 'this.has.periods.'

sniperlua.hasPeriod(str)
    > false

sniperlua.hasPeriod(str2)
    > true
```

### split (str, delimeter = '.')

> split a string into a table, delimiter is optional (defaults to '.')

```
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

### wordIsNumeric (word)

> Checks if a given word is purely numeric

```
sniperlua.wordIsNumeric('123')
    > true

sniperlua.wordIsNumeric('i123')
    > false
```