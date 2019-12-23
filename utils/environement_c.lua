AddRemoteEvent("ClientSetTime", function(value)
	SetTime(value)
end)

AddRemoteEvent("ClientSetWeather", function(value)
    SetWeather(value)
end)

AddRemoteEvent("ClientSetSaturation", function(value)
    SetSkySaturation(value)
end)

AddRemoteEvent("ClientSetSunRadius", function(value)
    SetSunRadius(value)
end)

AddRemoteEvent("ClientSetSunShine", function(value)
    SetSunShine(value)
end)

AddRemoteEvent("ClientSetStarsBrightness", function(value)
    SetStarsBrightness(value)
end)

AddRemoteEvent("ClientSetMoonRadius", function(value)
    SetMoonRadius(value)
end)

AddRemoteEvent("ClientSetMoonShine", function(value)
    setMoonShine(value)
end)