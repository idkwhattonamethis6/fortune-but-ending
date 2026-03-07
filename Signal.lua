-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.bindToInstanceDestroyed)
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5)
    -- upvalues: (copy) v_u_3
    local v6 = v_u_3
    return setmetatable({
        ["signal"] = p4,
        ["callback"] = p5
    }, v6)
end
function v_u_3.Disconnect(p7)
    table.remove(p7.signal, table.find(p7.signal, p7))
    for _, v8 in ipairs(p7) do
        v8()
    end
end
function v_u_3.Destroy(p9)
    -- upvalues: (copy) v_u_3
    v_u_3.Disconnect(p9)
end
function v_u_2.new()
    -- upvalues: (copy) v_u_2
    local v10 = v_u_2
    return setmetatable({}, v10)
end
function v_u_2.Connect(p11, p12)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    local v_u_13 = v_u_3.new(p11, p12)
    table.insert(p11, v_u_13)
    local v14 = getfenv(debug.info(0, "f"))
    if v14 and v14.script then
        local v15 = v_u_1
        local v16 = v14.script
        table.insert(v_u_13, v15(v16, function()
            -- upvalues: (copy) v_u_13
            v_u_13:Disconnect()
        end))
    end
    return v_u_13
end
function v_u_3.LinkToInstance(p_u_17, p18)
    -- upvalues: (copy) v_u_1
    local v19 = v_u_1
    table.insert(p_u_17, v19(p18, function()
        -- upvalues: (copy) p_u_17
        p_u_17:Disconnect()
    end))
end
function v_u_2.Once(p20, p_u_21)
    -- upvalues: (copy) v_u_3
    local v_u_22 = nil
    v_u_22 = v_u_3.new(p20, function(...)
        -- upvalues: (ref) v_u_22, (copy) p_u_21
        v_u_22:Disconnect()
        p_u_21(...)
    end)
    local v23 = v_u_22
    table.insert(p20, v23)
    return v_u_22
end
function v_u_2.Wait(p24)
    local v_u_25 = coroutine.running()
    local v_u_26 = nil
    v_u_26 = p24:Connect(function(...)
        -- upvalues: (ref) v_u_26, (copy) v_u_25
        v_u_26:Disconnect()
        task.spawn(v_u_25, ...)
    end)
    return coroutine.yield()
end
function v_u_2.DisconnectAll(p27)
    if next(p27) then
        for _, v28 in p27 do
            v28:Disconnect()
        end
    end
    table.clear(p27)
end
_G.logging = {}
function v_u_2.Fire(p29, ...)
    for _, v30 in table.clone(p29) do
        task.spawn(v30.callback, ...)
    end
end
return v_u_2