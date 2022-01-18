InventoryService = {}
ItemPickUps = {}
MoneyPickUps = {}
Core = {}

TriggerEvent("getCore", function (core)
	Core = core
end)

InventoryService.dropMoney = function (source, amount) 
	local _source = source
	local userCharacter = Core.getUser(_source).getUsedCharacter
	local userMoney = userCharacter.money	
	
	if amount <= 0 then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang["TryExploits"], 3000)
	elseif sourceMoney < amount then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang["NotEnoughMoney"], 3000)
	else
		userCharacter.removeCurrency(0, amount)
		TriggerClientEvent("vorpInventory:createMoneyPickup", _source, amount)
	end
end

InventoryService.dropAllMoney = function (source) 
	local _source = source
	local userCharacter = Core.getUser(_source).getUsedCharacter
	local userMoney = userCharacter.money

	if userMoney > 0 then
		userCharacter.removeCurrency(0, userMoney)
		TriggerClientEvent("vorp:createMoneyPickup", _source, sourceMoney)
	end
end

InventoryService.giveMoneyToPlayer = function (source, target, amount) 
	local _source = source
	local _target = target

	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local targetCharacter = Core.getUser(_target).getUsedCharacter

	local sourceMoney = sourceCharacter.money
	
	if amount <= 0 then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang["TryExploits"], 3000)
		Wait(3000)
		TriggerClientEvent("vorp_inventory:ProcessingReady")
	elseif sourceMoney < amount then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang["NotEnoughMoney"], 3000)
		Wait(3000)
		TriggerClientEvent("vorp_inventory:ProcessingReady")
	else
		sourceCharacter.removeCurrency(0, amount)
		targetCharacter.addCurrency(0, amount)
		
		TriggerClientEvent("vorp:TipRight", _source, string.format(Config.Lang["YouPaid"], amount, targetCharacter.firstname .. " " .. targetCharacter.lastname), 3000)
		TriggerClientEvent("vorp:TipRight", _target, string.format(Config.Lang["YouReceived"], amount, sourceCharacter.firstname .. " " .. sourceCharacter.lastname), 3000)
		Wait(3000)
		TriggerClientEvent("vorp_inventory:ProcessingReady")
	end
end

InventoryService.setWeaponBullets = function (source, weaponId, type, amount) 
	if next(UsersWeapons[weaponId]) ~= nil then
		UsersWeapons[weaponId].setAmmo(type, amount)
	end
end

InventoryService.SaveInventoryItemsSupport = function (source) 
	local _source = source
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local indentifier = sourceCharacter.identifier
	local charId = sourceCharacter.charIdentifier
	local characterInventory = {}

	if next(UsersInventories[identifier]) ~= nil then
		for _, item in pairs(UsersInventories[identifier]) do
			characterInventory[_] = item
		end

		if next(characterInventory) ~= nil then
			exports.ghmattimysql:execute('UPDATE characters SET inventory = @inventory WHERE identifier = @identifier AND charidentifier = @charid', { 
					['inventory'] = json.encode(characterInventory), 
					['identifier'] = identifier,
					['charidentifier'] = charId
				}, function() 
			end)
		end
	end
end

InventoryService.usedWeapon = function (source, id, _used, _used2) 
	local used = 0
	local used2 = 0

	if _used then used = 1 end
	if _used2 then used2 = 1 end

	exports.ghmattimysql:execute('UPDATE loadout SET used = @used, used2 = @used2 WHERE id = @id', { 
			['used'] = used, 
			['used2'] = used2,
			['id'] = id
		}, function() 
	end)
end

InventoryService.subItem = function (source, name, amount) 
	local _source = source 
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local identifier = sourceCharacter.identifier

	if next(UsersInventories[identifier]) ~= nil then
		if next(UsersInventories[identifier][name]) ~= nil then
			if amount <= UsersInventories[identifier][name].getCount() then
				UsersInventories[identifier][name].quitCount(amount)
			end
			
			if UsersInventories[identifier][name].getCount() == 0 then
				UsersInventories[identifier][name] = nil
			end
			InventoryService.SaveInventoryItemsSupport(_source)
		end
	end
end

InventoryService.addItem = function (source, name, amount) 
	local _source = source
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local identifier = sourceCharacter.identifier

	if next(UsersInventories[identifier]) ~= nil then
		if next(UsersInventories[identifier][name]) ~= nil then
			if amount > 0 then
				UsersInventories[identifier][name].addCount(amount)
				InventoryService.SaveInventoryItemsSupport(_source)
			end
		else
			if next(svItems[name]) ~= nil then
				UsersInventories[identifier][name] = Item:New({
					count = amount,
					limit = svItems[name].getLimit(),
					label = svItems[name].getLabel(),
					name = name,
					type = "item_inventory",
					canUse = svItems[name].getCanUse(),
					canRemove = svItems[name].getCanRemove() 
				})
				InventoryService.SaveInventoryItemsSupport(_source)
			end
		end
	end
end

InventoryService.addWeapon = function (source, weaponId) 
	local _source = source
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local identifier = sourceCharacter.identifier
	local charId = sourceCharacter.charIdentifier
	
	if next(UsersWeapons[weaponId]) ~= nil then
		UsersWeapons[weaponId].setPropietary(identifier)
		exports.ghmattimysql:execute('UPDATE loadout SET identifier = @identifier, charidentifier = @charid WHERE id = @id', { 
			['identifier'] = identifier, 
			['charid'] = used2,
			['id'] = weaponId
		}, function() 
		end)
	end
end

InventoryService.subWeapon = function (source, weaponId) 
	local _source = source 
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local identifier = sourceCharacter.identifier
	local charId = sourceCharacter.charIdentifier
	
	if next(UsersWeapons[weaponId]) ~= nil then	
		UsersWeapons[weaponId].setPropietary('')
		
		exports.ghmattimysql:execute('UPDATE loadout SET identifier = @identifier, charidentifier = @charid WHERE id = @id', { 
			['identifier'] = UsersWeapons[weaponId].getPropietary(),
			['charid'] = charidentifier,
			['id'] = weaponId
		}, function() end)
	end
end

InventoryService.onPickup = function (source, obj) 
	local _source = source 
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local identifier = sourceCharacter.identifier
	local charId = sourceCharacter.charIdentifier

	if next(ItemPickUps[obj]) ~= nil then
		local name = ItemPickUps[obj].name
		local amount = ItemPickUps[obj].amount

		if ItemPickUps[obj].weaponid == 1 then

			if next(UsersInventories[identifier]) ~= nil then

				if svItems[name].getLimit() ~= -1 then
				
					if next(UsersInventories[identifier][name]) ~= nil then
						local sourceItemCount = UsersInventories[identifier][name].getCount()
						local totalAmount = amount = sourceItemCount

						if svItems[name].getLimit() < totalAmount then
							TriggerClientEvent(player, "vorp:TipRight", Config.Lang["fullInventory"], 2000)
							return
						end
					end
				end

				if Config.MaxItems ~= 0 then
					local sourceInventoryItemCount = InventoryAPI.getUserTotalCount(identifier)
					sourceInventoryItemCount = sourceInventoryItemCount + amount 

					if sourceInventoryItemCount > Config.MaxItems then
						TriggerClientEvent("vorp:TipRight", _source, Config.Lang[fullInventory], 2000)
						return
					end
				end

				InventoryService.addItem(_source, name, amount)

				TriggerClientEvent("vorpInventory:sharePickUpClient", -1, name, ItemPickUps[obj].obj, amount, ItemPickUps[obj].coords, 2, ItemPickUps[obj].weaponId)

				TriggerClientEvent("vorpInventory:removePickUpClient", -1, ItemPickUps[obj].obj)

				TriggerClientEvent("vorpInventory:receiveItem", _source, name, amount)

				TriggerClientEvent("vorpInventory:playerAnim", _source, obj)

				ItemPickUps[obj] = nil
			end
		else
			if Config.MaxWeapons ~= 0 then
				local sourceInventoryWeaponCount = InventoryAPI.getUserTotalCountWeapons(identifier, charId)
				sourceInventoryWeaponCount = sourceInventoryWeaponCount + 1

				if sourceInventoryWeaponCount <= Config.MaxWeapons then
					local weaponId = ItemPickUps[obj].weaponId
					local weaponObj = ItemPickUps[obj].obj
					InventoryService.addWeapon(_source, weaponId)

					TriggerEvent("syn_weapons:onpickup", weaponId)
					TriggerClientEvent("vorpInventory:sharePickupClient", name, obj)
					TriggerClientEvent("vorpInventory:receiveWeapon", _source, weaponId, 
					UsersWeapons[weaponId].getPropietary(), UsersWeapons[weaponId].getName(), UsersWeapons[weaponId].getAllAmmo())
					TriggerClientEvent("vorpInventory:playerAnim", obj)
					ItemPickUps[obj] = nil
				end
			end
		end
	end
end

InventoryService.onPickupMoney = function (source, obj) 
	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	if next(MoneyPickUps[obj]) ~= nil then
		local moneyObj = MoneyPickUps[obj].obj
		local moneyAmount = MoneyPickUps[obj].amount
		local moneyCoords = MoneyPickUps[obj].coords

		TriggerClientEvent("vorpInventory:shareMoneyPickupClient", _source, moneyObj, moneyAmount, moneyCoords, 2)
		TriggerClientEvent("vorpInventory:removePickUpClient", moneyObj)
		TriggerClientEvent("vorpInventory:playerAnim", moneyObj)
		TriggerEvent("vorp:addMoney", source, 0, moneyAmount)
		MoneyPickUps[obj] = nil
	end
end

InventoryService.sharePickupServer = function (name, obj, amount, position, weaponId) 
	TriggerClientEvent("vorpInventory:sharePickupClient", name, obj, amount, position, 1, weaponId)

	ItemPickUps[obj] = {
		name = name,
		obj = obj,
		amount = amount,
		weaponid = weaponId,
		inRange = false,
		coords = position
	}
end

InventoryService.shareMoneyPickupServer = function (obj, amount, position) 
	TriggerClientEvent("vorpInventory:shareMoneyPickupClient", obj, amount, position, 1)
	MoneyPickUps[obj] = {
		name = "Dollars",
		obj = obj,
		amount = amount,
		inRange = false,
		coords = position
	}
end


InventoryService.DropWeapon = function (source, weaponId) 
	local _source = source
	InventoryService.subWeapon(_source, weaponId)
	TriggerClientEvent("vorpInventory:createPickup", UsersWeapons[weaponId].getName(), 1, weaponId)
end

InventoryService.DropItem = function (source, itemName, amount) end
	local _source = source 
	InventoryService.subItem(_source, itemName, amount)
	TriggerClientEvent("vorpInventory:createPickup", itemName, amount, 1)
end

InventoryService.GiveWeapon = function (source, weaponId, target) 
	local _source = source
	local _target = target

	if next(UsersWeapons[weaponId]) ~= nil then
		InventoryService.subWeapon(_source, weaponId)
		InventoryService.addWeapon(_target, weaponId)

		local propietary = UsersWeapons[weaponId].getPropietary()
		local name = UsersWeapons[weaponId].getName()
		local allAmmo = UsersWeapons[weaponId].getAllAmmo()

		TriggerClientEvent("vorpInventory:receiveWeapon", _target, weaponId, propietary, name, allAmmo)
	end
end

InventoryService.GiveItem = function (source, itemName, amount, target) 
	local give = true
	local _source = source
	local _target = target

	local sourceIdentifier = GetPlayerIdentifiers(_source)[1]
	local targetIdentifier = GetPlayerIdentifiers(_target)[1]

	if next(UsersInventories[sourceIdentifier]) == nil or next(UsersInventories[targetIdentifier]) == nil or next(UsersInventories[sourceIdentifier][itemName]) == nil then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang['itemerror'], 2000)
		return
	end

	local sourceItemAmount = UsersInventories[sourceIdentifier][itemName].getCount() 
	local targetItemAmount = UsersInventories[targetIdentifier][itemName].getCount() 
	local targetItemLimit = UsersInventories[targetIdentifier][itemName].getLimit() 
	local targetInventoryItemCount = InventoryAPI.getUserTotalCount(targetIdentifier)
	
	if sourceItemAmount < amount then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang["itemerror"], 2000)
		TriggerClientEvent("vorp:TipRight", _target, Config.Lang["itemerror"], 2000)
		return
	end

	if targetItemAmount + amount > targetItemLimit or targetInventoryItemCount + amount > Config.MaxItems then
		TriggerClientEvent("vorp:TipRight", _source, Config.Lang['fullinventory'], 2000)
		TriggerClientEvent("vorp:TipRight", _target, Config.Lang['fullinventory'], 2000)
		return
	end

	InventoryService.addItem(_target, itemName, amount)
	InventoryService.subItem(_source, itemName, amount)

	TriggerClientEvent("vorpInventory:receiveItem", _target, itemName, amount)
	TriggerClientEvent("vorpInventory:receiveItem2", _source, itemName, amount)

	TriggerClientEvent("vorp:TipRight", _source, Config.Lang["yougaveitem"], 2000)
	TriggerClientEvent("vorp:TipRight", _target, Config.Lang["youreceiveditem"], 2000)
end

InventoryService.getItemsTable = function (source) 
	local _source = source

	if next(DB_Items) ~= nil then
		TriggerClientEvent("vorpInventory:giveItemsTable", DB_Items)
	end
end

InventoryService.getInventory = function (source) 
	local _source = source
	local sourceCharacter = Core.getUser(_source).getUsedCharacter
	local sourceIdentifier = sourceCharacter.identifier
	local sourceCharid = sourceCharacter.charidentifier
	local sourceInventory = json.decode(sourceCharacter.inventory)

	local characterInventory = {}
	local characterWeapons = {}

	if next(sourceInventory) ~= nil then
		for _, item in pairs(DB_Items) do
			if next(sourceInventory[item.item]) ~= nil then
				local newItem = Items:New({
					count = tonumber(sourceInventory[item.item]),
					limit = item.limit,
					label = item.label,
					name = item.item,
					type = item.type,
					canUse = item.usable,
					canRemove = item.can_remove,
				})
				characterInventory[item.item] = newItem
			end
		end
	end
	UsersInventories[identifier] = characterInventory
	
	TriggerClientEvent("vorpInventory:giveInventory", sourceInventory)

	exports.ghmattimysql:execute('SELECT * FROM loadout WHERE identifier = @identifier AND charidentifier = @charid', { 
			['identifier'] = sourceIdentifier,
			['charid'] = sourceCharid,
		}, 
	function(result)
		if next(result) ~= nil then	
			for _, weapon in pairs(result) do
				local db_Ammo = json.decode(weapon.ammo)
				local weaponAmmo = {}
				local used = false
				local used2 = false

				for _, ammo in pairs(db_Ammo) do
					weaponAmmo[ammo.Name] = ammo
				end

				if weapon.used == 1 then used = true end
				if weapon.used2 == 1 then used2 = true end

				local newWeapon = Weapon:New({
					id = weapon.id,
					propietary = weapon.identifier,
					name = weapon.name,
					ammo = weaponAmmo,
					used = used,
					used2 = used2,
					charId = sourceCharid,
				})
				UsersWeapons[newWeapon.getId()] = newWeapon
			end
			TriggerClientEvent("vorpInventory:giveLoadout", result)
		end
	end)


end