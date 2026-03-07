-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.UI.Shared.Utility.Button2DHoverAnimation)
local v_u_2 = require(game.ReplicatedStorage.UI.Shared.Utility.Button2DHoverAnimation.ClickSFX)
local v_u_3 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Effects.SoundPlayer)
local v_u_4 = require(game.ReplicatedStorage.UI.Shared.Utility.UIParticle)
local v_u_5 = require(game.ReplicatedStorage.Modules.TweenHandler)
local v6 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Signal)
local v_u_7 = require(game.ReplicatedStorage.RenderInventoryItems)
local v_u_8 = {}
v_u_8.__index = v_u_8
local v9 = {
    ["UI"] = script.ComponentDesign:Clone()
}
local v_u_10 = setmetatable(v9, v_u_8)
v_u_10.UI.Name = script.Name
local v_u_11 = v6.new()
local v_u_12 = v_u_10.UI.Inner.ItemList.UIGridLayout
local function v13()
    -- upvalues: (copy) v_u_12
    v_u_12.CellSize = UDim2.new(v_u_12.CellSize.X.Scale, 0, 0, v_u_12.AbsoluteCellSize.X)
    if v_u_12.AbsoluteCellSize.X > 0 then
        v_u_12.CellPadding = UDim2.new(v_u_12.CellPadding.X.Scale, 0, 0, v_u_12.Parent.AbsoluteSize.X * v_u_12.CellPadding.X.Scale)
    end
    v_u_12.Parent.CanvasSize = UDim2.new(1, 0, 0, v_u_12.AbsoluteContentSize.Y + 55)
end
v_u_12:GetPropertyChangedSignal("AbsoluteCellSize"):Connect(v13)
v_u_12:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v13)
v_u_12.CellSize = UDim2.new(v_u_12.CellSize.X.Scale, 0, 0.3, v_u_12.AbsoluteCellSize.X)
function v_u_8.Show(p14)
    -- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_4, (copy) v_u_5
    v_u_3(script["Unlock Item"])
    v_u_3(script["Unlock Item2"])
    for _, v15 in v_u_10.UI.Inner.ItemList:GetChildren() do
        if v15.Name == "ItemShine" then
            v15:Destroy()
        end
    end
    for _, v16 in p14 do
        local v17 = v_u_10.UI.ItemShine:Clone()
        v16.Name = "Item"
        v16.Parent = v17
        v17.Parent = v_u_10.UI.Inner.ItemList
        v_u_4.AddUI(v17)
    end
    task.spawn(function()
        -- upvalues: (ref) v_u_5, (ref) v_u_10
        v_u_5:Animation("Shine", v_u_10)
        v_u_5:Create(v_u_10.UI.Inner.Shine, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1.5, 0.55)
        })()
        v_u_5:Create(v_u_10.UI, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
            ["BackgroundTransparency"] = 0.05
        })()
        v_u_5:Create(v_u_10.UI.Inner, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
            ["BackgroundTransparency"] = 0.8
        })()
        v_u_5:Create(v_u_10.UI.Inner.ItemList, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
            ["Size"] = UDim2.fromScale(1, 0.55)
        })()
        v_u_5:AnimYield()
        v_u_5:Create(v_u_10.UI.Inner.Shine, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
            ["BackgroundTransparency"] = 0.2
        })()
    end)
    for _, v18 in v_u_10.UI.Inner.Emit:GetChildren() do
        if v18:IsA("ParticleEmitter") then
            v_u_4.Emit(v18, v18.Rate)
        end
    end
    v_u_10.UI.Interactable = true
    v_u_10.UI.Inner.Emit.Visible = true
    v_u_10.UI.Visible = true
    v_u_10.UI.Inner.Icon.Visible = true
    v_u_10.UI.Inner.TextLabel.Visible = true
    v_u_10.UI.Inner.ItemList.Visible = true
    task.spawn(function()
        -- upvalues: (ref) v_u_10
        wait(1)
        v_u_10.UI.Active = true
    end)
end
function v_u_8.Close()
    -- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_5, (copy) v_u_11
    if v_u_10.UI.Active then
        if v_u_10.UI.Visible then
            v_u_3(v_u_2.WEAPON)
        end
        v_u_10.UI.Active = false
        v_u_10.UI.Interactable = false
        v_u_10.UI.Inner.Emit.Visible = false
        v_u_10.UI.Inner.Icon.Visible = false
        v_u_10.UI.Inner.ItemList.Visible = false
        v_u_10.UI.Inner.TextLabel.Visible = false
        v_u_1.RevokeInputSinking(v_u_10.UI)
        task.spawn(function()
            -- upvalues: (ref) v_u_5, (ref) v_u_10, (ref) v_u_11
            v_u_5:Animation("Shine", v_u_10)
            v_u_5:Create(v_u_10.UI.Inner.Shine, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 1
            })()
            v_u_5:Create(v_u_10.UI, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 1
            })()
            v_u_5:Create(v_u_10.UI.Inner, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 1
            })()
            v_u_11:Fire()
            v_u_5:AnimYield()
            v_u_5:Create(v_u_10.UI.Inner.Shine, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 1
            })()
            v_u_5:AnimYield(1)
            v_u_10.UI.Visible = false
            v_u_10.UI.Inner.Shine.Size = UDim2.fromScale(0, 0.55)
            v_u_10.UI.Inner.ItemList.Size = UDim2.fromScale(0, 0.55)
        end)
    end
end
v_u_10.UI.MouseButton1Click:Connect(v_u_8.Close)
function v_u_8.SetDocking(p19)
    -- upvalues: (copy) v_u_4, (copy) v_u_10
    v_u_4.AddUI(v_u_10.UI.Inner.Emit)
    v_u_10.UI.Parent = p19
end
function v_u_8.TemporaryDock(p20)
    -- upvalues: (copy) v_u_10, (copy) v_u_8
    if not v_u_10.UI.Parent then
        v_u_8.SetDocking(p20)
    end
end
function v_u_8.WaitClosed()
    -- upvalues: (copy) v_u_11
    v_u_11:Wait()
end
v_u_8.Close()
script.ShowItem.OnClientEvent:Connect(function(p21, p22)
    -- upvalues: (copy) v_u_7, (copy) v_u_8
    warn(p21, p22)
    local v23 = {}
    for v24, v25 in p21 do
        local v26 = v_u_7.RenderConsumableItems(v25, p22[v24])
        table.insert(v23, v26)
    end
    v_u_8.Show(v23)
end)
return v_u_8