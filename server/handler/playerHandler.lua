Player = {}

local VorpCore = {}
TriggerEvent("getCore", function(core)
    VorpCore = core
end)

function Player.LoadPlayerData(source)
    while not Items.loaded do -- Wait items are all loaded befor loading any inventory. Could cause issue without it on script restart
        Wait(10)
    end

    local source = tonumber(source)

    Inventory.player[source] = {}
    Inventory.player[source].items = {}
    Inventory.player[source].weapons = {}


    local try = 0
    local User = VorpCore.getUser(source)
    while User == nil do 
        Wait(1000)
    end
    local Character = User.getUsedCharacter
    local charidentifier = Character.charIdentifier
    local encodedInv
    exports.ghmattimysql:execute('SELECT inventory FROM characters WHERE charidentifier=@charidentifier', { ['charidentifier'] = charidentifier}, function(result)    
        encodedInv = result[1].inventory
    end)

    while encodedInv == nil do 
        Wait(1000)
    end

    --[[ local encodedInv = VORP.getUser(source).getUsedCharacter.inventory -- Do not work for some reason ? Same code as C# source 
    while encodedInv == nil do
        try = try + 1
        encodedInv = VORP.getUser(source).getUsedCharacter.inventory -- Do not work for some reason ? Same code as C# source 
        Error.Warning("Player inventory was nil, trying again to load it ... (#"..try..")")
        Wait(1000)
        print(encodedInv)
    end ]]

    local pInv = json.decode(encodedInv)

    for k,v in pairs(pInv) do
        Inventory.AddItem(Inventory.player[source].items, k, tonumber(v))
    end

    Player.RefreshPlayerInvetory(source)
    Error.print("Loaded player "..source)

    -- TriggerEvent("vorp:getCharacter",source,function(user)
        
    --     local pInv = json.decode(user.inventory)
    
    --     for k,v in pairs(pInv) do
    --         Inventory.AddItem(Inventory.player[source].items, k, tonumber(v))
    --     end
    
    --     Player.RefreshPlayerInvetory(source)
    --     Error.print("Loaded player "..source)
    --   end)


end


function Player.RefreshPlayerInvetory(source)
    TriggerClientEvent("vorp_inventory:Refresh", source, Inventory.player[source])
end


RegisterEvent("vorp_inventory:LoadPlayerInventory", function(source)
    Wait(5000)
    Player.LoadPlayerData(source)
end)