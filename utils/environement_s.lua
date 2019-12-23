AddCommand("time", function(player, time)
	if time == nil then
		return AddPlayerChat(player, "Use /time <0-24>")
	end

	time = tonumber(time)

	if time == nil or time < 0 or time > 24 then
		return AddPlayerChat(player, "Parameter \"time\" value should be between 0-24")
	end

	CallRemoteEvent(player, "ClientSetTime", time)
end)

AddCommand("weather", function(player, weather)
	local min = 1
	local max = 10
	if weather == nil then
		return AddPlayerChat(player, "Use /weather <"..min.."-"..max..">")
	end

	weather = tonumber(weather)

	if weather == nil or weather < min or weather > max then
		return AddPlayerChat(player, "Parameter \"time\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetWeather", weather)
end)

AddCommand("saturation", function(player, value)
	local min = 0
	local max = 4
	if value == nil then
		return AddPlayerChat(player, "Use /saturation <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"saturation\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetSaturation", value)
end)

AddCommand("sunradius", function(player, value)
	local min = 0
	local max = 4
	if value == nil then
		return AddPlayerChat(player, "Use /sunradius <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"sunradius\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetSunRadius", value)
end)

AddCommand("sunshine", function(player, value)
	local min = 0
	local max = 15
	if value == nil then
		return AddPlayerChat(player, "Use /sunshine <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"sunshine\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetSunShine", value)
end)

AddCommand("starsbright", function(player, value)
	local min = 0
	local max = 4
	if value == nil then
		return AddPlayerChat(player, "Use /starsbright <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"starsbright\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetStarsBrightness", value)
end)

AddCommand("moonradius", function(player, value)
	local min = 0
	local max = 1
	if value == nil then
		return AddPlayerChat(player, "Use /moonradius <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"moonradius\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetMoonRadius", value)
end)

AddCommand("moonshine", function(player, value)
	local min = 0
	local max = 3
	if value == nil then
		return AddPlayerChat(player, "Use /moonshine <"..min.."-"..max..">")
	end

	value = tonumber(value)

	if value == nil or value < min or value > max then
		return AddPlayerChat(player, "Parameter \"moonshine\" value should be between "..min.."-"..max)
	end

	CallRemoteEvent(player, "ClientSetMoonShine", value)
end)