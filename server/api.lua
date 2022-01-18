exports('vorp_inventoryApi',function()
    local self = {}
    self.subWeapon = function(source,weaponid) -- TODO
        TriggerEvent("vorpCore:subWeapon",source,tonumber(weaponid))
    end

    self.createWeapon = function(source,weaponName,ammoaux,compaux) -- TODO
        TriggerEvent("vorpCore:registerWeapon",source,tostring(weaponName),ammoaux,compaux)
    end

    self.giveWeapon = function(source,weaponid,target)  -- TODO
        TriggerEvent("vorpCore:giveWeapon",source,weaponid,target)
    end

    self.addItem = function(source,itemName,cuantity)
        Inventory.AddItem(Inventory.player[source].items, itemName, cuantity)
    end

    self.subItem = function(source,itemName,cuantity)
        Inventory.RemoveItem(Inventory.player[source].items, itemName, cuantity)
    end

    self.getItemCount = function(source,item)
        if Inventory.player[source].items[item] == nil then
            return 0
        else
            return Inventory.player[source].items[item].count
        end
    end

    self.addBullets = function(source,weaponId,type,cuantity)  -- TODO
        TriggerEvent("vorpCoreClient:addBullets",source,weaponId,type,cuantity)
    end

    self.getWeaponBullets = function(source,weaponId)  -- TODO
        local bull
        TriggerEvent("vorpCore:getWeaponBullets",source,function(bullets)
            bull = bullets
        end,weaponId)
        return bull
    end
    
    self.getWeaponComponents = function(source,weaponId)  -- TODO
        local comp
        TriggerEvent("vorpCore:getWeaponComponents",source,function(components)
            comp = components
        end,weaponId) 
        return comp
    end

    self.getUserWeapons = function(source) 
        return Inventory.player[source].weapons
    end

    self.canCarryItems = function(source, amount) -- Need some explaination 
        -- local can
        -- TriggerEvent("vorpCore:canCarryItems",source,amount,function(data)
        --     can = data
        -- end)
        -- return can
        return false
    end

    self.canCarryItem = function(source, item, amount) 
        local itemData = Items.list[item]
        local pInv = Inventory.player[source].items

        if pInv[item] == nil then
            if amount > itemData.limit then
                return false
            else
                return true 
            end
        else
            if pInv[item].count + amount > itemData.limit then
                return false
            else
                return true
            end
        end
    end

    self.getUserWeapon = function(source,weaponId) -- TODO
        return {}
    end
        
    self.RegisterUsableItem = function(itemName,cb)
        Items.RegisterItemUsage(itemName, cb)
    end

    self.getUserInventory = function(source)
        return Inventory.player[source].items
    end

    self.CloseInv = function(source)
        TriggerClientEvent("vorp_inventory:CloseInv",source)
    end
    
    return self
end)
