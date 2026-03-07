-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_2 = require(script.DataTypes)
local v_u_3 = require(script.Customs)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6, p7)
    -- upvalues: (copy) v_u_4
    assert(p5, "No instance provided")
    assert(p6, "No tweenInfo provided")
    assert(p7, "No properties provided")
    local v8 = v_u_4
    local v9 = setmetatable({}, v8)
    v9.Instance = p5
    v9.TweenInfo = p6
    v9.Properties = p7
    v9.CompletedBindable = Instance.new("BindableEvent")
    v9.Completed = v9.CompletedBindable.Event
    return v9
end
function v_u_4.Play(p10)
    -- upvalues: (copy) v_u_4
    p10:IndexOriginalProperties()
    p10.StartTime = tick()
    p10.Thread = task.defer(v_u_4.StartLoop, p10)
end
function v_u_4.Cancel(p11)
    p11.Thread = nil
    p11.StartTime = nil
end
function v_u_4.Reset(p12)
    for v13, _ in p12.Properties do
        p12.Instance[v13] = p12.OriginalProperties[v13]
    end
end
function v_u_4.PropertyExists(p_u_14, p_u_15)
    return pcall(function()
        -- upvalues: (copy) p_u_14, (copy) p_u_15
        return p_u_14.Instance[p_u_15]
    end)
end
function v_u_4.IsWhitelisted(p16, p17)
    if not p17.Whitelist then
        return true
    end
    for _, v18 in p17.Whitelist do
        if p16.Instance:IsA(v18) then
            return true
        end
    end
end
function v_u_4.IndexOriginalProperties(p19)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    p19.OriginalProperties = {}
    for v20, v21 in p19.Properties do
        local v22 = v_u_3[v20]
        local v23 = p19:PropertyExists(v20) or v22
        local v24 = v20 .. " is not a valid property of " .. p19.Instance:GetFullName()
        assert(v23, v24)
        if v22 then
            local v25 = p19:IsWhitelisted(v22)
            local v26 = p19.Instance:GetFullName() .. " class is not supported for custom type " .. v20
            assert(v25, v26)
            p19.OriginalProperties[v20] = v22.Get(p19.Instance)
        else
            local v27 = v_u_2[typeof(v21)]
            local v28 = typeof(v21) .. " data type is not supported"
            assert(v27, v28)
            p19.OriginalProperties[v20] = p19.Instance[v20]
        end
    end
end
function v_u_4.StartLoop(p29)
    local v30 = p29.Thread
    local v31 = false
    local v32 = 0
    while p29.Thread == v30 and p29.Instance.Parent do
        local v33 = (tick() - p29.StartTime) / p29.TweenInfo.Time
        local v34 = math.min(v33, 1)
        if v31 then
            v33 = 1 - v34
        end
        p29:Update(v33)
        if v34 == 1 then
            if p29.TweenInfo.Reverses and not v31 then
                p29.StartTime = tick()
                v31 = true
            else
                if v32 == p29.TweenInfo.RepeatCount then
                    break
                end
                v32 = v32 + 1
                p29.StartTime = tick()
                v31 = false
            end
        end
        task.wait()
    end
    p29.CompletedBindable:Fire()
    p29:Destroy()
end
function v_u_4.Update(p35, p36)
    -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
    local v37 = v_u_1:GetValue(p36, p35.TweenInfo.EasingStyle, p35.TweenInfo.EasingDirection)
    for v38, v39 in p35.Properties do
        local v40 = v_u_2[typeof(v39)]
        local v41 = p35.OriginalProperties[v38]
        local v42 = v_u_3[v38]
        if v42 then
            v42.Set(p35.Instance, v41, v39, v37)
        else
            p35.Instance[v38] = v40(v41, v39, v37)
        end
    end
end
function v_u_4.Destroy(p43)
    p43:Cancel()
    p43.CompletedBindable:Destroy()
end
return v_u_4