DB_Items = {}
InventoryService = {}
UserWeapons = {}
UserInventory = {}
bulletsHash = {}

-- Probably a Thread -- Test the original version
InventoryService.updateAmmoInWeapon = function ()
	Wait(500)
	local playerPed = PlayerPedId()
	local weaponHash = 0

	if GetCurrentPedWeapon(playerPed, weaponHash, false, 0, false) then
		local weaponName = Citizen.InvokeNative(0x89CF5FF3D363311E, weaponHash)

		if string.find(weaponName, "UNARMED") then return end

		local weaponAmmo = {}
		local currentWeapon = nil

		for _, weapon in pairs(UserWeapons) do
			if string.find(weaponName, weapon.getName()) and weapon.getUsed() then
				weaponAmmo = weapon.getAllAmmo()
				currentWeapon = weapon
			end
		end

		if currentWeapon == nil then return end

		for type, amount in pairs(weaponAmmo) do
			local ammoAmount = Citizen.InvokeNative(0x39D22031557946C1, playerPed, GetHashKey(type)

			if ammoAmount ~= amount then
				currentWeapon.setAmmo(type, ammoAmount)
			end
		end
	end
end

InventoryService.receiveItem = function (name, amount)
	if next(UserInventory[name]) ~= nil then
		UserInventory[name].addCount(amount)
		NUIService.LoadInv()
		return
	end
	
	UserInventory[name] = Item:New({
		count = count,
		limit = DB_Items[name].limit,
		label = DB_Items[name].name,
		name = name,
		type = "item_standard",
		canUse = true,
		canRemove = DB_Items[name].can_remove
	})
	NUIService.LoadInv()
end

InventoryService.receiveitem2 = function (name, count)
	UserInventory[name].quitCount(count)

	if UserInventory[name].getCount() <= 0 then
		UserInventory[name] = nil
	end

	NUIService.LoadInv()
end

InventoryService.receiveWeapon = function (id, propietary, name, ammos)
	local weaponAmmo = nil

	for type, amount in pairs(ammos) do
		weaponAmmo[type] = tonumber(amount)
	end

	local newWeapon = Weapon:New({
		id = id,
		propietary = propietary,
		name = name,
		ammo = weaponAmmo,
		used = false,
		used2 = false
	})

	if UserWeapons[newWeapon.getId()] == nil then
		UserWeapons[newWeapon.getId()] = newWeapon
	end

	NUIService.LoadInv()
end

InventoryService.onSelectedCharacter = function (charId)
	SetNuiFocus(true, true)
	SendNUIMessage("{\"action\": \"hide\"}")
	print("Loading Inventory")
	TriggerServerEvent("vorpinventory:getItemsTable")
	Wait(300)
	TriggerServerEvent("vorpinventory:getInventory")
end

InventoryService.processItems = function (items)
	DB_Items = {}
	for _, item in pairs(items) do
		DB_Items[item.item] = {
			item = item.item,
			label = item.label,
			limit = item.limit,
			can_remove = item.can_remove,
			type = item.type,
			usable = item.usable
		}
	end
end

InventoryService.getLoadout = function (loadout)
	print(PlayerPedId())

	for _, weapon in pairs(loadout) do
		local weaponAmmo = json.decode(weapon.ammo)

		for type, amount in pairs(weaponAmmo) do
			weaponAmmo[type] = tonumber(amount)
		end

		print(weapon.used)

		local weaponUsed = false
		local weaponUsed2 = false

		if weapon.used == 1 then weaponUsed = true end
		if weapon.used2 == 1 then weaponUsed2 = true end

		local newWeapon = Weapon:New({
			id = tonumner(weapon.id),
			identifier = weapon.identifier,
			name = weapon.name,
			ammo = weaponAmmo,
			used = weaponUsed,
			used2 = weaponUsed2
		})

		UserWeapons[newWeapon.getId()] = newWeapon

		if newWeapon.getUsed() then
			Utils.useWeapon(newWeapon.getId())
		end
	end
end

InventoryService.getInventory = function (inventory)
	UserInventory = {}
	
	if inventory ~= '' then
		local inventoryItems = json.decode(inventory)
		print(inventoryItems)

		for _, item in pairs(DB_Items) do
			if next(inventoryItems[_]) ~= nil then
				print(_)
				local itemAmount = tonumber(inventoryItems[_])
				local itemLimit = tonumber(item.limit)
				local itemLabel = item.label
				local itemCanRemove = item.can_remove
				local itemType = item.type
				local itemCanUse = item.usable

				local newItem = Item:New({
					count = itemAmount,
					limit = itemLimit,
					label = itemLabel,
					name = _,
					type = itemType,
					canUse = itemCanUse,
					canRemove = itemCanRemove
				})

				UserInventory[_] = newItem
			end
		end
	end
end