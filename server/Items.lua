Items = {}
Items.list = {}
Items.loaded = false


function Items.RegisterNewItem(name, label, type, model, limit, weight, canUse, canRemove, dropOnDeath)
    if Items.list[name] == nil then
        Items.list[name] = {}
        Items.list[name].name = name
        Items.list[name].label = label
        Items.list[name].type = type
        Items.list[name].model = model
        Items.list[name].limit = limit
        Items.list[name].weight = weight
        Items.list[name].canUse = canUse
        Items.list[name].canRemove = canRemove
        Items.list[name].dropOnDeath = dropOnDeath
        Error.print("Loaded new item ("..name..")")
    else
        Error.Warning("Trying to register an item already registered! ("..name..")")
    end
end

function Items.DoesItemExist(name)
    while Items.loaded == false do
        Error.Warning("Waiting item loads for ("..tostring(name)..")")
        Wait(100)
    end
    if Items.list[name] ~= nil then
        return true
    else
        Error.Warning("Trying to use an item who do not exist ("..tostring(name)..")")
        return false
    end
end


function Items.RegisterItemUsage(name, usage)
    Citizen.CreateThread(function()
        if Items.DoesItemExist(name) then

            Items.list[name].canUse = true
            Items.list[name].usage = usage
            Error.print("Item usage registered ("..tostring(name)..")")
        else
            Error.Warning("Trying to register usage on item "..tostring(name).." who do not exist")
        end 
    end)
end



function Items.UseItem(name, source)
    if Items.DoesItemExist(name) then
        if Items.list[name].canUse then
            local args = {}
            args["source"] = source
            args["item"] = Items.list[name]
            
            Items.list[name].usage(args) -- Retro compatible with old callback system, see here http://docs.vorpcore.com:3000/vorp-inventory
        else
            Error.Warning("Trying to use an item who do not have any usage ("..tostring(name)..")")
        end
    else
        Error.Warning("Trying to use an item who do not exist ("..tostring(name)..")")
    end
end


-- @Loader

Citizen.CreateThread(function()
    exports.ghmattimysql:execute("SELECT * FROM items", {}, function(result)
        for k,v in pairs(result) do
            Items.RegisterNewItem(v.item, v.label, v.type, "none", v.limit, 0, false, v.can_remove, false)
        end
        Items.loaded = true
    end) 
end)