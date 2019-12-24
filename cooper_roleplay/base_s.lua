local spawncords = {176496.546875, 211517.046875, 1300.2015380859, -96.0}
utils = ImportPackage("utils")
sql = utils.getSQL()

AddEvent("OnPlayerJoin", function(player)

	--[[
		If player exist:
			load player
			spawn player at last saved position
		else
			spawn player at spawnpoint
			change player and player's voice dimension
			enable register UI
			load player
			reset player and player's voice dimension
	]]

	if playerExist(player) then
		loadUser(player)
		SetPlayerSpawnLocation(player, table.unpack(GetPlayerPropertyValue(player, position)))
	else
		CallRemoteEvent(player, "showRegisterUI")
		SetPlayerSpawnLocation(player, table.unpack(spawncords))
	end


	AddPlayerChatAll('<span color="#eeeeeeaa">'..GetPlayerName(player)..' ('..player..') joined the server</>')
	AddPlayerChatAll('<span color="#eeeeeeaa">There are '..GetPlayerCount()..' players on the server</>')
	AddPlayerChat(player, "Welcome to the Cooper's Life!")
end)

function playerExist(player)
	local query = mariadb_prepare(sql, "SELECT count(1) FROM users WHERE steamid = ? LIMIT 1",
    	tostring(GetPlayerSteamId(player))
	)
	mariadb_async_query(sql, query, function()
		return (mariadb_get_row_count() == 1)
	end)
end