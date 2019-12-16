local chat_timer = 0

AddRemoteEvent("chattimer", function()
	chattimer = CreateTimer(function()
		chat_timer = chat_timer + 1
		if (chat_timer <= 8) then
			SetChatLocation(0, 0)
		elseif (IsChatFocus()) then
			SetChatLocation(0, 0)
			chat_timer = 0
		else
			SetChatLocation(9999, 9999)
		end
	end, 1000)
end)

AddRemoteEvent("resetchattimer", function()
	chat_timer = 0
end)