local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCClass = require(ReplicatedStorage.Shared.Classes.NPC)

local Customer = {}
Customer.__index = Customer
setmetatable(Customer, {__index = NPCClass})

export type Customer = NPCClass.NPC & {
	Mood: number,
	Buy: (self: Customer, item: string) -> ()
}

function Customer.new(id: number, mood: number): Customer
	local self = NPCClass.new(id)
	self.Mood = mood
	setmetatable(self, Customer)
	return self
end

function Customer.Buy(self: Customer, item: string)
	print(self.ID .. " bought " .. item)
end

return Customer
