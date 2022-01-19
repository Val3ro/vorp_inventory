Weapon = {}

Weapon.name = nil
Weapon.id = nil
Weapon.propietary = nil
Weapon.ammo = {}
Weapon.used = false
Weapon.used2 = false

Weapon:UnequipWeapon = function ()
	local hash = GetHashKey(self.name)
	self.setUsed(false)
	self.setUsed2(false)

	TriggerServerEvent("vorpinventory:setUsedWeapon", id, self.getUsed(), self.getUsed2())
	self.RemoveWeaponFromPed()

	Utils.cleanAmmo(self.id)
end

Weapon:RemoveWeaponFromPed = function ()
	RemoveWeaponFromPed(PlayerPedId(), GetHashKey(self.name), true, 0)
end

Weapon:loadAmmo = function ()
	-- Completar al final
end

Weapon:getUsed = function ()
	return self.used
end

Weapon:getUsed2 = function ()
	return self.used2 
end

Weapon:setUsed = function (used)
	self.used = used
	TriggerServerEvent("vorpinventory:setUsedWeapon", self.id, used, self.used2)
end

Weapon:setUsed2 = function (used2)
	self.used2 = used2
	TriggerServerEvent("vorpinventory:setUsedWeapon", self.id, self.used, used2)
end

Weapon:getPropietary = function ()
	return self.propietary
end

Weapon:setPropietary = function (propietary)
	self.propietary = propietary
end

Weapon:getId = function ()
	return self.id
end

Weapon:setId = function (id)
	self.id = id
end

Weapon:getName = function ()
	return self.name
end

Weapon:setName = function (name)
	self.name = name
end

Weapon:getAllAmmo = function ()
	return self.ammo
end

Weapon:getAmmo = function (type)
	if self.ammo[type] ~= nil then
		return self.ammo[type]
	end
	return 0
end

Weapon:setAmmo = function (type, amount)
	self.ammo[type] = amount
	TriggerServerEvent("vorpinventory:setWeaponBullets", self.id, type, amount)
end

Weapon:addAmmo = function (type, amount)
	if self.ammo[type] ~= nil then
		self.ammo[type] = self.ammo[type] + amount
	else
		self.ammo[type] = amount
	end
end

Weapon:subAmmo = function (type, amount)
	if self.ammo[type] ~= nil then
		self.ammo[type] = self.ammo[type] - amount

		if self.ammo[type] <= 0 then
			self.ammo[type] = nil
		end
	end
end