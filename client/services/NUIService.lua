NUIService = {}
gg = {} -- ??
isProcessingPay = false
InInventory = false

NUIService.ReloadInventory = function (inventory)
	SendNUIMessage(inventory)
	Wait(500)
	NUIService.LoadInv()
end

-- OpenContainerInventory

NUIService.OpenClanInventory = function (clanName, clanId)
	SetNuiFocus(true, true)
	SendNUIMessage("{\"action\": \"display\", \"type\": \"clan\", \"title\": \"" .. clanName .. "\", \"clanid\": " .. clanid .. "}")
	InInventory = true
end

NUIService.NUIMoveToClan = function (obj)
	TriggerServerEvent("syn_clan:MoveToClan", json.encode(obj))
end

NUIService.NUITakeFromClan = function (obj)
	TriggerServerEvent("syn_clan:TakeFromClan", json.encode(obj))
end

NUIService.NUIMoveToContainer = function (obj)
	TriggerServerEvent("syn_Container:MoveToContainer", json.encode(obj))
end

NUIService.NUITakeFromContainer = function (obj)
	TriggerServerEvent("syn_Container:TakeFromContainer", json.encode(obj))
end

NUIService.CloseInventory = function ()
	SetNuiFocus(false, false)
	SendNUIMessage("{\"action\": \"hide\"}")
	InInventory = false
end

NUIService.OpenHorseInventory = function (horseName, horseId)
	SetNuiFocus(true, true)
	SendNuiMessage("{\"action\": \"display\", \"type\": \"horse\", \"title\": \"".. horseName .. "\", \"horseid\": " .. horseid .. "}")
	InInventory = true
	TriggerEvent("vorp_stables:setClosedInv", true)
end

NUIService.NUIMoveToHorse = function (obj)
	TriggerServerEvent("vorp_stables:MoveToHorse", json.encode(obj))
end

NUIService.NUITakeFromHorse = function (obj)
	TriggerServerEvent("vorp_stables:TakeFromHorse", json.encode(obj))
end

NUIService.OpenstealInventory = function (stealName, stealId)
	SetNuiFocus(false, false)
	SendNuiMessage("{\"action\": \"display\", \"type\": \"steal\", \"title\": \"" .. stealName .. "\", \"stealId\": " .. stealid .. "}")
	InInventory = true
	TriggerEvent("vorp_stables:setClosedInv", true)
end

NUIService.NUIMoveTosteal = function (obj)
	TriggerServerEvent("syn_search:MoveTosteal", json.encode(obj))
end

NUIService.NUITakeFromsteal = function (obj)
	TriggerServerEvent("syn_search:TakeFromsteal", json.encode(obj))
end

NUIService.OpenCartInventory = function (cartName, wagonId)
	SetNuiFocus(true, true)
	SendNUIMessage("{\"action\": \"display\", \"type\": \"cart\", \"title\": \"" .. cartName .. "\", \"wagonid\": " .. wagonid .. "}")
	InInventory = true

	TriggerEvent("vorp_stables:setClosedInv", true)
end

NUIService.NUIMoveToCart = function (obj)
	TriggerServerEvent("vorp_stables:MoveToCart", json.encode(obj))
end

NUIService.NUITakeFromCart = function (obj)
	TriggerServerEvent("vorp_stables:TakeFromCart", json.encode(obj))
end


NUIService.OpenHouseInventory = function (houseName, houseId)
	SetNuiFocus(true, true)
	SendNUIMessage("{\"action\": \"display\", \"type\": \"house\", \"title\": \"" .. houseName .. "\", \"houseId\": " .. houseId .. "}")
	InInventory = true
end

NUIService.NUIMoveToHouse = function (obj)
	TriggerServerEvent("vorp_housing:MoveToHouse", json.encode(obj))
end

NUIService.NUITakeFromHouse = function (obj)
	TriggerServerEvent("vorp_housing:TakeFromHouse", json.encode(obj))
end

NUIService.OpenHideoutInventory = function (hideoutName, hideoutId)
	SetNuiFocus(true, true)
	SendNuiMessage("{\"action\": \"display\", \"type\": \"hideout\", \"title\": \"" .. hideoutName .. "\", \"hideoutId\": " .. hideoutId .. "}")
	InInventory = true
end

NUIService.NUIMoveToHideout = function (obj)
	TriggerServerEvent("syn_underground:MoveToHideout", json.encode(obj))
end

NUIService.NUITakeFromHideout = function (obj)
	TriggerServerEvent("syn_underground:TakeFromHideout", json.encode(obj))
end

NUIService.setProcessingPayFalse = function ()
	isProcessingPay = false
end

NUIService.NUIUnequipWeapon = function (obj)
	local data = json.decode(obj)

	if next(UserWeapons[tonumber(data.id)]) ~= nil then
		UserWeapons[tonumber(data.id)].UnequipWeapon()
	end

	NUIService.LoadInv()
end

NUIService.NUIGetNearPlayers = function (obj)
	local playerPed = PlayerPedId()
	local nearestPlayers = Utils.getNearestPlayers()
	local isAnyPlayerFound = false
	local closePlayersArr = {}
	local nuiReturn = {}

	for _, player in pairs(nearestPlayers) do
		isAnyPlayerFound = true
		table.insert(closePlayersArr, {
			label = GetPlayerName(player),
			player = GetPlayerServerId(player)
		})
	end

	if next(closePlayersArr) == nil then
		print("No Near Players")
		return
	end

	local item = {}

	for k, v in pairs(obj) do
		item[k] = v
	end

	if item.id == nil then
		item.id = 0
	end

	if item.count == nil then
		item.count = 1
	end

	if item.hash == nil then
		item.hash = 1
	end

	nuiReturn.action = "nearPlayers"
	nuiReturn.foundAny = isAnyPlayerFound
	nuiReturn.players = closePlayersArr
	nuiReturn.item = item.item
	nuiReturn.hash = item.hash
	nuiReturn.count = item.count
	nuiReturn.id = item.id
	nuiReturn.type = item.type
	nuiReturn.what = item.what

	SendNUIMessage(json.encode(nuiReturn))
end

NUIService.NUIGiveItem = function (obj)
	local playerPed = PlayerPedId()
	local nearestPlayers = Utils.getNearestPlayers()

	local data = Utils.expandoProcessing(obj)
	local data2 = Utils.expandoProcessing(data.data)

	for _, player in pairs(nearestPlayers) do
		if player ~= PlayerId() then
			if GetPlayerServerId(player) == tonumber(data.player) then
				local itemName = data2.item
				local target = tonumber(data.player)

				if data2.type == "item_money" then
					if isProcessingPay then return end
					isProcessingPay = true
					TriggerServerEvent("vorp_inventory:giveMoneyToPlayer", target, data2.count)
				end

				if data2.type ~= "item_money" and data2.id == 0 then
					local amount = tonumber(data2.count)

					if amount > 0 and UserInventory[itemName].getCount() >= amount then
						TriggerServerEvent("vorpinventory:serverGiveItem", itemName, amount, target, 1)
					end
				end

				if data2.type ~= "item_money" and data2.id ~= 0 then
					TriggerServerEvent("vorpinventory:serverGiveWeapon2", tonumber(data2.id), target)
				end

				NUIService.LoadInv()
			end
		end
	end
end

NUIService.NUIDropItem = function (obj)
	local aux = Utils.expandoProcessing(obj)
	local itemName = aux.item
	local type = aux.type

	if type == "item_money" then
		TriggerServerEvent("vorpinventory:serverDropMoney", aux.number)
	end

	if type == "item_standard" then
		print(aux.number)

		if aux.number ~= nil and aux.number ~= '' then
			if aux.number > 0 and UserInventory[itemName].getCount() >= tonumber(aux.number) then
				TriggerServerEvent("vorpinventory:serverDropItem", itemName, aux.number, 1)
				UserInventory[itemName].quitCount(aux.number)

				if UserInventory[itemName].getcount() == 0 then
					UserInventory[itemName] = nil
				end
			end
		end
	end

	if type ~= "item_money" and type ~= "item_standard" then
		TriggerServerEvent("vorpinventory:serverDropWeapon", aux.id)

		if next(UserWeapons[aux.id]) ~= nil then
			local weapon = UserWeapons[aux.id]	

			if weapon.getUsed() then
				weapon.setUsed(false)
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey(weapon.getName()), true, 0)
			end

			UserWeapons[aux.id] = nil
		end
	end

	NUIService.LoadInv()
end

NUIService.NUISound = function (obj)
	PlaySoundFrontend("BACK", "RDRO_Character_Creator_Sounds", true, 0)
end

NUIService.NUIFocusOff = function (obj)
	NUIService.CloseInv()
	TriggerEvent("vorp_stables:setClosedInv", false)
	TriggerEvent("syn:closeinv")
end

NUIService.OnKey = function ()
	if IsControlJustReleased(1, Config.openKey) and IsInputDisabled(0) then
		if InInventory then
			NUIService.CloseInv()
			Wait(1000)
		else
			NUIService.OpenInv()
			Wait(1000)
		end
	end
end

NUIService.LoadInv = function ()
	local weapon = {}
	DB_Items = {}
	gg = {}
	
	TriggerServerEvent("vorpinventory:check_slots")
	
	for _, currentItem in pairs(UserInventory) do
		local item = {}
		item.count = currentItem.getCount()
		item.limit = currentItem.getLimit()
		item.label = currentItem.getLabel()
		item.name = currentItem.getName()
		item.type = currentItem.getType()
		item.usable = currentItem.getCanuse()
		item.canRemove = currentItem.getCanRemove()

		table.insert(gg, item)
	end

	for _, currentWeapon in  pairs(UserWeapons) do
		local weapon = {}
		weapon.count = currentWeapon.getAllAmo()
		weapon.limit = -1
		weapon.label = Citizen.InvokeNative(0x89CF5FF3D363311E, GetHashKey(currentWeapon.getName()))
		weapon.name = currentWeapon.getName()
		weapon.hash = GetHashKey(currentWeapon.getName()) 
		weapon.type = "item_weapon"
		weapon.usable = true
		weapon.canRemove = true
		weapon.id = currentWeapon.getId()
		weapon.used = currentWeapon.getUsed()

		table.insert(gg, weapon)
	end

	DB_Items.action = setItems
	DB_Items.itemList = gg

	SendNUIMessage(json.encode(DB_Items))
end

NUIService.OpenInv = function ()
	SetNuiFocus(true, true)
	SendNUIMessage("{\"action\": \"display\", \"type\": \"main\"}")
	InInventory = true

	NUIService.LoadInv()
end

NUIService.CloseInv = function ()
	SetNuiFocus(false, false)
	SendNUIMessage("{\"action\": \"hide\"}")
	InInventory = false
end	