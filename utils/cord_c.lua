local drawcord = false
local cordBox

function drawCords()
	drawcord = not drawcord
	if (drawcord) then
		local x, y, z = GetPlayerLocation()
		cordBox = CreateTextBox(-15, 180, "x: " .. x .. " y: " .. y .. " z: " .. z, "center")
		SetTextBoxAnchors(cordBox, 1.0, 0.0, 1.0, 0.0)
		SetTextBoxAlignment(cordBox, 1.0, 0.0)
	else
		DestroyTextBox(cordBox)
	end
end

AddRemoteEvent("drawcord", drawCords)