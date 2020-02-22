pass = 0
fail = 0

-- Test helper, logs results of asserts
function logassert(stmt, expect, message)
    local result = assert(stmt == expect, message)
    if (result) then
        pass = pass + 1
        io.write('.')
    else
        fail = fail + 1
        io.write('F')
    end
end
