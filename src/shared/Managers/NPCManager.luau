local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NPCManager = {}
NPCManager.__index = NPCManager

type NPCManager = {
    npcs: {[number]: any},
    nextId: number,
    createNPC: <T>(self: NPCManager, npcType: string, ...any) -> T,
    getNPCsByType: <T>(self: NPCManager, npcType: string) -> {T},
}

function NPCManager.new(): NPCManager
    local self =  setmetatable({
        npcs = {},
        nextId = 1
    }, NPCManager)
    return self
end

function NPCManager:createNPC<T>(npcType: string, ...): T
    local id = self.nextId
    self.nextId += 1
    
    local NPCClass = require(ReplicatedStorage.Shared.Classes[npcType])
    local npc = NPCClass.new(id, ...) :: T
    
    self.npcs[id] = npc
    npc:Spawn(npcType)
    
    return npc
end

function NPCManager:getNPCsByType<T>(npcType: string): {T}
    local results: {T} = {}
    for _, npc in self.npcs do
        local NPCClass = require(ReplicatedStorage.Shared.Classes[npcType])
        if getmetatable(npc) == NPCClass then
            table.insert(results, npc :: T)
        end
    end
    return results
end

return setmetatable(NPCManager, {
    __call = function(_, ...)
        return NPCManager.new(...)
    end
})