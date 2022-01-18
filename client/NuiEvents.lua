Nui = {}
Nui.gg = {} -- Why is this called gg ? This is how it's called in VORP Inventory source code
Nui.items = {}
local IsInInventory = false

function Nui.LoadInv()
    Nui.gg = {}
    Nui.items = {}

    for k,v in pairs(pInv.items) do
        local item = {}
        item["count"] = v.count
        item["limit"] = v.limit
        item["label"] = v.label
        item["name"] = v.name
        item["type"] = v.type
        item["usable"] = v.usable
        item["canRemove"] = true
        table.insert(Nui.gg, item)
    end

    -- TODO: Weapons

    Nui.items["action"] = "setItems"
    Nui.items["itemList"] = Nui.gg
    local json = json.encode(Nui.items)
    SendNuiMessage(json)
end


function Nui.OpenInv()
    IsInInventory = true
    SetNuiFocus(true, true)
    SendNuiMessage("{\"action\": \"display\", \"type\": \"main\"}")
    Nui.LoadInv()
end

function Nui.CloseInv()
    IsInInventory = false
    SetNuiFocus(false, false)
    SendNuiMessage("{\"action\": \"hide\"}")
end

function Nui.UseItem(data)

    if data["type"] == "item_standard" then
        TriggerServerEvent("vorp_inventory:useItem", data["item"])
    elseif data["type"] == "item_weapon" then
        -- Weapon stuff, todo later
    end
end

function Nui.GetNearPlayers(obj)
    local players = GetActivePlayers()
    local elements  = {}
    local nuireturn = {}
    local pPed = PlayerPedId()
    local pPos = GetEntityCoords(pPed)
    local anyPlayers = false
    
    for k,v in pairs(players) do
        local dst = #(GetEntityCoords(GetPlayerPed(v)) - pPos)
        if dst <= 5 then
            anyPlayers = true
            table.insert(elements , {
                ["label"] = GetPlayerName(v),
                ["player"] = GetPlayerServerId(v)
            })
        end
    end

    local item = {}

    for k,v in pairs(obj) do
        item[k] = v
    end

    if item["id"] == nil then
        item["id"] = 0
    end

    if item["count"] == nil then
        item["count"] = 1
    end

    if item["hash"] == nil then
        item["hash"] = 1
    end


    nuireturn["action"] = "nearPlayers"
    nuireturn["foundAny"] = anyPlayers
    nuireturn["players"] = elements
    nuireturn["item"] = item["item"]
    nuireturn["hash"] = item["hash"]
    nuireturn["count"] = item["count"]
    nuireturn["id"] = item["id"]
    nuireturn["type"] = item["type"]
    nuireturn["what"] = item["what"]

    local nuireturn = json.encode(nuireturn)
    SendNuiMessage(nuireturn)
end

-- HorseModule
function Nui.OpenHorseInventory(horseName)
    SetNuiFocus(true, true)
    SendNuiMessage("{\"action\": \"display\", \"type\": \"horse\", \"title\": \""+ horseName + "\"}")
    TriggerEvent("vorp_stables:setClosedInv", true)
    IsInInventory = true
end

function Nui.ReloadHorseInventory(horseInventory)
    SendNuiMessage(horseInventory)
    Wait(500)
    Nui.LoadInv()
end

function Nui.NUITakeFromHorse(data)
    TriggerServerEvent("vorp_stables:TakeFromHorse", json.decode(data));
end

function Nui.NUIMoveToHorse(data)
    TriggerServerEvent("vorp_stables:MoveToHorse", json.decode(data));
end

RegisterNUICallback('TakeFromHorse', function(data, cb)
    Nui.NUITakeFromHorse(data)
end)
RegisterNUICallback('MoveToHorse', function(data, cb)
    Nui.NUIMoveToHorse(data)
end)

RegisterEvent("vorp_inventory:OpenHorseInventory", function(horseName)
    Nui.OpenHorseInventory(horseName)
end)

RegisterEvent("vorp_inventory:ReloadHorseInventory", function(horseInventory)
    Nui.ReloadHorseInventory(horseInventory)
end)
-- End horse module



-- Cart module
function Nui.OpenCartInventory(name)
    SetNuiFocus(true, true)
    SendNuiMessage("{\"action\": \"display\", \"type\": \"cart\", \"title\": \"" + cartName + "\"}")
    TriggerEvent("vorp_stables:setClosedInv", true)
    IsInInventory = true
end

function Nui.ReloadCartInventory(cartInventory)
    SendNuiMessage(cartInventory)
    Wait(500)
    Nui.LoadInv()
end

function Nui.NUIMoveToCart(data)
    TriggerServerEvent("vorp_stables:MoveToCart", json.decode(data));
end

function Nui.NUITakeFromCart(data)
    TriggerServerEvent("vorp_stables:TakeFromCart", json.decode(data));
end

RegisterNUICallback('MoveToCart', function(data, cb)
    Nui.NUIMoveToCart(data)
end)

RegisterNUICallback('TakeFromCart', function(data, cb)
    Nui.NUITakeFromCart(data)
end)

RegisterEvent("vorp_inventory:OpenCartInventory", function(cart)
    Nui.OpenCartInventory(cart)
end)

RegisterEvent("vorp_inventory:ReloadCartInventory", function(inventory)
    Nui.ReloadCartInventory(inventory)
end)
-- end cart module


-- House module
function Nui.OpenHouseInventory(houseName, houseId)
    SetNuiFocus(true, true)
    SendNuiMessage("{\"action\": \"display\", \"type\": \"house\", \"title\": \"" + houseName + "\", \"houseId\": " + houseId.ToString() + "}")
    TriggerEvent("vorp_stables:setClosedInv", true)
    IsInInventory = true
end

function Nui.ReloadHouseInventory(cartInventory)
    SendNuiMessage(cartInventory)
    Wait(500)
    Nui.LoadInv()
end

function Nui.NUIMoveToHouse(data)
    TriggerServerEvent("vorp_housing:MoveToHouse", json.decode(data));
end

function Nui.NUITakeFromHouse(data)
    TriggerServerEvent("vorp_housing:TakeFromHouse", json.decode(data));
end

RegisterNUICallback('MoveToHouse', function(data, cb)
    Nui.NUIMoveToHouse(data)
end)

RegisterNUICallback('TakeFromHouse', function(data, cb)
    Nui.NUITakeFromHouse(data)
end)

RegisterEvent("vorp_inventory:OpenHouseInventory", function(houseName, houseId)
    Nui.OpenHouseInventory(houseName, houseId)
end)

RegisterEvent("vorp_inventory:ReloadHouseInventory", function(inventory)
    Nui.ReloadHouseInventory(inventory)
end)



-- end house module

RegisterNUICallback('GetNearPlayers', function(data, cb)
    Nui.GetNearPlayers(data)
end)

RegisterNUICallback('UseItem', function(data, cb)
    Nui.UseItem(data)
end)

RegisterNUICallback('NUIFocusOff', function(data, cb)
    Nui.CloseInv()
    TriggerEvent("vorp_stables:setClosedInv", false)
end)

RegisterNUICallback('sound', function(data, cb)
    PlaySoundFrontend("BACK", "RDRO_Character_Creator_Sounds", true, 0)
end)


-- Main loop
Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(0, Config.OpenKey) and IsInputDisabled(0) then
            if IsInInventory then
                Nui.CloseInv()
            else
                Nui.OpenInv()
            end
        end
        Wait(1)
    end
end)