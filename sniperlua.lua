sniperlua = {}

-------------------
--- VALIDATIONS ---
-------------------

---
-- Check if the variable is of a certain type.
--
function sniperlua.isType(v, expected)
    --- feature: multi-type checking
    -- The following checks if the expected is a table of values then we check if v is any of these types.
    --
    if type(expected) == 'table' then
        for _,val in ipairs(expected) do
            if type(v) == val then
                return true
            end
        end
    end

    -- default: return explicit type
    return type(v) == expected
end

---
-- Return true if variable exists and has a not nil value
--
function sniperlua.exists(v)
    return v ~= nil
end

function sniperlua.deepGet(parent, blob)
    if not sniperlua.isType(parent, 'table') then
        return nil
    end
    if not sniperlua.exists(blob) then
        return nil
    end
    if not sniperlua.isType(blob, 'string') then
        return nil
    end

    -- parent is a table and blob is a string
    if sniperlua.hasPeriod(blob) then
        -- I am a multilevel check
        local levels = sniperlua.split(blob)
        local item = parent
        for _,v in ipairs(levels) do
            item = item[v]

            if item == nil then
                return nil
            end
        end

        return item
    else
        -- I am a single level check
        return parent[blob] or nil
    end
end

-- Expects parent to be a table
function sniperlua.deepExists(parent, blob)
    local res = sniperlua.deepGet(parent, blob)
    if not res then
        return false
    end
    if (res == false) then
        return false
    end

    return true
end

----------------------
--- STRING METHODS ---
----------------------

---
-- Check if the given string contains a period
--
function sniperlua.hasPeriod(str)
  local plain = true
  local start = 1
  local result = string.find(str, ".", start, plain)
  return result ~= nil
end

---
-- Split a string by delimeter.
--
function sniperlua.split(str, delim)
    -- early returns
    if not delim then delim = "." end
    if not sniperlua.hasPeriod(str) then
        return str
    end

    -- logic
    local response = {}

    local wordnum = 1
    local words = {}
    local word = ''

    for char in string.gmatch( str, "." ) do
        -- if we hit the delim start a new word
        if (char == delim) then
            wordnum = wordnum + 1
            table.insert(words, word)
            word = ''
        else
            word = word .. char
        end
    end

    if word ~= '' then
        table.insert(words, word)
    end

    return words
end

---
-- Check if a word is numeric
--
function sniperlua.wordIsNumeric(word)
    local numeric = true

    -- is it an integer type
    if type(word) == 'number' then
        return true
    end

    if not tonumber(word) then
        return false
    end

    return numeric
end

---------------------
--- ALIAS METHODS ---
---------------------

function sniperlua.notNil(v)
    return sniperlua.exists(v)
end

