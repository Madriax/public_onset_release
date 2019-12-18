function OnNPCStreamIn(npc)
	local _modelPreset = GetNPCPropertyValue(npc, "_modelPreset")
	if _modelPreset ~= nil then
		SetNPCClothingPreset(npc, _modelPreset)
	end
end
AddEvent("OnNPCStreamIn", OnNPCStreamIn)