-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_4 = {
    ["Connect"] = function(p1, p_u_2)
        local v_u_3 = p1._conns
        v_u_3[p_u_2] = true
        return {
            ["Disconnect"] = function(_)
                -- upvalues: (copy) v_u_3, (copy) p_u_2
                v_u_3[p_u_2] = nil
            end
        }
    end
}
v_u_4.connect = v_u_4.Connect
function v_u_4.Fire(p5, ...)
    local v6 = table.pack(...)
    for v7 in p5._conns do
        task.spawn(v7, table.unpack(v6))
    end
end
function v_u_4.new()
    -- upvalues: (copy) v_u_4
    local v8 = {
        ["__index"] = v_u_4
    }
    return setmetatable({
        ["_conns"] = {}
    }, v8)
end
return v_u_4