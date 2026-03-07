-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
if not game["Run Service"]:IsRunning() then
    return v1
end
if game:GetService("RunService"):IsClient() then
    repeat
        wait()
    until game:IsLoaded() == true
end
for _, v2 in game.ReplicatedStorage.AuraDesigns:GetChildren() do
    if v2:IsA("ModuleScript") then
        local v3 = require(v2)
        if not v3.Secret then
            if v3.Dimension and not v1[v3.Dimension] then
                v1[v3.Dimension] = {}
            end
            v3.Name = v2.Name
            local v4 = v1[v3.Dimension]
            table.insert(v4, v3)
        end
    end
end
for _, v5 in v1 do
    table.sort(v5, function(p6, p7)
        return p6.Requirement < p7.Requirement
    end)
end
return v1