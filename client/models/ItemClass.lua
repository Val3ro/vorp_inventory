Item = {}

Item.count = nil
Item.limit = nil
Item.label = nil
Item.name = nil
Item.type = nil
Item.canUse = false
Item.canRemove = false


Item:setCount = function (amount)
	self.count = count
end

Item:getCount = function ()
	return self.count
end

Item:quitCount = function (amount)
	self.count = self.count - amount
end

Item:addCount = function (amount)
	self.count = self.count + amount
end

Item:subCount = function (amount)
	self.count = self.count - amount
end

Item:setLimit = function (limit)
	self.limit = limit
end

Item:getLimit = function ()
	return self.limit
end

Item:setLabel = function (label)
	self.label = label
end

Item:getLabel = function ()
	return self.label
end

Item:setName = function (name)
	self.name = name
end

Item:getName = function ()
	return self.name
end

Item:setType = function (type)
	self.type = type
end

Item:getType = function ()
	return self.type
end

Item:setUsable = function (canUse)
	self.canUse = canUse
end

Item:getUsable = function ()
	return self.canUse
end

Item:setCanRemove = function (canRemove)
	self.canRemove = canRemove
end

Item:getCanRemove = function ()
	return self.canRemove
end

function Item:New (t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end