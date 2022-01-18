RegisterNetEvent("vorpInventory:giveItemsTable")
AddEventHandler("vorpInventory:giveItemsTable", InventoryService.processItems)

RegisterNetEvent("vorpInventory:giveInventory")
AddEventHandler("vorpInventory:giveInventory", InventoryService.getInventory)

RegisterNetEvent("vorpInventory:giveLoadout")
AddEventHandler("vorpInventory:giveLoadout", InventoryService.getLoadout)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", InventoryService.onSelectedCharacter)

RegisterNetEvent("vorpinventory:receiveItem")
AddEventHandler("vorpinventory:receiveItem", InventoryService.receiveItem)

RegisterNetEvent("vorpinventory:receiveItem2")
AddEventHandler("vorpinventory:receiveItem2", InventoryService.receiveItem2)

RegisterNetEvent("vorpinventory:receiveWeapon")
AddEventHandler("vorpinventory:receiveWeapon", InventoryService.receiveWeapon)

Citizen.CreateThread(InventoryService.updateAmmoInWeapon)
	