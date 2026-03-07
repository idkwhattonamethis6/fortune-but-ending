-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = {}
if not game["Run Service"]:IsRunning() then
    return v1
end
for _, v3 in game.ReplicatedStorage.AuraDesigns:GetChildren() do
    if v3:IsA("ModuleScript") then
        local v4 = require(v3)
        if v4.Secret then
            if v4.Dimension and not v1[v4.Dimension] then
                v1[v4.Dimension] = {}
            end
            v4.Name = v3.Name
            local v5 = v2[v4.Dimension] or {}
            local v6 = not v2[v4.Requirement]
            local v7 = "duplicated secret rng " .. v3.Name
            assert(v6, v7)
            v5[v4.Requirement] = true
            v2[v4.Dimension] = v5
            local v8 = v1[v4.Dimension]
            table.insert(v8, v4)
        end
    end
end
return v1