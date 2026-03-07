-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Promise)
setmetatable({}, {
    ["__tostring"] = function()
        return "LinkToInstanceIndex"
    end
})
local v_u_2 = {
    ["ClassName"] = "Janitor",
    ["CurrentlyCleaning"] = true,
    ["SuppressInstanceReDestroy"] = false
}
v_u_2.__index = v_u_2
local v_u_3 = setmetatable({}, {
    ["__mode"] = "k"
})
local v_u_4 = {
    ["function"] = true,
    ["thread"] = true,
    ["RBXScriptConnection"] = "Disconnect"
}
function v_u_2.new()
    -- upvalues: (copy) v_u_2
    local v5 = v_u_2
    return setmetatable({
        ["CurrentlyCleaning"] = false
    }, v5)
end
function v_u_2.Is(p6)
    -- upvalues: (copy) v_u_2
    local v7
    if type(p6) == "table" then
        v7 = getmetatable(p6) == v_u_2
    else
        v7 = false
    end
    return v7
end
v_u_2.instanceof = v_u_2.Is
local function v_u_15(p8, p9)
    -- upvalues: (copy) v_u_3
    local v10 = v_u_3[p8]
    if v10 then
        local v_u_11 = v10[p9]
        if not v_u_11 then
            return p8
        end
        local v12 = p8[v_u_11]
        if v12 then
            if v12 == true then
                if type(v_u_11) == "function" then
                    v_u_11()
                else
                    local v13
                    if coroutine.running() == v_u_11 then
                        v13 = nil
                    else
                        v13 = pcall(function()
                            -- upvalues: (copy) v_u_11
                            task.cancel(v_u_11)
                        end)
                    end
                    if not v13 then
                        task.defer(function()
                            -- upvalues: (copy) v_u_11
                            task.cancel(v_u_11)
                        end)
                    end
                end
            else
                local v14 = v_u_11[v12]
                if v14 then
                    if p8.SuppressInstanceReDestroy and (v12 == "Destroy" and typeof(v_u_11) == "Instance") then
                        pcall(v14, v_u_11)
                    else
                        v14(v_u_11)
                    end
                end
            end
            p8[v_u_11] = nil
        end
        v10[p9] = nil
    end
    return p8
end
local function v_u_23(p16, p17, p18, p19)
    -- upvalues: (copy) v_u_15, (copy) v_u_3, (copy) v_u_4
    if p19 then
        v_u_15(p16, p19)
        local v20 = v_u_3[p16]
        if not v20 then
            v20 = {}
            v_u_3[p16] = v20
        end
        v20[p19] = p17
    end
    local v21 = typeof(p17)
    local v22 = p18 or (v_u_4[v21] or "Destroy")
    if v21 == "function" or v21 == "thread" then
        if v22 ~= true then
            warn(string.format("Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*", v21, tostring(v22), debug.traceback(nil, 2)))
        end
    elseif not p17[v22] then
        warn(string.format("Object %* doesn\'t have method %*, are you sure you want to add it? Traceback: %*", tostring(p17), tostring(v22), debug.traceback(nil, 2)))
    end
    p16[p17] = v22
    return p17
end
v_u_2.Add = v_u_23
function v_u_2.AddObject(p24, p25, p26, p27, ...)
    -- upvalues: (copy) v_u_23
    return v_u_23(p24, p25.new(...), p26, p27)
end
function v_u_2.AddPromise(p_u_28, p_u_29)
    -- upvalues: (copy) v_u_1, (copy) v_u_23, (copy) v_u_15
    if not v_u_1 then
        return p_u_29
    end
    if not v_u_1.is(p_u_29) then
        error(string.format("Invalid argument #1 to \'Janitor:AddPromise\' (Promise expected, got %* (%*)) Traceback: %*", typeof(p_u_29), tostring(p_u_29), debug.traceback(nil, 2)))
    end
    if p_u_29:getStatus() ~= v_u_1.Status.Started then
        return p_u_29
    end
    local v_u_30 = newproxy(false)
    local v33 = v_u_23(p_u_28, v_u_1.new(function(p31, _, p32)
        -- upvalues: (copy) p_u_29
        if not p32(function()
            -- upvalues: (ref) p_u_29
            p_u_29:cancel()
        end) then
            p31(p_u_29)
        end
    end), "cancel", v_u_30)
    v33:finally(function()
        -- upvalues: (ref) v_u_15, (copy) p_u_28, (copy) v_u_30
        v_u_15(p_u_28, v_u_30)
    end)
    return v33
end
v_u_2.Remove = v_u_15
function v_u_2.RemoveNoClean(p34, p35)
    -- upvalues: (copy) v_u_3
    local v36 = v_u_3[p34]
    local v37 = v36 and v36[p35]
    if v37 then
        p34[v37] = nil
        v36[p35] = nil
    end
    return p34
end
function v_u_2.RemoveList(p38, ...)
    -- upvalues: (copy) v_u_3, (copy) v_u_15
    if v_u_3[p38] then
        local v39 = select("#", ...)
        if v39 == 1 then
            return v_u_15(p38, ...)
        end
        if v39 == 2 then
            local v40, v41 = ...
            v_u_15(p38, v40)
            v_u_15(p38, v41)
            return p38
        end
        if v39 == 3 then
            local v42, v43, v44 = ...
            v_u_15(p38, v42)
            v_u_15(p38, v43)
            v_u_15(p38, v44)
            return p38
        end
        for v45 = 1, v39 do
            v_u_15(p38, (select(v45, ...)))
        end
    end
    return p38
end
function v_u_2.RemoveListNoClean(p46, ...)
    -- upvalues: (copy) v_u_3
    local v47 = v_u_3[p46]
    if v47 then
        local v48 = select("#", ...)
        if v48 == 1 then
            local v49 = ...
            local v50 = v47[v49]
            if v50 then
                p46[v50] = nil
                v47[v49] = nil
            end
            return p46
        end
        if v48 == 2 then
            local v51, v52 = ...
            local v53 = v47[v51]
            if v53 then
                p46[v53] = nil
                v47[v51] = nil
            end
            local v54 = v47[v52]
            if v54 then
                p46[v54] = nil
                v47[v52] = nil
            end
            return p46
        end
        if v48 == 3 then
            local v55, v56, v57 = ...
            local v58 = v47[v55]
            if v58 then
                p46[v58] = nil
                v47[v55] = nil
            end
            local v59 = v47[v56]
            if v59 then
                p46[v59] = nil
                v47[v56] = nil
            end
            local v60 = v47[v57]
            if v60 then
                p46[v60] = nil
                v47[v57] = nil
            end
            return p46
        end
        for v61 = 1, v48 do
            local v62 = select(v61, ...)
            local v63 = v47[v62]
            if v63 then
                p46[v63] = nil
                v47[v62] = nil
            end
        end
    end
    return p46
end
function v_u_2.Get(p64, p65)
    -- upvalues: (copy) v_u_3
    local v66 = v_u_3[p64]
    if v66 then
        return v66[p65]
    else
        return nil
    end
end
function v_u_2.GetAll(p67)
    -- upvalues: (copy) v_u_3
    local v68 = v_u_3[p67]
    return not v68 and {} or table.freeze(table.clone(v68))
end
local function v_u_78(p_u_69)
    -- upvalues: (copy) v_u_3
    if not p_u_69.CurrentlyCleaning then
        p_u_69.CurrentlyCleaning = nil
        local function v72()
            -- upvalues: (copy) p_u_69
            for v70, v71 in next, p_u_69 do
                if v70 ~= "SuppressInstanceReDestroy" then
                    return v70, v71
                end
            end
        end
        local v_u_73, v74 = v72()
        while v_u_73 and v74 do
            if v74 == true then
                if type(v_u_73) == "function" then
                    v_u_73()
                elseif type(v_u_73) == "thread" then
                    local v75
                    if coroutine.running() == v_u_73 then
                        v75 = nil
                    else
                        v75 = pcall(function()
                            -- upvalues: (ref) v_u_73
                            task.cancel(v_u_73)
                        end)
                    end
                    if not v75 then
                        task.defer(function()
                            -- upvalues: (copy) v_u_73
                            task.cancel(v_u_73)
                        end)
                    end
                end
            else
                local v76 = v_u_73[v74]
                if v76 then
                    if p_u_69.SuppressInstanceReDestroy and (v74 == "Destroy" and typeof(v_u_73) == "Instance") then
                        pcall(v76, v_u_73)
                    else
                        v76(v_u_73)
                    end
                end
            end
            p_u_69[v_u_73] = nil
            v_u_73, v74 = v72()
        end
        local v77 = v_u_3[p_u_69]
        if v77 then
            table.clear(v77)
            v_u_3[p_u_69] = nil
        end
        p_u_69.CurrentlyCleaning = false
    end
end
v_u_2.Cleanup = v_u_78
function v_u_2.Destroy(p79)
    -- upvalues: (copy) v_u_78
    v_u_78(p79)
    table.clear(p79)
    setmetatable(p79, nil)
end
v_u_2.__call = v_u_78
local v_u_80 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.bindToInstanceDestroyed)
local function v83(p_u_81, p82, _)
    -- upvalues: (copy) v_u_80, (copy) v_u_78
    v_u_80(p82, function()
        -- upvalues: (ref) v_u_78, (copy) p_u_81
        v_u_78(p_u_81)
    end)
    return nil
end
v_u_2.LinkToInstance = v83
v_u_2.LegacyLinkToInstance = v83
function v_u_2.LinkToInstances(p_u_84, ...)
    -- upvalues: (copy) v_u_2, (copy) v_u_80, (copy) v_u_78
    local v85 = v_u_2.new()
    for v86 = 1, select("#", ...) do
        local v87 = select(v86, ...)
        if typeof(v87) == "Instance" then
            v_u_80(v87, function()
                -- upvalues: (ref) v_u_78, (copy) p_u_84
                v_u_78(p_u_84)
            end)
            v85:Add(nil, "Disconnect")
        end
    end
    return v85
end
function v_u_2.__tostring(_)
    return "Janitor"
end
return v_u_2