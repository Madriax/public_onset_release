function OnKeyPress(key)
	CallRemoteEvent("keypressed", key)
end
AddEvent("OnKeyPress", OnKeyPress)

function onKeyRelease(key)
	CallRemoteEvent("keyreleased", key)
end
AddEvent("OnKeyRelease", onKeyRelease)