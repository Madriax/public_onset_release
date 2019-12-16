local in_noclip_mode = false
local curLocation
local curHeading
local forwardPush = 10

local key_z = false
local key_s = false
local key_a = false
local key_e = false

function keypressed(player, key)
	if(in_noclip_mode) then
		if key == "Z" then
			key_z = true
		elseif key == "S" then
			key_s = true
		elseif key == "A" then
			key_a = true
		elseif key == "E" then
			key_e = true
		else
			AddPlayerChat(player, key)
		end
	end
end
AddRemoteEvent("keypressed", keypressed)

function keyreleased(player, key)
	if(in_noclip_mode) then
		if key == "Z" then
			key_z = false
		elseif key == "S" then
			key_s = false
		elseif key == "A" then
			key_a = false
		elseif key == "E" then
			key_e = false
		end
	end
end
AddRemoteEvent("keyreleased", keyreleased)

function noclip(player)
	if(in_noclip_mode)then
		in_noclip_mode = false
		key_z = false
		key_s = false
		key_a = false
		key_e = false
	else
		in_noclip_mode = true
		local x, y, z = GetPlayerLocation(player)
		curLocation = { x = x, y = y, z = z }
		curHeading = GetPlayerHeading(player)
		AddPlayerChat(player, "Yeah noclip")
    end
end
AddCommand("noclip", noclip)

function degToRad( degs )
    return degs * 3.141592653589793 / 180
end

function OnPlayerSpawn(player)
	CreateTimer(function(player)
		if(in_noclip_mode) then
			curHeading = GetPlayerHeading(player)
			local xVect = forwardPush * math.cos( degToRad( curHeading ) )
			local yVect = forwardPush * math.sin( degToRad( curHeading ) )
			if(key_z) then
				curLocation.x = curLocation.x + xVect
				curLocation.y = curLocation.y + yVect
			end
			if(key_s) then
				curLocation.x = curLocation.x - xVect
				curLocation.y = curLocation.y - yVect
			end
			if(key_a) then
				curLocation.z = curLocation.z + 5
			end

			if(key_e) then
				curLocation.z = curLocation.z - 5
			end

			SetPlayerLocation(player, curLocation.x, curLocation.y, curLocation.z)
		end
    end, 0, player)
end
AddEvent("OnPlayerSpawn", OnPlayerSpawn)