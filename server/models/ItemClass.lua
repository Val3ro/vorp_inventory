Item = {}

Item.name = nil
Item.label = nil
Item.type = nil
Item.model = nil

Item.count = nil
Item.limit = nil

Item.weight = nil

Item.canUse = false 
Item.canRemove = false
Item.dropOnDeath = false 

-- NAME
Item:setName = function (name) 
	self.name = name
end

Item:getName = function () 
	return self.name
end

-- LABEL
Item:setLabel = function (label) 
	self.label = label
end

Item:getLabel = function () 
	return self.label
end

-- TYPE
Item:setType = function (type) 
	self.type = type
end

Item:getType = function () 
	return self.type
end

-- Model
Item:setModel = function (model)
	self.model = model
end

Item:getModel = function ()
	return self.model
end

-- COUNT
Item:setCount = function (amount) 
	self.count = amount
end

Item:getCount = function () 
	return self.count
end

Item:addCount = function (amount) 
	if self.count + amount <= limit then
		self.count = self.count + amount
		return true
	end
	return false
end

Item:quitCount = function (amount) 
	self.count = self.count - amount
end

-- LIMIT
Item:setLimit = function (limit) 
	self.limit = limit
end

Item:getLimit = function () 
	return self.limit
end

-- WEIGHT
Item:setWeight = function (weight)
	self.weight = weight
end

Item:getWeight = function ()
	return self.weight
end

-- CanUse
Item:setCanUse = function (canUse) 
	self.canUse = canUse
end

Item:getCanUse = function () 
	return self.canUse
end

-- CanRemove
Item:setCanRemove = function (canRemove) 
	self.canRemove = canRemove
end

Item:getCanRemove = function () 
	return self.canRemove
end

-- DropOnDeath
Item:setDropOnDeath = function (dropOnDeath)
	self.dropOnDeath = dropOnDeath
end

Item:getDropOnDeath = function ()
	return self.dropOnDeath
end
 
function Item:New (t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end