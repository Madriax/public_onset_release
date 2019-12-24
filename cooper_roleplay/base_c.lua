AddRemoteEvent("showRegisterUI", function()
    SetWebVisibility(registerui, WEB_VISIBLE)
end)


AddEvent("OnPackageStart", function()
	local width, height = GetScreenSize()
    registerui = CreateWebUI(0.0, 0.0, width*1.125, height*1.11, 1, 60)
	LoadWebFile(registerui, "http://asset/".. GetPackageName() .."/gui/register.html")
	SetWebVisibility(registerui, WEB_HIDDEN)
end)

