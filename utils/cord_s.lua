function drawCords(player)
	CallRemoteEvent(player, "drawcord")
end
AddCommand("cords", drawCords)