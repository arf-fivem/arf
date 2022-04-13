AddCommand('bogus', function(player, args, raw)
    player.addMoney(12)
end)

Player = {}

function Player:new(name)
    if not name then
        error("Cannot create Player without name")
    end
    local object = { name = name }
    setmetatable(object, self)
    self.__index = self
    return object
end

function Player:setName(newName) 
    self.name = newName
end

function Player:getName()
    return self.name
end

local p1 = Player:new('Arnold')
local p2 = Player:new('Bogus')

print('p1 name', p1:getName())
print('p2 name', p2:getName())

local p3 = Player:new()