-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
if game:GetService("Players").LocalPlayer then
    game:GetService("Players").LocalPlayer:Kick("Client shouldnt be able to use that module, u silly goof!")
end
local v_u_1 = game:GetService("HttpService")
local v_u_2 = {}
task.spawn(function()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    while task.wait(0.1) do
        if v_u_2[1] then
            v_u_1:PostAsync(v_u_2[1].URL, v_u_1:JSONEncode(v_u_2[1].Contents))
            table.remove(v_u_2, 1)
        end
    end
end)
return {
    ["PostAsync"] = function(_, p3, p4)
        -- upvalues: (copy) v_u_2
        local v5 = v_u_2
        table.insert(v5, {
            ["URL"] = p3,
            ["Contents"] = p4
        })
    end
}