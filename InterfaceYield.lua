-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.UI.Shared.Utility.Button2DHoverAnimation)
local v_u_2 = require(game.ReplicatedStorage.Modules.TweenHandler)
local v_u_3 = {}
v_u_3.__index = v_u_3
local v4 = {
    ["UI"] = script.ComponentDesign:Clone(),
    ["RenderedCount"] = 0
}
local v_u_5 = setmetatable(v4, v_u_3)
v_u_5.UI.Name = script.Name
v_u_5.UI.Visible = false
v_u_1.AddInputSinkingFrame(v_u_5.UI)
local v6 = v_u_5.UI.Bar.ClosingOpening.Animation
local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, -1, true)
v_u_2:Create(v6.L.UIAspectRatioConstraint, v7, {
    ["AspectRatio"] = 1.1
})()
v_u_2:Create(v6.L, v7, {
    ["Size"] = UDim2.fromScale(0.3, 0.3)
})()
v_u_2:Create(v6.R.UIAspectRatioConstraint, v7, {
    ["AspectRatio"] = 1.1
})()
v_u_2:Create(v6.R, v7, {
    ["Size"] = UDim2.fromScale(0.3, 0.3)
})()
v_u_2:Create(v6.UIListLayout, v7, {
    ["Padding"] = UDim.new(0.005, 0)
})()
v_u_2:Create(v6.Middle, v7, {
    ["Size"] = UDim2.fromScale(0.2, 0.2)
})()
v_u_2:Create(v6.Middle.UIAspectRatioConstraint, v7, {
    ["AspectRatio"] = 3
})()
function v_u_3.Open()
    -- upvalues: (copy) v_u_2, (copy) v_u_5
    task.spawn(function()
        -- upvalues: (ref) v_u_2, (ref) v_u_5
        v_u_2:Animation(v_u_5, v_u_5)
        v_u_2:Create(v_u_5.UI, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
            ["ImageTransparency"] = 0.5,
            ["BackgroundTransparency"] = 0.5
        }, true)()
        v_u_2:Create(v_u_5.UI.Bar.ClosingOpening, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
            ["Size"] = UDim2.fromScale(1, 1)
        }, true)()
        v_u_5.UI.Visible = true
    end)
end
function v_u_3.Close()
    -- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_2
    v_u_1.RevokeInputSinking(v_u_5.UI)
    task.spawn(function()
        -- upvalues: (ref) v_u_2, (ref) v_u_5
        v_u_2:Animation(v_u_5, v_u_5)
        v_u_2:Create(v_u_5.UI.Bar.ClosingOpening, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {
            ["Size"] = UDim2.fromScale(0, 1)
        }, true)()
        v_u_2:Create(v_u_5.UI, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {
            ["ImageTransparency"] = 1,
            ["BackgroundTransparency"] = 1
        }, true)()
        v_u_2:AnimYield()
        v_u_5.UI.Visible = false
    end)
end
function v_u_3.SetDocking(p8)
    -- upvalues: (copy) v_u_5
    v_u_5.UI.Parent = p8
end
function v_u_3.TemporaryDock(p9)
    -- upvalues: (copy) v_u_5, (copy) v_u_3
    if not v_u_5.UI.Parent then
        v_u_3.SetDocking(p9)
    end
end
task.defer(v_u_3.Close)
return v_u_3