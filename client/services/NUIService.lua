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