local function stringSplit()
    local m = sniperlua.split
    local dontsplit = 'thisshouldnotsplit'
    local str1 = 'ihave.onedot'
    local str2 = 'ihave.two.dots'

    logassert(
        m(dontsplit),
        dontsplit,
        'it should return string as is'
    ) -- If parent item is nil we should return false

    local result = m(str1)
    assert( result[1] == 'ihave', 'correctly returns array with 2 elements for first string' )
    assert( result[2] == 'onedot', 'correctly returns array with 2 elements for first string' )
end

local function wordIsNumeric()
    local m = sniperlua.wordIsNumeric

    local word1 = '1'
    local word2 = '32dags'
    local word3 = 'ihave.two.dots'
    local word4 = 32

    logassert(
        m(word1),
        true,
        'word 1 is numeric'
    ) -- word 1 should be numeric

    logassert(
        m(word2),
        false,
        'word 2 is not numeric'
    ) -- word 2 should not be numeric

    logassert(
        m(word3),
        false,
        'word 3 is not numeric'
    ) -- word 2 should not be numeric

    logassert(
        m(word4),
        true,
        'word 4 is numeric'
    ) -- word 2 should not be numeric
end

print('')
print('== Running string suite ==')

stringSplit()
wordIsNumeric()

printOutput()
