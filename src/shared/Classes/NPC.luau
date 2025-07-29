local NPC = {}
NPC.__index = NPC

export type NPC = typeof(setmetatable({} :: {
	ID: number,
	Spawn: (self: NPC) -> ()
}, NPC))

function NPC.new(id): NPC
	local self = setmetatable({
		ID = id
	}, NPC)

	return self
end

function NPC.Spawn(self: NPC, npcType: string)
	print("NPC " .. self.ID .. " has spawned of type " .. npcType)
end

return NPC