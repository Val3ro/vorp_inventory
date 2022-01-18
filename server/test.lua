







Citizen.CreateThread(function()
    Items.RegisterNewItem("test", "Test item", "standart", "null", 15, 1, false, true, false)
    Wait(1000)
    Items.RegisterNewItem("test", "Test item", "standart", "null", 15, 1, false, true, false)

    Player.LoadPlayerData(1)
    Player.LoadPlayerData(2)


    Inventory.AddItem(Inventory.player[1].items, "test", 5)

    print(json.encode(Inventory.player[1].items))
end)