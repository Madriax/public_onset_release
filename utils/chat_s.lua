AddEvent("OnPlayerJoin", function(player)
	CallRemoteEvent(player, "chattimer")
end)

AddEvent("OnPlayerChat", function(player, message)
	AddPlayerChatAll(GetPlayerName(player) .. ": " .. message)
	for _, v in pairs(GetAllPlayers()) do
		CallRemoteEvent(v, "resetchattimer")
	end
end)