local talking = false
local talkingPage

function talkingdetect()
	CreateTimer(function()
		if (IsPlayerTalking()) then
			if (not talking) then
				AddPlayerChat("YEY")
				SetWebVisibility(talkingPage, WEB_VISIBLE)
				talking = true
			end
		else
			if (talking) then
				SetWebVisibility(talkingPage, WEB_HIDDEN)
				talking = false
			end
		end
	end, 0)
end
AddRemoteEvent("talkingdetect", talkingdetect)

function createVoicePage()
	local width, height = GetScreenSize()
	talkingPage = CreateWebUI(width, height/2, 10, 10, 5, 10)
	LoadWebFile(talkingPage, "http://asset/".. GetPackageName() .."/gui/gui.html")
	SetWebAlignment(talkingPage, 0.0, 0.0)
	SetWebAnchors(talkingPage, 0.0, 0.0, 1.0, 1.0)
	SetWebVisibility(talkingPage, WEB_HIDDEN)
end
AddEvent("OnPackageStart", createVoicePage)

function OnPackageStop()
	DestroyWebUI(talkingPage)
end

AddEvent("OnPackageStop", OnPackageStop)