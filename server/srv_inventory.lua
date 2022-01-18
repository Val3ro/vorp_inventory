Inventory = {}
Inventory.player = {} -- Index should be player id

function Inventory.GetCount(inventory) -- Inventory should be an inventory like items or weapons, but not a table with both
    local count = 0
    for k,v in pairs(inventory) do
        count = count + v.count
    end
    return count
end

function Inventory.GetItemCount(inventory, item)
    if inventory[item] == nil then
        return 0
    else
        return inventory[item].count
    end
end

function Inventory.DoesItemExist(inventory, name)
    return inventory[name] ~= nil
end

function Inventory.AddItem(inventory, name, count)
    if Items.DoesItemExist(name) then
        local pInv = inventory
        if Inventory.GetCount(pInv) + count <= Config.MaxItemsInInventory.Items then
            
            if Inventory.DoesItemExist(pInv, name) then -- Exist in inventory, not in item list. Not the same as Items.DoesItemExist(name)
                pInv[name].count = pInv[name].count + count
            else
                local itemData = Items.list[name]
                pInv[name] = {}
                pInv[name].name = name
                pInv[name].label = itemData.label
                pInv[name].type = itemData.type
                pInv[name].count = count
                pInv[name].limit = itemData.limit
                pInv[name].usable = itemData.canUse
                pInv[name].weight = itemData.weight
            end
            return true
        else
            -- Client notification maybe ?
            return false 
        end
    else
        -- Warning
    end
end

function Inventory.RemoveItem(inventory, name, count)
    if Items.DoesItemExist(name) then
        local pInv = inventory
        if Inventory.DoesItemExist(pInv, name) then
            if pInv[name].count - count < 0 then
                -- Warning, duplication or glitch
                return false
            elseif pInv[name].count - count == 0 then
                pInv[name] = nil
                return true
            else
                pInv[name].count = pInv[name].count - count
                return true
            end

        else
            -- Notification ? Player don't have item
            return false
        end
    else
        -- Warning
    end
end



-- @Events

---@param source int 
---@param target int
---@param amount double
RegisterEvent("vorp_inventory:giveMoneyToPlayer", function(source, target, amount)
    local source = tonumber(source) -- Just to be sure
    local target = tonumber(target)

    local pChar = VORP.getUser(source).getUsedCharacter
    local pTarget = VORP.getUser(target).getUsedCharacter

    local pMoney = pChar.money
    
    if amount <= 0 then
        TriggerServerEvent("vorp:Tip", source, "Trying to glitch ? Number < 0 not allowed.")
    elseif pMoney < amount then
        TriggerServerEvent("vorp:Tip", source, "Not enough money") 
    else
        pChar.removeCurrency(0, amount)
        pTarget.addCurrency(0, amount)
        TriggerServerEvent("vorp:Tip", source, "You just give "..amount.."$") 
        TriggerServerEvent("vorp:Tip", target, "You just got "..amount.."$") 
        Player.RefreshPlayerInvetory(source)
        Player.RefreshPlayerInvetory(target)
    end
end)


---@param source int
---@param target int
---@param itemname string
---@param amount int
RegisterEvent("vorpinventory:serverGiveItem", function(source, target, itemname, amount)
    if Items.DoesItemExist(itemname) then
        local source = tonumber(source) -- Just to be sure
        local target = tonumber(target)

        local pInv = Inventory.player[source].items
        local tInv = Inventory.player[source].items -- Target inventory
        local itemData = Items.list[itemname]

        if pInv[itemname] ~= nil then
            if pInv[itemname].count >= amount then  
                if Inventory.GetItemCount(tInv, itemname) + amount <= itemData.limit then
                    Inventory.AddItem(tInv, itemname, amount)
                    Inventory.RemoveItem(pInv, itemname, amount)
                    TriggerServerEvent("vorp:Tip", source, "You just give x"..amount.." "..itemData.label) 
                    TriggerServerEvent("vorp:Tip", target, "You just got x"..amount.." "..itemData.label) 
                    Player.RefreshPlayerInvetory(source)
                    Player.RefreshPlayerInvetory(target)
                else
                    --Inventory full
                    TriggerServerEvent("vorp:Tip", source, "Target inventory is full") 
                end
            end
        end
    else
        -- Item do not exist
    end
end)


RegisterEvent("vorpinventory:getInventory", function(source)
    local items = Inventory.player[source].items

    TriggerClientEvent("vorpInventory:giveInventory", source, items)
end)


RegisterEvent("vorpInventory:giveItemsTable", function(source)
    local items = Inventory.player[source].items

    TriggerClientEvent("vorpInventory:giveInventory", source, items)
end)

RegisterEvent("vorp_inventory:useItem", function(source, itemname)
    Items.UseItem(itemname, source)
end)