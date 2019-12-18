function spawnNPC(player, id)
    x, y, z = GetPlayerLocation(player)
    h = GetPlayerHeading(player)
    npc = CreateNPC(x, y, z, h)
    clothing = nil
    if (tonumber(id) > 0 and tonumber(id) < 30) then
        SetNPCPropertyValue(npc, "_modelPreset", id)
        clothing = id
    end
    file = io.open("packages/"..GetPackageName().."/data/npc_data.lua", "a")
    io.output(file)
    x, y, z = GetNPCLocation(npc)
    io.write(x .. ", " .. y .. ", " .. z .. ", " .. h .. ", " .. clothing .. "\n")
    io.close(file)
end
AddCommand("createnpc", spawnNPC)

function deleteNPC(player)
    x, y, z = GetPlayerLocation(player)
    for _,v in pairs(GetAllNPC()) do
        nx, ny, nz = GetNPCLocation(v)
        if(GetDistance3D(x,y,z,nx,ny,nz) < 100) then
            DestroyNPC(v)
            removeFromFile(nx,ny,nz)
            break
        end
    end
end
AddCommand("deletenpc", deleteNPC)

function removeFromFile(x,y,z)
    file = io.open("packages/"..GetPackageName().."/data/npc_data.lua", "r")
    io.input(file)
    local content = ""
    for k,v in file:lines() do
        nx, ny, nz = k:match("([^,]+),([^,]+),([^,]+)")

        -- Little trick cuz Math.round unavailable
        nx = tonumber(string.format("%.2f", nx))
        ny = tonumber(string.format("%.2f", ny))
        nz = tonumber(string.format("%.2f", nz))
        x = tonumber(string.format("%.2f", x))
        y = tonumber(string.format("%.2f", y))
        z = tonumber(string.format("%.2f", z))

        if (x==nx and y==ny and z==nz) then
            print("kc")
        else
            content = content .. k .. "\n"
        end
    end
    io.close(file)
    file = io.open("packages/"..GetPackageName().."/data/npc_data.lua", "w")
    io.output(file)
    io.write(content)
    io.close(file)
end

AddEvent("OnPackageStart", function()
    file = io.open("packages/"..GetPackageName().."/data/npc_data.lua", "r")
    io.input(file)
    npcs = {}
    for k,v in file:lines() do
        table.insert(npcs, k)
    end
    for k,v in ipairs(npcs) do
        x, y, z, h, skin = v:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
        
        npc = CreateNPC(tonumber(x), tonumber(y), tonumber(z), tonumber(h))
        SetNPCPropertyValue(npc, "_modelPreset", skin)
    end

    io.close(file)
end)