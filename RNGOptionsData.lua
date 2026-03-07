-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v9 = {
    {
        ["Name"] = "AutoRoll",
        ["Description"] = "Auto-Roll Setting",
        ["StatesDisplay"] = { "Delete", "Neutral", "Accept" }
    },
    {
        ["Name"] = "Music",
        ["Description"] = "RNG Music Settings",
        ["StatesDisplay"] = { "SHUT UP", "Neutral", "KEEP IT BLASTING" },
        ["IgnoreVariant"] = true,
        ["ClientUpdateMethod"] = function(p1, p_u_2)
            local v_u_3 = p1:sub(1, p1:find("_$_[^_]*$") - 1)
            if p_u_2 ~= 2 then
                local function v5(p4)
                    -- upvalues: (ref) v_u_3, (copy) p_u_2
                    if p4.Name == "Theme" and p4:GetAttribute("AuraName") == v_u_3 then
                        if p_u_2 == 1 and not p4:GetAttribute("ogv") then
                            p4:SetAttribute("ogv", p4.Volume)
                        end
                        p4.Volume = p_u_2 == 1 and 0 or (p4:GetAttribute("ogv") or p4.Volume)
                    end
                end
                for _, v6 in workspace.ActivatedEffects:GetDescendants() do
                    v5(v6)
                end
                for _, v7 in workspace:GetChildren() do
                    if v7:FindFirstChild("Humanoid") then
                        for _, v8 in v7:GetDescendants() do
                            v5(v8)
                        end
                    end
                end
            end
        end
    }
}
if game:GetService("RunService"):IsServer() then
    v9 = {}
    for _, v10 in v9 do
        v9[v10.Name] = v10
    end
end
return v9