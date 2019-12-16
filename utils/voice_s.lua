AddEvent("OnPlayerJoin", function(player)
	CallRemoteEvent(player, "talkingdetect")
end)