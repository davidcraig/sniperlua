-- EXISTS
local function testExists()
    local m = sniperlua.exists
    local thisVarExists = false
    local thisExistsAndIsNil = nil

    logassert(
        m(x),
        false,
        'correctly returns false when x is not defined'
    ) -- Testing with a variable that does not exist

    logassert(
        m(thisVarExists),
        true,
        'correctly returns false when x is not defined'
    ) -- Testing with a variable that is false

    logassert(
        m(thisExistsAndIsNil),
        false,
        'var = nil should also return false'
    ) -- Sadly we cant determine between not set and set to nil
end

-- DEEP EXISTS (eg var.prop or var[prop])
local function testDeepExists()
    local m = sniperlua.deepExists
    local testTable = {}
    testTable.iExist = 1
    testTable.deeper = {}
    testTable.deeper['b'] = 2

    logassert(
        m(nil),
        false,
        'returns false when nil is passed'
    )

    logassert(
        m(testTable, nil),
        false,
        'returns false when y is not defined'
    )

    logassert(
        m(testTable, 'b'),
        false,
        'returns false when table property does not exist (1 level deep)'
    )

    logassert(
        m(testTable, 'iExist'),
        true,
        'returns true when table property does exist (1 level deep)'
    )

    logassert(
        m(testTable, 'deeper.d'),
        false,
        'returns false when table property does not exist (2 levels deep)'
    )

    logassert(
        m(testTable, 'deeper.b'),
        true,
        'returns true when table property does exist (1 level deep)'
    )
end

-- DEEP GET (eg var.prop or var[prop])
local function testDeepGet()
    local m = sniperlua.deepGet
    local testTable = {}
    testTable.iExist = 1
    testTable.deeper = {}
    testTable.deeper['b'] = 2

    logassert(
        m(nil),
        nil,
        'returns nil when nil is passed'
    )

    logassert(
        m(testTable, nil),
        nil,
        'returns nil when y is not defined'
    )

    logassert(
        m(testTable, 'b'),
        nil,
        'returns nil when table property does not exist (1 level deep)'
    )

    logassert(
        m(testTable, 'iExist'),
        1,
        'returns a the element from a table (1 level deep)'
    )

    logassert(
        m(testTable, 'deeper.d'),
        nil,
        'returns nil when table property does not exist (2 levels deep)'
    )

    logassert(
        m(testTable, 'deeper.b'),
        2,
        'returns the number 2 from a 2 level deep table get'
    )
end

local function testIsType()
    local thisIsAString = 'ThisIsAString'
    local thisIsATable = {}
    thisIsATable.property = 1
    thisIsATable[2] = 2

    local m = sniperlua.isType

    logassert(
        m(thisIsAString, 'string'),
        true,
        'A string is correctly detected'
    )

    logassert(
        m(thisIsATable, 'string'),
        false,
        'A table is not a string!'
    )

    logassert(
        m(thisIsATable, 'table'),
        true,
        'A table is a table'
    )

    logassert(
        m(nil, 'table'),
        false,
        'Nil is not a table'
    )

    logassert(
        m({}, {'table', 'string'}),
        true,
        'We can also check is one of multiple types, eg a table or a string'
    )
end

print('')
print('== Running validations suite ==')

local function suite()
    testExists()
    testDeepExists()
    testDeepGet()
    testIsType()
end

-- Run the tests

suite()
printOutput()
