-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Modules.TweenHandler)
local v_u_2 = require(game.ReplicatedStorage.UI.Shared.Utility.Button2DHoverAnimation)
local v_u_3 = require(game.ReplicatedStorage.ClientDataParser)
local v_u_4 = require(game.ReplicatedStorage.RenderInventoryItems)
local v_u_5 = require(game.ReplicatedStorage.UI.Stories.Interface.InterfaceYield)
local v_u_6 = require(game.ReplicatedStorage.UI.Stories.Interface.RewardPop)
local v_u_7 = require(game.ReplicatedStorage.UI.Shared.Utility.UIParticle)
local v_u_8 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Effects.SoundPlayer)
local v_u_9 = game.Players.LocalPlayer
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11, p_u_12)
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_9, (copy) v_u_1, (copy) v_u_7, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6
    local v13 = {
        ["UI"] = script.ComponentDesign:Clone()
    }
    local v14 = v_u_10
    local v_u_15 = setmetatable(v13, v14)
    v_u_15.UI.Name = script.Name
    v_u_15.UI.Parent = p11
    v_u_5.SetDocking(p11)
    pcall(function()
        -- upvalues: (ref) v_u_9
        v_u_9.PlayerGui["ClientBased-Rolling"].Enabled = false
    end)
    wait(0.5)
    task.spawn(function()
        -- upvalues: (ref) v_u_1, (copy) v_u_15
        v_u_1:Animation("Open", v_u_15)
        v_u_1:Create(v_u_15.UI.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
            ["Position"] = UDim2.fromScale(0, 0)
        })()
        v_u_1:AnimYield(0.25)
        v_u_1:Create(v_u_15.UI.MainUI, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
            ["Size"] = UDim2.fromScale(0.05, 1)
        })()
        v_u_1:AnimYield(0.7)
        v_u_15.UI.MainUI.L.Size = UDim2.fromScale(0.05, 1)
        v_u_15.UI.MainUI.R.Size = UDim2.fromScale(0.05, 1)
        v_u_1:Create(v_u_15.UI.MainUI, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
            ["Size"] = UDim2.fromScale(1, 1)
        })()
    end)
    v_u_7.AddUI(v_u_15.UI.MainUI.Jackpot)
    v_u_15.UI:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        -- upvalues: (copy) v_u_15
        v_u_15.UI.MainUI.Wrapper.Size = UDim2.fromOffset(v_u_15.UI.AbsoluteSize.X, v_u_15.UI.AbsoluteSize.Y)
    end)
    v_u_15.UI.MainUI.Wrapper.Size = UDim2.fromOffset(v_u_15.UI.AbsoluteSize.X, v_u_15.UI.AbsoluteSize.Y)
    local v18 = {
        ["ClickSFX"] = "WEAPON",
        ["EnterAnim"] = function(p16)
            -- upvalues: (ref) v_u_1, (copy) v_u_15
            v_u_1:Animation("Hover", v_u_15)
            v_u_1:Create(p16.Background, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 0
            })()
        end,
        ["LeaveAnim"] = function(p17)
            -- upvalues: (ref) v_u_1, (copy) v_u_15
            v_u_1:Animation("Hover", v_u_15)
            v_u_1:Create(p17.Background, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 1
            })()
        end
    }
    v_u_2.Add(v_u_15.UI.MainUI.Wrapper.Buttons, v18)
    local v_u_19 = {}
    local v_u_20 = {}
    for v21, v22 in v_u_3.Inventory.Items do
        if v22.Name == "\"Clover\"" and (v22.Attributes and (v22.Attributes.Multiplier and v22.Attributes.Multiplier <= 100)) then
            local v23, _, _, _, _, _, _, v24 = v_u_4.RenderConsumableItems(v22, v21)
            local v25 = v24 .. v21
            v_u_19[v25] = v23
            v23.Name = v25
            v23:SetAttribute("id", v21)
            v23.Parent = v_u_15.UI.MainUI.Wrapper.Inventory.List.ScrollingFrame
        end
    end
    for v26 = 1, 10 do
        local v27 = script.Slot:Clone()
        v27.Name = v26
        v27.Parent = v_u_15.UI.MainUI.Wrapper.MergingList
    end
    local v_u_28 = v_u_15.UI.MainUI.Wrapper.MergingList
    local v_u_29 = v_u_15.UI.MainUI.Wrapper.Inventory.List.ScrollingFrame
    local v_u_30 = v_u_15.UI.MainUI.Wrapper.Buttons.Yes
    v_u_15.UI.MainUI.Wrapper.Buttons.No.MouseButton1Click:Connect(function()
        -- upvalues: (copy) p_u_12
        if p_u_12.CloseFeedback then
            p_u_12.CloseFeedback()
        end
    end)
    local v_u_31 = {}
    v_u_2.Add(v_u_15.UI.MainUI.Wrapper.Inventory.List.ScrollingFrame, {
        ["OnClickFeedback"] = function(p32)
            -- upvalues: (copy) v_u_31, (copy) v_u_20, (copy) v_u_28, (copy) v_u_19, (copy) v_u_30
            local v33 = p32.Parent.Parent
            local v34 = nil
            for v35 = 1, 10 do
                if not v_u_31[v35] then
                    v34 = v35
                    break
                end
            end
            if v34 then
                v_u_31[v34] = v33
                v_u_20[v34] = v33:GetAttribute("id")
                v33:SetAttribute("Index", v34)
                v33.Parent = v_u_28:FindFirstChild((tostring(v34)))
                v_u_19[v33.Name] = nil
                v_u_30.Interactable = #v_u_31 == 10
                v_u_30.BackgroundColor3 = #v_u_31 == 10 and Color3.new(0.282353, 0.462745, 0.309804) or Color3.new(0.564706, 0.564706, 0.564706)
            end
        end
    })
    v_u_2.Add(v_u_28, {
        ["OnClickFeedback"] = function(p36)
            -- upvalues: (copy) v_u_31, (copy) v_u_20, (copy) v_u_29, (copy) v_u_19, (copy) v_u_30
            local v37 = p36.Parent.Parent
            v_u_31[v37:GetAttribute("Index")] = nil
            v_u_20[v37:GetAttribute("Index")] = nil
            v37.Parent = v_u_29
            v_u_19[v37.Name] = v37
            v_u_30.Interactable = false
            v_u_30.BackgroundColor3 = Color3.new(0.564706, 0.564706, 0.564706)
        end
    })
    v_u_30.BackgroundColor3 = Color3.new(0.564706, 0.564706, 0.564706)
    v_u_30.Interactable = false
    v_u_29.Parent.Parent.Search.TextBox.FocusLost:Connect(function()
        -- upvalues: (copy) v_u_29, (copy) v_u_19
        local v38 = v_u_29.Parent.Parent.Search.TextBox.Text
        for _, v39 in v_u_19 do
            v39.Parent = string.find(v39.Name:lower(), v38) and v_u_29 or nil
        end
    end)
    local v_u_40 = v_u_15.UI.MainUI.Wrapper.Inventory.List.ScrollingFrame.UIGridLayout
    v_u_40:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        -- upvalues: (copy) v_u_40
        v_u_40.CellSize = UDim2.new(0, v_u_40.AbsoluteCellSize.Y, 1, 0)
    end)
    local function v46()
        -- upvalues: (copy) v_u_29, (copy) v_u_28, (copy) v_u_30, (ref) v_u_5, (copy) p_u_12, (copy) v_u_20, (ref) v_u_4, (ref) v_u_1, (copy) v_u_15, (ref) v_u_8, (ref) v_u_7, (ref) v_u_6
        v_u_29.Interactable = false
        v_u_28.Interactable = false
        task.defer(function()
            -- upvalues: (ref) v_u_30
            v_u_30.Interactable = false
        end)
        v_u_5.Open()
        local v41 = {
            ["SpecialAttributeIndex"] = math.random(1, 10),
            ["VariantIndex"] = math.random(1, 10),
            ["FinalResult"] = {
                ["Multiplier"] = math.random(1000, 2000),
                ["variant"] = math.random(1, 5)
            }
        }
        if p_u_12.Remote then
            v41 = p_u_12.Remote:InvokeServer(true, v_u_20)
        else
            wait(1)
        end
        local v42 = v_u_4.RenderConsumableItems({
            ["Name"] = "\"Clover\"",
            ["Attributes"] = v41.FinalResult
        }, "")
        v_u_5.Close()
        v_u_1:Animation("REVEAL", v_u_15)
        for v43 = 1, v41.VariantIndex do
            v_u_1:Create(v_u_28:FindFirstChild((tostring(v43))).Glow, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, v43 ~= v41.VariantIndex), {
                ["BackgroundTransparency"] = 0.2
            })()
            v_u_8(script["Pop Sound!"])
            v_u_1:AnimYield(0.1)
        end
        v_u_1:AnimYield(0.5)
        for v44 = 10, v41.SpecialAttributeIndex, -1 do
            v_u_1:Create(v_u_28:FindFirstChild((tostring(v44))).Glow2, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, v44 ~= v41.SpecialAttributeIndex), {
                ["BackgroundTransparency"] = 0.2
            })()
            v_u_8(script["Pop Sound!"])
            v_u_1:AnimYield(0.1)
        end
        v_u_1:AnimYield(1.5)
        if v41.VariantIndex == v41.SpecialAttributeIndex then
            v_u_15.UI.MainUI.Jackpot.Visible = true
            for _, v45 in v_u_15.UI.MainUI.Jackpot:GetChildren() do
                if v45:IsA("ParticleEmitter") then
                    v_u_7.Emit(v45, v45.Rate * 2)
                end
            end
            v_u_1:Create(v_u_15.UI.MainUI.Jackpot, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                ["BackgroundTransparency"] = 0
            })()
            v_u_8(script.reward_screen_reveal)
            v_u_1:AnimYield(3)
        end
        v_u_6.Show({ v42 })
        v_u_6.WaitClosed()
        v_u_29.Interactable = true
        v_u_28.Interactable = true
        if p_u_12.CloseFeedback then
            p_u_12.CloseFeedback()
        end
    end
    v_u_30.MouseButton1Click:Connect(v46)
    return v_u_15
end
return v_u_10.new