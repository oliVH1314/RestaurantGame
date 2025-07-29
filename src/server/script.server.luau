local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCManager = require(ReplicatedStorage.Shared.Managers.NPCManager)
local Customer = require(ReplicatedStorage.Shared.Classes.Customer)

local manager = NPCManager()

local customer: Customer.Customer = manager:createNPC("Customer", 8)
local allCustomers: {Customer.Customer} = manager:getNPCsByType("Customer")

customer:Buy("Apple")
print(allCustomers)

local customer2: Customer.Customer = manager:createNPC("Customer", 5)
customer2:Buy("Burger")

local customers: {Customer.Customer} = manager:getNPCsByType("Customer")
for _, c in customers do
    print("Customer " .. c.ID .. " has mood: " .. c.Mood)
    c:Buy("Drink")
end

print("Total NPCs managed:", #manager.npcs)