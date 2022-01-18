Items = {}

Items.item = nil
Items.label = nil
Items.limit = nil
Items.canUse = false 
Items.canRemove = false
Items.type = nil

Items:getName = function ()
	return self.item
end

Items:getLabel = function () 
	return self.label
end

-- TYPE
Items:setType = function (type) 
	self.type = type
end

Items:getType = function () 
	return self.type
end

-- LIMIT
Items:getLimit = function () 
	return self.limit
end

-- CanUse
Items:setCanUse = function (canUse) 
	self.canUse = canUse
end

Items:getCanUse = function () 
	return self.canUse
end

-- CanRemove
Items:getCanRemove = function () 
	return self.canRemove
end

 
function Items:New (t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end