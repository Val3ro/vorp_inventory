Error = {}


function Error.Warning(text)
    print("^3WARNING: ^7".. tostring(text) .."^7")
end

function Error.error(text)
    print("^1ERROR: ^7".. tostring(text) .."^7")
end

function Error.print(text)
    print("^2Inventory: ^7"..tostring(text))
end