local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NPCAppearance = require(ReplicatedStorage.Shared.data.NPCAppearance)

local NPCUtils = {}

local ITEM_TYPES = {
    HAIR = "HAIR",
    HAT = "HAT", 
    SHIRT = "SHIRT",
    PANTS = "PANTS"
}

function NPCUtils.getRandomItem(npcType, itemType)
    local npcData = NPCAppearance[npcType][itemType]
    return(npcData[math.random(1, #npcData)])
end

function NPCUtils.getClothing(npcType)
    return {
        hair = NPCUtils.getRandomItem(npcType, ITEM_TYPES.HAIR),
        hat = NPCUtils.getRandomItem(npcType, ITEM_TYPES.HAT),
        shirt = NPCUtils.getRandomItem(npcType, ITEM_TYPES.SHIRT),
        pants = NPCUtils.getRandomItem(npcType, ITEM_TYPES.PANTS)
    }
end

return NPCUtils