Weapon = {}

Weapon.name = nil
Weapon.id = nil
Weapon.propietary = nil
Weapon.charId = nil
Weapon.used = false
Weapon.used2 = false
Weapon.ammo = {}
Weapon.components = {}

Weapon:setUsed = function (isUsed)
	self.used = isUsed
end

Weapon:getUsed = function ()
	return self.used
end

Weapon:setUsed2 = function (isUsed)
	self.used2 = isUsed
end

Weapon:getUsed2 = function ()
	return self.used2
end

Weapon:setPropietary = function (propietary)
	self.propietary = propietary
end

Weapon:getPropietary = function ()
	return self.propietary
end

Weapon:setCharid = function (charId)
	self.charId = charId
end

Weapon:getCharid = function ()
	return charId
end

Weapon:setId = function (id)
	self.id = id
end

Weapon:getId = function ()
	return self.id
end

Weapon:setName = function (name)
	self.name = name
end

Weapon:getName = function ()
	return self.name
end

Weapon:getAllAmmo = function ()
	return self.ammo
end

Weapon:getAllComponents = function 
	return self.components
end

Weapon:setComponent = function (component)
	table.insert(self.components, component)
end

Weapon:quitComponent = function (component)
	local componentExists = findIndexOf(self.components, component)
	if componentExists then
		table.remove(self.componentExists, componentExists)
		return true
	end
	return false
end

Weapon:getAmmo = function (type) 
	return self.ammo[type]
end

Weapon:addAmmo = function (type, amount)
	if self.ammo[type] ~= nil then
		self.ammo[type] = self.ammo[type] + amount
	else
		self.ammo[type] = amount
	end
	exports.ghmattimysql:execute('UPDATE loadout SET ammo = @ammo WHERE id=@id', { ['ammo'] = json.encode(self.getAllAmmo()), ['id'] = self.id}, function(result) end)
end

Weapon:setAmmo = function (type, amount)
	self.ammo[type] = amount
	exports.ghmattimysql:execute('UPDATE loadout SET ammo = @ammo WHERE id=@id', { ['ammo'] = json.encode(self.getAllAmmo()), ['id'] = self.id}, function(result) end)
end

Weapon:subAmmo = function (type, amount)
	if self.ammo[type] ~= nil then
		self.ammo[type] = self.ammo[type] - amount
		
		if self.ammo[type] <= 0 then
			self.ammo[type] = nil
		end
		exports.ghmattimysql:execute('UPDATE loadout SET ammo = @ammo WHERE id=@id', { ['ammo'] = json.encode(self.getAllAmmo()), ['id'] = self.id}, function(result) end)
	end
end

function Weapon:New (t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end

local findIndexOf = function (table, value)
	for k,v in pairs(table) do
		if v == value then
			return k
		end
	end
	return false
end