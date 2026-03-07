-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
repeat
    wait()
until game:IsLoaded()
local v1 = script.Parent.Index
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = game:GetService("TweenService")
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = game:GetService("TextService")
local v_u_10 = v7:WaitForChild("Remotes")
local v_u_11 = not (v_u_8.KeyboardEnabled or v_u_8.GamepadEnabled)
if v_u_11 then
    v_u_11 = v_u_8.TouchEnabled
end
require(game.ReplicatedStorage.Modules.TranslateBuffKeys)
local v_u_12 = require(game.ReplicatedStorage.Modules.EnchantIconGenerator)
local v_u_13 = require(game.ReplicatedStorage.RenderInventoryItems)
local _ = {
    [1] = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(1, 1, 1)),
    [10] = ColorSequence.new(Color3.new(0.666667, 0, 1), Color3.new(1, 1, 1)),
    [100] = ColorSequence.new(Color3.new(0, 0, 1), Color3.new(1, 1, 1)),
    [1000] = ColorSequence.new(Color3.new(0.333333, 1, 0), Color3.new(1, 1, 1)),
    [10000] = ColorSequence.new(Color3.new(1, 1, 0), Color3.new(1, 1, 1)),
    [100000] = ColorSequence.new(Color3.new(1, 0.666667, 0), Color3.new(1, 1, 1)),
    [1000000] = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1))
}
local v_u_14 = v1:WaitForChild("Shop")
local v_u_15 = v_u_14:WaitForChild("Title")
local v_u_16 = v_u_15.TextButton
local v_u_17 = v_u_14:WaitForChild("Wrapper"):WaitForChild("InnerWrapper")
v_u_17.Parent.Size = v_u_11 and UDim2.new(1, -2, 0.9, -60) or v_u_17.Parent.Size
local v_u_18 = v_u_17:WaitForChild("MenuButtons")
local v_u_19 = require(v7:WaitForChild("ClientDataParser"))
local v_u_20 = v_u_17:WaitForChild("ItemDetail")
local v_u_21 = v_u_20:WaitForChild("ActionGroup")
local v_u_22 = v_u_21:WaitForChild("Equip")
local v_u_23 = v_u_21:WaitForChild("Delete")
local v24 = v1.List
v24.Size = v_u_11 and UDim2.new(1, -126, 0.85, -92) or v24.Size
local v_u_25 = v24.Wrapper
local v_u_26 = v_u_25.InnerWrapper
local v_u_27 = v_u_26:WaitForChild("InfoBar"):WaitForChild("ToggleBulkDelete")
local v_u_28 = v_u_26:WaitForChild("InfoBar"):WaitForChild("ClearSelected")
local v_u_29 = v_u_26:WaitForChild("InfoBar"):WaitForChild("FilterButton")
v_u_27.Visible = false
v_u_29.Visible = false
local v_u_30 = v_u_25:WaitForChild("FilterWrapper")
local v31 = v_u_30:WaitForChild("TemplateButton")
local v_u_32 = v_u_26:WaitForChild("Title")
local v_u_33 = v_u_26:WaitForChild("ScrollingList"):WaitForChild("ListWrapper")
v_u_33.Position = UDim2.fromScale(0, 0)
local v_u_34 = v_u_33:WaitForChild("TemplateItem")
v_u_34.Parent = v_u_26
v_u_34.Visible = false
local v_u_35 = false
local v_u_36 = false
local v_u_37 = {}
local v38 = {}
local v_u_39 = false
Color3.fromRGB(95, 185, 62)
Color3.fromRGB(185, 57, 57)
Color3.fromRGB(255, 57, 57)
Color3.fromRGB(195, 226, 55)
local v_u_40 = TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local v_u_41 = TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
local v_u_42 = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local v_u_43 = false
local v_u_44 = false
local v_u_45 = nil
local v_u_46 = {
    ["Items"] = 0
}
local v_u_47 = 0
local v_u_48 = Instance.new("GetTextBoundsParams")
function UpdateUnseenIndicators()
    -- upvalues: (copy) v_u_16, (ref) v_u_47, (copy) v_u_48, (copy) v_u_9, (copy) v_u_46, (copy) v_u_18
    v_u_16.Indicator.Visible = v_u_47 > 0
    if v_u_16.Indicator.Visible then
        v_u_16.Indicator.Text = v_u_47
        v_u_48.Text = v_u_47
        v_u_48.Font = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
        v_u_48.Size = 14
        v_u_48.Width = (1 / 0)
        local v49 = v_u_9:GetTextBoundsAsync(v_u_48)
        local v50 = v_u_16.Indicator
        local v51 = UDim2.new
        local v52 = v49.X + 5
        v50.Size = v51(0, math.max(v52, 14), 0, 14)
    end
    for v53, v54 in v_u_46 do
        v_u_18[v53].Indicator.Visible = v54 > 0
        if v_u_18[v53].Indicator.Visible then
            v_u_18[v53].Indicator.Text = v54
            v_u_48.Text = v54
            v_u_48.Font = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold)
            v_u_48.Size = 14
            v_u_48.Width = (1 / 0)
            local v55 = v_u_9:GetTextBoundsAsync(v_u_48)
            local v56 = v_u_18[v53].Indicator
            local v57 = UDim2.new
            local v58 = v55.X + 5
            v56.Size = v57(0, math.max(v58, 14), 0, 14)
        end
    end
end
function IncrementUnseen(p59, p60)
    -- upvalues: (copy) v_u_46, (ref) v_u_47
    local v61 = v_u_46
    v61[p59] = v61[p59] + p60
    v_u_47 = v_u_47 + p60
    UpdateUnseenIndicators()
end
function MarkSeen(p62)
    -- upvalues: (ref) v_u_47, (copy) v_u_46
    v_u_47 = v_u_47 - v_u_46[p62]
    v_u_46[p62] = 0
    UpdateUnseenIndicators()
end
function ToggleMenuList(p63)
    -- upvalues: (copy) v_u_32, (ref) v_u_44, (ref) v_u_45, (copy) v_u_25, (copy) v_u_6, (copy) v_u_42, (copy) v_u_40, (copy) v_u_41
    v_u_32.Text = p63.Text
    v_u_44 = v_u_45 == nil and true or v_u_45 ~= p63
    local v64 = p63 and v_u_45
    if v64 then
        v64 = p63 ~= v_u_45
    end
    v_u_45 = v_u_44 and p63 and p63 or nil
    local v65 = v_u_44 and UDim2.new(1, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
    if v64 then
        v_u_25.Position = UDim2.new(0.85, 0, 0, 0)
    end
    v_u_6:Create(v_u_25, v64 and v_u_42 or (v_u_44 and v_u_40 or v_u_41), {
        ["Position"] = v65
    }):Play()
end
function ForceToggleMenuList()
    -- upvalues: (ref) v_u_44, (ref) v_u_39, (copy) v_u_25, (copy) v_u_6, (copy) v_u_40, (copy) v_u_41
    if v_u_44 then
        local v66 = v_u_39 and UDim2.new(1, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
        if v_u_25.Position ~= v66 then
            v_u_6:Create(v_u_25, v_u_39 and v_u_40 or v_u_41, {
                ["Position"] = v66
            }):Play()
            wait(0.2)
        end
    else
        return
    end
end
local v_u_67 = v_u_11 and game.Players.LocalPlayer.PlayerGui:WaitForChild("TouchGui", 60):WaitForChild("TouchControlFrame") or nil
function Toggle(_)
    -- upvalues: (ref) v_u_35, (ref) v_u_43, (ref) v_u_39, (copy) v_u_19, (copy) v_u_17, (copy) v_u_14, (copy) v_u_67, (copy) v_u_6, (copy) v_u_40, (copy) v_u_41, (copy) v_u_11, (ref) v_u_3, (copy) v_u_20, (copy) v_u_15
    if v_u_35 then
        return
    elseif not v_u_43 then
        v_u_43 = true
        v_u_39 = not v_u_39
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, not v_u_39)
        local v68 = 0
        for _, _ in v_u_19.Rifts do
            v68 = v68 + 1
        end
        v_u_17:WaitForChild("RiftsFound").Text = "Rifts found: " .. v68 .. "/16"
        if v_u_39 then
            globalUImethods.CloseAll(script)
        else
            ForceToggleMenuList()
        end
        v_u_14.Active = v_u_39
        if v_u_67 then
            v_u_67.Visible = not v_u_39
        end
        local v69 = v_u_6:Create(v_u_14, v_u_39 and v_u_40 or v_u_41, {
            ["AnchorPoint"] = v_u_39 and Vector2.new(0, 0.5) or Vector2.new(0, 0),
            ["Position"] = v_u_39 and UDim2.new(0, 5, 0.5, v_u_11 and 30 or 0) or UDim2.new(0, 5, v_u_14:GetAttribute("DockingYAxis") or 0.7, 0)
        })
        v69.Completed:Once(function()
            -- upvalues: (ref) v_u_39, (ref) v_u_3, (ref) v_u_20
            if not v_u_39 then
                v_u_3 = nil
                v_u_20.Visible = false
            end
        end)
        v69:Play()
        v_u_6:Create(v_u_17, v_u_39 and v_u_40 or v_u_41, {
            ["Position"] = v_u_39 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 0, -1, 0)
        }):Play()
        v_u_6:Create(v_u_14, v_u_39 and v_u_40 or v_u_41, {
            ["Size"] = v_u_39 and UDim2.new(0.25, 0, 0.85, 0) or UDim2.new(0, 111, 0.85, 0)
        }):Play()
        v_u_6:Create(v_u_15, v_u_39 and v_u_40 or v_u_41, {
            ["Size"] = v_u_39 and UDim2.new(1, 0, 0.126, 0) or UDim2.new(1, 0, 0, 30),
            ["AnchorPoint"] = Vector2.new(1, v_u_39 and 0 or 0.5)
        }):Play()
        wait(0.2)
        task.spawn(function()
            -- upvalues: (ref) v_u_39
            if v_u_39 then
                ForceToggleMenuList()
            end
        end)
        Paging:Toggle(nil)
        if v_u_39 then
            if renderedData then
                if renderedData == "Inventory" then
                    loadInventory(true)
                elseif renderedData == "Items" then
                    loadItems(true)
                else
                    loadData(renderedData, CurrentDimension, true)
                end
            end
        else
            cleanUpList()
        end
        v_u_43 = false
    end
end
globalUImethods = require(script:FindFirstAncestorOfClass("ScreenGui"):WaitForChild("GlobalMethods"))
globalUImethods[script] = function()
    -- upvalues: (ref) v_u_39
    if v_u_39 then
        Toggle()
    end
end
local v_u_70 = {}
function HandleTween(p71, p72)
    -- upvalues: (copy) v_u_70
    if v_u_70[p71] then
        v_u_70[p71]:Cancel()
        v_u_70[p71] = nil
    end
    p72:Play()
    v_u_70[p71] = p72
end
require(script.EternityNum)
local v_u_73 = v_u_26:WaitForChild("InfoBar"):WaitForChild("Progress")
local v_u_74 = v_u_26.InfoBar.Seach
Paging = require(v_u_26.PagingControls.Control)
local v_u_75 = v_u_73.Parent.DimensionSwap
renderedData = nil
local v_u_76 = require(v7:WaitForChild("GameData"))
local v_u_77 = game:GetService("ReplicatedStorage"):WaitForChild("OverheadDesigns")
local v_u_78 = game.ReplicatedStorage:WaitForChild("VariantOverheadDesigns")
local v_u_79 = game.ReplicatedStorage:WaitForChild("EnchantOverheadDesigns")
require(game.ReplicatedStorage:WaitForChild("Commaify"))
v_u_20:WaitForChild("PreviewWrapper")
local v_u_80 = v_u_39
local v_u_81 = ""
local v_u_82 = nil
local v_u_83 = false
for v84, v85 in v_u_76.Tiers do
    if v85.Rarity and v85.Name ~= "Unobtainable" then
        table.insert(v38, v84)
    end
end
table.sort(v38, function(p86, p87)
    -- upvalues: (copy) v_u_76
    local v88 = v_u_76.Tiers[p86].Rarity
    local v89 = v_u_76.Tiers[p87].Rarity
    local v90 = v88 >= 0
    if v90 == (v89 >= 0) then
        if v90 then
            return v88 < v89
        else
            return v89 < v88
        end
    else
        return v90
    end
end)
local v91 = v_u_33:WaitForChild("InventoryItem")
v91.Visible = false
v91.Parent = v_u_26
local v_u_92 = math.round
local v_u_93 = nil
local v_u_94 = false
local v_u_95 = v_u_20:WaitForChild("ItemActionGroup")
v_u_95:WaitForChild("Use"):WaitForChild("Button")
local v_u_96 = game:GetService("ReplicatedStorage").Tiers
local function v_u_100(p97)
    -- upvalues: (copy) v_u_96
    if p97 then
        local v98 = v_u_96:FindFirstChild(p97.Name)
        local v99 = v98 and v98:FindFirstChildWhichIsA("UIGradient")
        if v99 then
            return v99.Color
        else
            return ColorSequence.new(Color3.new(1, 1, 1))
        end
    else
        return ColorSequence.new(Color3.new(1, 1, 1))
    end
end
local v_u_101 = {}
function updateFilterButtons()
    -- upvalues: (copy) v_u_29, (ref) v_u_5, (copy) v_u_76, (copy) v_u_100, (copy) v_u_101
    v_u_29.Text = ""
    local v102 = v_u_5 and v_u_76.Tiers[v_u_5] or nil
    local v103 = v_u_29:FindFirstChildWhichIsA("TextLabel")
    if v103 then
        v103.Text = "Filter: " .. (v102 and (v102.Name or "Off") or "Off")
        local v104 = v103:FindFirstChildWhichIsA("UIGradient")
        if v104 then
            v104.Color = v_u_100(v102)
        end
    end
    for _, v105 in v_u_101 do
        local v106 = v105:GetAttribute("TierIndex")
        local v107 = v106 == v_u_5
        local v108 = v106 and v_u_76.Tiers[v106] or nil
        local v109 = v108 and v108.Name or "Off"
        local v110 = v105:FindFirstChildWhichIsA("TextLabel")
        if v110 then
            if v107 then
                v109 = v109 .. " \226\156\147" or v109
            end
            v110.Text = v109
        end
        v105.FontFace = v107 and Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold) or Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Regular)
    end
end
function applyFilter(p111)
    -- upvalues: (ref) v_u_5
    v_u_5 = p111
    updateFilterButtons()
    if renderedData == "Inventory" then
        loadInventory(true)
        return
    elseif renderedData == "Items" then
        loadItems(true)
    elseif renderedData then
        loadData(renderedData, CurrentDimension, true)
    end
end
function passesRarityFilter(p112, p113)
    -- upvalues: (ref) v_u_5, (copy) v_u_76
    if not v_u_5 then
        return true
    end
    local _, _, v114 = v_u_76:GetTierFromRNG(p112, p113)
    return v114 == v_u_5
end
function passesItemTierFilter(p115)
    -- upvalues: (ref) v_u_5, (copy) v_u_76
    if not v_u_5 then
        return true
    end
    local _, v116 = v_u_76:GetTierFromString(p115)
    return v116 == v_u_5
end
local v117 = v31:Clone()
v117:SetAttribute("TierIndex", nil)
v117.Visible = true
v117.Active = true
v117.Interactable = true
v117.Parent = v_u_30
local v118 = v117:FindFirstChildWhichIsA("TextLabel")
if v118 then
    v118.Text = "Off"
    local v119 = v118:FindFirstChildWhichIsA("UIGradient")
    if v119 then
        v119.Color = ColorSequence.new(Color3.new(1, 1, 1))
    end
end
v117.Activated:Connect(function()
    -- upvalues: (copy) v_u_30, (ref) v_u_35, (copy) v_u_26
    applyFilter(nil)
    v_u_30.Visible = false
    v_u_35 = false
    v_u_26.Active = true
end)
table.insert(v_u_101, v117)
for _, v_u_120 in v38 do
    local v121 = v_u_76.Tiers[v_u_120]
    if v121 then
        local v122 = v31:Clone()
        v122:SetAttribute("TierIndex", v_u_120)
        v122.Visible = true
        v122.Active = true
        v122.Interactable = true
        v122.Parent = v_u_30
        local v123 = v122:FindFirstChildWhichIsA("TextLabel")
        if v123 then
            v123.Text = v121.Name
            local v124 = v123:FindFirstChildWhichIsA("UIGradient")
            if v124 then
                v124.Color = v_u_100(v121)
            end
        end
        v122.Activated:Connect(function()
            -- upvalues: (copy) v_u_120, (copy) v_u_30, (ref) v_u_35, (copy) v_u_26
            applyFilter(v_u_120)
            v_u_30.Visible = false
            v_u_35 = false
            v_u_26.Active = true
        end)
        table.insert(v_u_101, v122)
    end
end
v31.Visible = false
v_u_29.Activated:Connect(function()
    -- upvalues: (copy) v_u_30, (ref) v_u_35, (copy) v_u_26
    local v125 = not v_u_30.Visible
    v_u_30.Visible = v125
    v_u_35 = v125
    v_u_26.Active = not v125
end)
updateFilterButtons()
local v_u_126 = false
local v_u_127 = v_u_74:Clone()
v_u_127.Name = "AuraSearch"
v_u_127.Text = ""
v_u_127.Parent = v_u_74.Parent
v_u_127.Visible = false
v_u_127.LayoutOrder = v_u_74.LayoutOrder
v_u_127:GetPropertyChangedSignal("Text"):Connect(function()
    -- upvalues: (ref) v_u_81, (copy) v_u_127, (ref) v_u_126
    v_u_81 = v_u_127.Text
    if not v_u_126 then
        if renderedData == "Inventory" then
            loadInventory(true, true)
        end
    end
end)
function ResetBulkDelete()
    -- upvalues: (ref) v_u_36, (ref) v_u_37, (copy) v_u_28, (copy) v_u_27
    v_u_36 = false
    v_u_37 = {}
    v_u_28.Visible = false
    v_u_28.Active = false
    v_u_28.Interactable = false
    v_u_27.TextColor3 = Color3.fromRGB(255, 0, 0)
    v_u_27.Text = "Bulk Delete"
end
function resetThings()
    -- upvalues: (copy) v_u_20, (copy) v_u_21, (ref) v_u_3, (ref) v_u_4, (ref) v_u_93, (ref) v_u_94, (copy) v_u_95, (ref) v_u_5, (ref) v_u_81, (ref) v_u_126, (copy) v_u_127
    v_u_20.Visible = false
    v_u_21.Visible = false
    if v_u_3 then
        v_u_3:SetAttribute("LockedHover", false)
    end
    v_u_3 = nil
    v_u_4 = nil
    v_u_93 = nil
    v_u_94 = false
    v_u_95.Visible = false
    v_u_95.Use.Visible = false
    v_u_5 = nil
    updateFilterButtons()
    v_u_81 = ""
    v_u_126 = true
    v_u_127.Text = ""
    v_u_126 = false
    ResetBulkDelete()
end
function cleanUpList(_)
    -- upvalues: (copy) v_u_33
    for _, v128 in v_u_33.Parent:GetChildren() do
        if v128.Name == "Group" or (v128.Name:find("Stripe") or v128:IsA("TextLabel")) then
            v128:Destroy()
        end
    end
    for _, v129 in v_u_33:GetChildren() do
        if not v129:IsA("UIGridLayout") then
            v129:Destroy()
        end
    end
end
repeat
    wait()
until v_u_2:GetAttribute("HardcoreEnabled") ~= nil
v_u_2:GetAttribute("HardcoreEnabled")
function DisplayRNG(p130, p131, p132, p133, p134, p135)
    -- upvalues: (ref) v_u_3, (copy) v_u_20, (ref) v_u_93, (ref) v_u_4, (copy) v_u_76, (ref) v_u_80
    if v_u_3 == p130 then
        v_u_3 = nil
        v_u_20.Visible = false
    else
        p130:SetAttribute("LockedHover", true)
        if v_u_3 then
            v_u_3:SetAttribute("LockedHover", false)
        end
        v_u_3 = p130
        v_u_93 = p134
        v_u_4 = p131
        local v136, v137 = v_u_76:GetTierFromRNG(p132, p135)
        local v138 = "?"
        local v139 = game:GetService("ReplicatedStorage").Tiers:FindFirstChild(v136)
        if v136 and p133 then
            v138 = v137.TopText
        else
            v139 = game:GetService("ReplicatedStorage").Tiers.Placeholder
        end
        for _, v140 in v_u_20.PreviewWrapper.Tier:GetChildren() do
            if not v140:IsA("UIPadding") then
                v140:Destroy()
            end
        end
        v_u_20.PreviewWrapper.Stars:ClearAllChildren()
        v139:Clone().Parent = v_u_20.PreviewWrapper.Tier
        local v141 = v139:Clone()
        v141.Text = v138
        v141.Parent = v_u_20.PreviewWrapper.Stars
        for _, v142 in v_u_20.PreviewWrapper:GetChildren() do
            if not v142:isA("UIAspectRatioConstraint") and (not v142:IsA("UIPadding") and (v142 ~= v_u_20.PreviewWrapper.Tier and v142 ~= v_u_20.PreviewWrapper.Stars)) then
                v142:Destroy()
            end
        end
        for _, v143 in p130:GetChildren() do
            local v144 = v143:Clone()
            v144.Parent = v_u_20.PreviewWrapper
            if v144:FindFirstChild("UIStroke") then
                v144:FindFirstChild("UIStroke").Parent = v_u_20.PreviewWrapper
                task.spawn(function()
                    -- upvalues: (ref) v_u_20, (ref) v_u_80
                    while v_u_20.PreviewWrapper:FindFirstChild("UIStroke") do
                        v_u_20.PreviewWrapper:FindFirstChild("UIStroke").UIGradient.Rotation = tick() * 360 % 360
                        task.wait()
                        if not v_u_80 then
                            wait(0.5)
                        end
                    end
                end)
            end
            if v144:FindFirstChild("UICorner") then
                v144:FindFirstChild("UICorner"):Clone().Parent = v_u_20.PreviewWrapper
            end
        end
        v_u_20.PreviewWrapper.Wrapper.Transparency = 1
        v_u_20.Visible = true
    end
end
function loadData(p145, p146, p147)
    -- upvalues: (ref) v_u_83, (copy) v_u_74, (copy) v_u_127, (copy) v_u_27, (copy) v_u_29, (copy) v_u_34, (copy) v_u_78, (copy) v_u_79, (copy) v_u_77, (copy) v_u_19, (copy) v_u_75, (copy) v_u_76, (copy) v_u_13, (copy) v_u_33, (copy) v_u_12, (copy) v_u_92, (copy) v_u_73
    if v_u_83 then
        return
    elseif p147 or renderedData ~= p145 then
        renderedData = p145
        Paging:Toggle(nil)
        v_u_74.Visible = false
        v_u_127.Visible = false
        v_u_27.Visible = false
        v_u_29.Visible = false
        cleanUpList()
        v_u_34.Visible = true
        local v148 = p145 == "Variants" and v_u_78 or (p145 == "__IterableEnchants" and v_u_79 or v_u_77)
        local v149 = p145 == "SecretDesigns" and "Secret" or (p145 == "__IterableEnchants" and "Enchants" or string.sub(p145, 1, -2))
        local v150 = 0
        local v151 = 0
        local v152 = v_u_19.Discovered[v149]
        if p146 then
            v152 = v152[p146] or v152
        end
        local v153 = v_u_75
        local v154 = p145 ~= "Variants"
        if v154 then
            local v155 = p145 == "__IterableEnchants"
            v154 = not v155
        end
        v153.Visible = v154
        local v156 = false
        local v157 = nil
        local v158 = nil
        for v159, v_u_160, v161, v162 in v_u_76[p145][p146] or v_u_76[p145] do
            local v_u_163, v_u_164, v165, v_u_166, v167, v_u_168 = v_u_13.RenderIndexItems(v_u_160, v148, v152)
            if (not v161 or (v161 ~= (1 / 0) or v_u_166)) and v_u_163 then
                v150 = v150 + 1
                if p145 == "__IterableEnchants" then
                    if v159 == 1 then
                        if v158 then
                            local v169 = (v156 and v157 and v157 or v_u_77:FindFirstChild("Basic").Label:Clone()):Clone()
                            v169.Size = script.GroupLabel.Size
                            v169.TextXAlignment = script.GroupLabel.TextXAlignment
                            v169.AutomaticSize = Enum.AutomaticSize.X
                            v169.Text = v156 and (v157.Text or "???") or "???"
                            v169.Parent = v_u_33.Parent
                            script.StripePadding:Clone().Parent = v_u_33.Parent
                            v158.Parent = v_u_33.Parent
                            script.StripePadding:Clone().Parent = v_u_33.Parent
                            script.StripeThingy:Clone().Parent = v_u_33.Parent
                            v157:Destroy()
                        end
                        v158 = v_u_33:Clone()
                        v158.Name = "Group"
                        v157 = v165:Clone()
                        v157.Text = v162
                        v156 = false
                    end
                    v_u_12(v159, v165).Parent = v_u_163.Wrapper.SingleEnchantIcon
                    v165.Text = v_u_166 and v_u_160.Name or v165.Text
                elseif not v158 then
                    v158 = v_u_33
                end
                if p145 == "SecretDesigns" then
                    v_u_163.LayoutOrder = v167
                end
                if v_u_166 then
                    v151 = v151 + 1
                    v156 = true
                end
                v_u_163.Wrapper.ClickTrigger.Activated:Connect(function()
                    -- upvalues: (copy) v_u_163, (copy) v_u_164, (copy) v_u_168, (copy) v_u_166, (copy) v_u_160
                    DisplayRNG(v_u_163, v_u_164, v_u_168, v_u_166, v_u_160.Name)
                end)
                v_u_163.Parent = v158
            end
        end
        local v170 = Color3.fromHSV(v151 / v150 * 125 / 255, 1, 0.8823529411764706)
        v_u_73.Text = ("Discovered: <font color=\"rgb(%*,%*,%*)\">%*</font>/%*"):format(v_u_92(v170.R * 255) or 0, v_u_92(v170.G * 255) or 0, v_u_92(v170.B * 255) or 0, v151, v150)
        RecolorSelectedFrames()
        v_u_34.Visible = false
    end
end
local v171 = v_u_33:WaitForChild("TemplateInventoryItemFrame")
v171.Parent = v_u_26
v171.Visible = false
v_u_20.PreviewWrapper.MouseEnter:Connect(function()
    -- upvalues: (ref) v_u_4, (copy) v_u_20
    if v_u_4 then
        v_u_4(v_u_20.PreviewWrapper)
    end
end)
function DisplayItem(p172, p173, p174, p175)
    -- upvalues: (ref) v_u_3, (copy) v_u_20, (ref) v_u_4, (ref) v_u_80
    if v_u_3 == p172 then
        v_u_3 = nil
        v_u_20.Visible = false
    else
        if v_u_3 then
            v_u_3:SetAttribute("LockedHover", false)
        end
        v_u_3 = p172
        p172:SetAttribute("LockedHover", true)
        v_u_4 = p173
        for _, v176 in v_u_20.PreviewWrapper:GetChildren() do
            if not v176:isA("UIAspectRatioConstraint") and (v176 ~= v_u_20.PreviewWrapper.Tier and v176 ~= v_u_20.PreviewWrapper.Stars) then
                v176:Destroy()
            end
        end
        p172.Wrapper:FindFirstChildOfClass("UIStroke"):Clone().Parent = v_u_20.PreviewWrapper
        task.spawn(function()
            -- upvalues: (ref) v_u_20, (ref) v_u_80
            while v_u_20.PreviewWrapper:FindFirstChild("UIStroke") do
                v_u_20.PreviewWrapper:FindFirstChild("UIStroke").UIGradient.Rotation = tick() * 360 % 360
                task.wait()
                if not v_u_80 then
                    wait(0.5)
                end
            end
        end)
        v_u_20.Visible = true
        local v_u_177 = p172.Wrapper
        for _, v178 in v_u_20.PreviewWrapper.Tier:GetChildren() do
            if not v178:IsA("UIPadding") then
                v178:Destroy()
            end
        end
        v_u_20.PreviewWrapper.Stars:ClearAllChildren()
        p174:Clone().Parent = v_u_20.PreviewWrapper.Tier
        local v179 = p174:Clone()
        v179.Text = p175.TopText
        v179.Parent = v_u_20.PreviewWrapper.Stars
        local v_u_180 = v_u_20.PreviewWrapper
        if not pcall(function()
            -- upvalues: (ref) v_u_177, (copy) v_u_180
            v_u_177.Thumbnail:Clone().Parent = v_u_180
            v_u_177.Count:Clone().Parent = v_u_180
        end) then
            pcall(function()
                -- upvalues: (ref) v_u_177, (copy) v_u_180
                v_u_177:Clone().Parent = v_u_180
            end)
        end
    end
end
function updateItemsUsedSlots()
    -- upvalues: (copy) v_u_92, (copy) v_u_19, (copy) v_u_73
    local v181 = Color3.fromRGB(0, 255, 0)
    v_u_73.Text = ("Stored Items: <font color=\"rgb(%*,%*,%*)\">%*</font>"):format(v_u_92(v181.R * 255) or 0, v_u_92(v181.G * 255) or 0, v_u_92(v181.B * 255) or 0, #v_u_19.Inventory.Items)
end
function addItemFrame(p182, p_u_183)
    -- upvalues: (copy) v_u_13, (ref) v_u_5, (copy) v_u_76, (copy) v_u_33, (ref) v_u_36, (ref) v_u_37, (copy) v_u_95, (ref) v_u_82, (copy) v_u_8
    local v_u_184, v_u_185, v_u_186, _, v_u_187, v_u_188, v_u_189 = v_u_13.RenderConsumableItems(p182, p_u_183)
    if v_u_5 and v_u_188 then
        local _, v190 = v_u_76:GetTierFromString(v_u_188.Name)
        if v190 ~= v_u_5 then
            return
        end
    end
    v_u_184.Parent = v_u_33
    v_u_184:SetAttribute("ItemKey", p_u_183)
    local v_u_191 = v_u_76.Items[v_u_186.Name]
    if v_u_191 then
        v_u_191 = v_u_191.Stackable
    end
    if v_u_36 and (not v_u_191 and v_u_37[p_u_183]) then
        v_u_184.Wrapper.Dim.Visible = false
        v_u_184.Wrapper.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
    v_u_184.Wrapper.ClickTrigger.Activated:Connect(function()
        -- upvalues: (ref) v_u_36, (copy) v_u_191, (copy) v_u_184, (ref) v_u_95, (copy) v_u_186, (copy) v_u_187, (copy) v_u_188, (copy) v_u_185, (copy) v_u_189, (ref) v_u_82, (copy) p_u_183
        if v_u_36 then
            if not v_u_191 then
                UpdateItemSelection(v_u_184)
            end
        else
            v_u_95.Visible = true
            v_u_95.Delete.Visible = not v_u_186.Undeletable
            v_u_95.Use.Visible = v_u_187
            v_u_95.Delete.Button:SetAttribute("AwaitingConfirm", true)
            v_u_95.Delete.Button:SetAttribute("ItemValue", v_u_188.Rarity)
            DisplayItem(v_u_184, v_u_185, v_u_189, v_u_188)
            v_u_82 = p_u_183
            return
        end
    end)
    v_u_184.MouseEnter:Connect(function()
        -- upvalues: (ref) v_u_8, (ref) v_u_36, (copy) v_u_184
        local v192 = false
        for _, v193 in v_u_8:GetMouseButtonsPressed() do
            v192 = v192 or v193.UserInputType == Enum.UserInputType.MouseButton1
        end
        if v192 then
            if v_u_36 then
                UpdateItemSelection(v_u_184)
            end
        else
            return
        end
    end)
end
v_u_19.Inventory.Items:OnAdd():Connect(function(p194, p195)
    -- upvalues: (copy) v_u_76, (ref) v_u_80, (copy) v_u_74
    p194.__ClientIndex = p195
    v_u_76:GetItemValue(p194)
    if renderedData == "Items" then
        if not v_u_80 then
            IncrementUnseen("Items", 1)
        end
        local v196 = v_u_74.Visible
        if v196 then
            v196 = v_u_74.Text ~= ""
        end
        if not v196 then
            addItemFrame(p194, p195)
        end
        updateItemsUsedSlots()
    else
        IncrementUnseen("Items", 1)
    end
end)
for v197, v198 in v_u_19.Inventory.Items do
    v198.__ClientIndex = v197
    v_u_76:GetItemValue(v198)
end
function loadItems(p199)
    -- upvalues: (copy) v_u_75, (copy) v_u_74, (copy) v_u_127, (copy) v_u_27, (copy) v_u_29, (copy) v_u_19, (copy) v_u_33, (copy) v_u_76
    if p199 or renderedData ~= "Items" then
        v_u_75.Visible = false
        renderedData = "Items"
        MarkSeen("Items")
        v_u_74.Visible = true
        v_u_127.Visible = false
        v_u_27.Visible = true
        v_u_29.Visible = true
        cleanUpList()
        local v200 = v_u_19.Inventory.Items
        Paging:Toggle(v200, function(p201, p202)
            addItemFrame(p202, p201)
        end, function()
            -- upvalues: (ref) v_u_33
            for _, v203 in v_u_33.Parent:GetChildren() do
                if v203.Name == "Group" or (v203.Name:find("Stripe") or v203:IsA("TextLabel")) then
                    v203:Destroy()
                end
            end
            for _, v204 in v_u_33:GetChildren() do
                if not v204:IsA("UIGridLayout") then
                    v204:Destroy()
                end
            end
        end, function(p205, p206)
            -- upvalues: (ref) v_u_76
            return v_u_76:GetItemValue(p205) < v_u_76:GetItemValue(p206)
        end)
        updateItemsUsedSlots()
        RecolorSelectedFrames()
    end
end
local v_u_207 = v_u_10:WaitForChild("UseItem")
v_u_95.Use.Button.Activated:Connect(function()
    -- upvalues: (ref) v_u_83, (ref) v_u_82, (copy) v_u_19, (copy) v_u_76, (copy) v_u_95, (ref) v_u_3, (copy) v_u_207, (copy) v_u_74, (copy) v_u_20, (ref) v_u_80
    if not v_u_83 and (renderedData == "Items" and v_u_82) then
        local v208 = v_u_19.Inventory.Items[v_u_82].Name or v_u_82
        local v209 = v_u_76.Items[v208]
        local _ = v209.Stackable
        v_u_95.Use.Button.Text = "..."
        v_u_83 = true
        local v210 = v_u_207:InvokeServer(v_u_82, "Use")
        if tonumber(v210) then
            local v211 = v_u_74.Text
            local v212 = Paging.Page
            DisplayItem(v_u_3)
            v_u_20.Visible = false
            loadItems(true)
            v_u_74.Text = v211
            Paging:SwitchPage(v212 - Paging.Page)
            updateItemsUsedSlots()
            local _ = v209.CloseIndexAfterUsage
        end
        v_u_95.Use.Button.Text = "Use"
        v_u_83 = false
    end
end)
v_u_95:WaitForChild("Delete"):WaitForChild("Button")
local function v_u_216(p213)
    -- upvalues: (ref) v_u_82, (ref) v_u_83, (ref) v_u_3, (copy) v_u_95, (copy) v_u_216, (copy) v_u_207
    warn(p213, v_u_82)
    if v_u_83 or (renderedData ~= "Items" or p213 and v_u_82 ~= p213) then
        return
    else
        local v214 = v_u_3
        if p213 or (not v_u_95.Delete.Button:GetAttribute("AwaitingConfirm") or v_u_95.Delete.Button:GetAttribute("ItemValue") < 10000) then
            v_u_95.Delete.Button.Text = "..."
            v_u_83 = true
            if v_u_207:InvokeServer(v_u_82, "Delete") then
                DisplayItem(v_u_3)
                v214:Destroy()
            end
            v_u_95.Delete.Button.Text = "Delete"
            v_u_83 = false
        else
            v_u_95.Delete.Button:GetAttribute("AwaitingConfirm", false)
            local v_u_215 = v_u_82
            showConfirm(true, v214, v_u_82, function()
                -- upvalues: (ref) v_u_216, (copy) v_u_215
                v_u_216(v_u_215)
            end)
        end
    end
end
v_u_95.Delete.Button.Activated:Connect(function()
    -- upvalues: (copy) v_u_216
    v_u_216()
end)
function RecolorSelectedFrames()
    -- upvalues: (ref) v_u_36, (copy) v_u_19, (copy) v_u_76, (ref) v_u_37, (copy) v_u_33
    if v_u_36 then
        local function v225(p217)
            -- upvalues: (ref) v_u_19, (ref) v_u_76, (ref) v_u_37
            if not (p217:IsA("Frame") and p217:FindFirstChild("Wrapper")) then
                return
            end
            local v218 = p217:GetAttribute("ItemKey")
            local v219 = p217:GetAttribute("InventoryKey")
            local v220 = p217:GetAttribute("InventoryType")
            local v221 = v218 and renderedData == "Items" and v_u_19.Inventory.Items[v218]
            if v221 then
                local v222 = v_u_76.Items[v221.Name]
                if not (v222 and v222.Stackable) then
                    v_u_37[v218] = nil
                    p217.Wrapper.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    return
                end
            end
            local v223 = false
            if v218 then
                v223 = v_u_37[v218] ~= nil
            elseif v219 and v220 then
                for v224 in v_u_37 do
                    if typeof(v224) == "table" and (v224.Type == v220 and v224.Key == v219) then
                        v223 = true
                        break
                    end
                end
            end
            if v223 then
                p217.Wrapper.Dim.Visible = false
                p217.Wrapper.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            else
                p217.Wrapper.Dim.Visible = false
                p217.Wrapper.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end
        end
        for _, v226 in v_u_33:GetChildren() do
            v225(v226)
        end
        for _, v227 in v_u_33.Parent:GetChildren() do
            if v227.Name == "Group" then
                for _, v228 in v227:GetChildren() do
                    v225(v228)
                end
            end
        end
    end
end
function ToggleBulkDelete()
    -- upvalues: (ref) v_u_36, (copy) v_u_28, (copy) v_u_27, (ref) v_u_37, (copy) v_u_19, (copy) v_u_76
    v_u_36 = not v_u_36
    if v_u_36 then
        v_u_28.Active = true
        v_u_28.Visible = true
        v_u_28.Interactable = true
        v_u_27.TextColor3 = Color3.fromRGB(0, 255, 0)
        for v229 in v_u_37 do
            if renderedData == "Items" then
                local v230 = v_u_19.Inventory.Items[v229]
                if v230 then
                    local v231 = v_u_76.Items[v230.Name]
                    if v231 and v231.Stackable then
                        v_u_37[v229] = nil
                    end
                end
            end
        end
        local v232 = 0
        for _ in v_u_37 do
            v232 = v232 + 1
        end
        v_u_27.Text = "Confirm Delete (" .. v232 .. ")"
    else
        ResetBulkDelete()
    end
    RecolorSelectedFrames()
end
function UpdateItemSelection(p233)
    -- upvalues: (ref) v_u_36, (copy) v_u_19, (copy) v_u_76, (ref) v_u_37, (copy) v_u_34, (copy) v_u_27
    if not v_u_36 then
        return
    end
    local v234 = p233:GetAttribute("ItemKey")
    local v235 = p233:GetAttribute("InventoryKey")
    local v236 = p233:GetAttribute("InventoryType")
    if v234 and renderedData == "Items" then
        local v237 = v_u_19.Inventory.Items[v234]
        if not v237 then
            return
        end
        local v238 = v_u_76.Items[v237.Name]
        if not v238 or v238.Stackable then
            return
        end
    end
    if not v234 then
        if not (v235 and v236) then
            return
        end
        v234 = {
            ["Type"] = v236,
            ["Key"] = v235
        }
    end
    local v239 = false
    local v240 = nil
    for v241 in v_u_37 do
        if typeof(v241) == "string" and v241 == v234 or typeof(v241) == "table" and (typeof(v234) == "table" and (v241.Type == v234.Type and v241.Key == v234.Key)) then
            v240 = v241
            v239 = true
            break
        end
    end
    if v239 then
        v_u_37[v240] = nil
        v_u_34.Wrapper.Dim.Visible = false
        p233.Wrapper.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    else
        v_u_37[v234] = true
        v_u_34.Wrapper.Dim.Visible = false
        p233.Wrapper.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
    end
    local v242 = 0
    for _ in v_u_37 do
        v242 = v242 + 1
    end
    v_u_27.Text = "Confirm Delete (" .. v242 .. ")"
end
function ExecuteBulkDelete()
    -- upvalues: (ref) v_u_37, (copy) v_u_19, (copy) v_u_76, (ref) v_u_83, (copy) v_u_10, (ref) v_u_36, (copy) v_u_27
    local v243 = {}
    for v244 in v_u_37 do
        if typeof(v244) == "string" then
            if renderedData == "Items" then
                local v245 = v_u_19.Inventory.Items[v244]
                if v245 then
                    local v246 = v_u_76.Items[v245.Name]
                    if v246 and not v246.Stackable then
                        table.insert(v243, v244)
                    end
                end
            else
                table.insert(v243, v244)
            end
        elseif typeof(v244) == "table" then
            local v247 = {
                ["Type"] = v244.Type,
                ["Key"] = v244.Key
            }
            table.insert(v243, v247)
        end
    end
    if #v243 == 0 then
        ToggleBulkDelete()
        return
    else
        v_u_83 = true
        local v248 = v_u_10.BulkDeleteItems:InvokeServer(v243)
        v_u_83 = false
        if v248 then
            v_u_37 = {}
            v_u_36 = false
            v_u_27.TextColor3 = Color3.fromRGB(255, 0, 0)
            v_u_27.Text = "Bulk Delete"
            if renderedData == "Items" then
                loadItems(true)
            elseif renderedData == "Inventory" then
                loadInventory(true)
            end
        else
            v_u_36 = false
            v_u_27.TextColor3 = Color3.fromRGB(255, 0, 0)
            v_u_27.Text = "Bulk Delete"
            return
        end
    end
end
v_u_27.Activated:Connect(function()
    -- upvalues: (ref) v_u_36, (ref) v_u_37, (copy) v_u_28
    if v_u_36 then
        if #v_u_37 > 5 then
            showConfirm(true, nil, nil, ExecuteBulkDelete)
        else
            v_u_28.Visible = false
            v_u_28.Active = false
            v_u_28.Interactable = false
            ExecuteBulkDelete()
        end
    else
        ToggleBulkDelete()
        return
    end
end)
v_u_28.Activated:Connect(function()
    -- upvalues: (ref) v_u_37
    v_u_37 = {}
    ToggleBulkDelete()
    if renderedData == "Items" then
        loadItems(true)
        return
    elseif renderedData == "Inventory" then
        loadInventory(true)
    else
        loadData(renderedData, CurrentDimension, true)
    end
end)
function addListGroup(p249)
    -- upvalues: (copy) v_u_33
    local v250 = v_u_33:Clone()
    v250.Name = "Group"
    local v251 = script.GroupLabel:Clone()
    v251.Name = p249 .. "Group"
    v251.Text = p249
    v251.Parent = v_u_33.Parent
    script.StripePadding:Clone().Parent = v_u_33.Parent
    v250.Parent = v_u_33.Parent
    script.StripePadding:Clone().Parent = v_u_33.Parent
    script.StripeThingy:Clone().Parent = v_u_33.Parent
    return v250, v251
end
local v_u_264 = {
    ["Enchant"] = function(p252, p253)
        -- upvalues: (copy) v_u_13, (copy) v_u_23
        local v_u_254, v_u_255, v_u_256, v_u_257, v_u_258 = v_u_13.RenderEnchantItems(p252, nil, true)
        v_u_254.Parent = p253
        return true, v_u_254, function()
            -- upvalues: (ref) v_u_23, (copy) v_u_256, (copy) v_u_254, (copy) v_u_255, (copy) v_u_257, (copy) v_u_258
            v_u_23:SetAttribute("ItemValue", v_u_256)
            DisplayItem(v_u_254, v_u_255, v_u_257, v_u_258)
        end, v_u_256
    end,
    ["Roll"] = function(p_u_259, p260)
        -- upvalues: (copy) v_u_13, (copy) v_u_23
        local v_u_261, v_u_262, v_u_263 = v_u_13.RenderAuraSlot(p_u_259, nil, true, false)
        v_u_261.Parent = p260
        return true, v_u_261, function()
            -- upvalues: (ref) v_u_23, (copy) v_u_263, (copy) v_u_261, (copy) v_u_262, (copy) p_u_259
            v_u_23:SetAttribute("ItemValue", v_u_263)
            DisplayRNG(v_u_261, v_u_262, v_u_263, true, nil, p_u_259["5"])
        end, v_u_263
    end
}
function renderInventoryList(p_u_265, p_u_266)
    -- upvalues: (copy) v_u_19, (copy) v_u_77, (copy) v_u_264, (ref) v_u_5, (ref) v_u_81, (ref) v_u_36, (copy) v_u_23, (copy) v_u_22, (ref) v_u_82, (copy) v_u_21, (copy) v_u_92
    local v267, v268 = addListGroup(p_u_266)
    local v269 = v_u_19.Inventory[p_u_265]
    local v270 = v_u_19.InventorySlots[p_u_265]
    local v271 = 0
    local v272 = 0
    for v_u_273, v_u_274 in v269 do
        v271 = v271 + 1
        local v275, v_u_276, v_u_277, v278 = v_u_264[p_u_265](v_u_274, v267)
        if v275 then
            if v_u_5 then
                if p_u_265 == "Roll" then
                    local v279 = v_u_274["5"]
                    if passesRarityFilter(v278, v279) then
                        goto l5
                    end
                    v_u_276:Destroy()
                else
                    if p_u_265 ~= "Enchant" or passesRarityFilter(v278, false) then
                        goto l5
                    end
                    v_u_276:Destroy()
                end
            else
                ::l5::
                if p_u_265 == "Roll" and v_u_81 ~= "" then
                    local v280 = v_u_81:lower()
                    local v281 = false
                    for _, v282 in v_u_276:GetDescendants() do
                        if (v282:IsA("TextLabel") or v282:IsA("TextButton")) and v282.Text:lower():find(v280, 1, true) then
                            v281 = true
                            break
                        end
                    end
                    if v281 then
                        goto l13
                    end
                    v_u_276:Destroy()
                else
                    ::l13::
                    v272 = v272 + 1
                    v_u_276:SetAttribute("InventoryKey", v_u_273)
                    v_u_276:SetAttribute("InventoryType", p_u_265)
                    v_u_276.Wrapper.ClickTrigger.Activated:Connect(function()
                        -- upvalues: (ref) v_u_36, (copy) v_u_276, (ref) v_u_23, (copy) p_u_265, (copy) p_u_266, (copy) v_u_274, (ref) v_u_22, (copy) v_u_277, (ref) v_u_82, (copy) v_u_273, (ref) v_u_21
                        if v_u_36 then
                            UpdateItemSelection(v_u_276)
                        else
                            v_u_23:SetAttribute("SelectedInventoryType", p_u_265)
                            v_u_23:SetAttribute("InventoryLimitDisplayKey", p_u_266)
                            v_u_23:SetAttribute("ItemValue", v_u_274.Rarity or (v_u_274.Value or 0))
                            v_u_22:SetAttribute("SelectedInventoryType", p_u_265)
                            v_u_277()
                            v_u_82 = v_u_273
                            v_u_21.Visible = true
                        end
                    end)
                end
            end
        end
    end
    local v283 = Color3.fromHSV((1 - v271 / v270) * 125 / 255, 1, 0.8823529411764706)
    v268.Text = ("%* - <font color=\"rgb(%*,%*,%*)\">%*</font>/%*"):format(p_u_266, v_u_92(v283.R * 255) or 0, v_u_92(v283.G * 255) or 0, v_u_92(v283.B * 255) or 0, v271, v270)
end
function loadInventory(_, p284)
    -- upvalues: (ref) v_u_83, (copy) v_u_73, (copy) v_u_127, (copy) v_u_27, (copy) v_u_29, (copy) v_u_75
    if not v_u_83 then
        v_u_73.Text = ""
        renderedData = "Inventory"
        cleanUpList()
        if not p284 then
            Paging:Toggle(nil)
        end
        v_u_127.Visible = true
        v_u_27.Visible = true
        v_u_29.Visible = true
        renderInventoryList("Roll", "Aura")
        renderInventoryList("Enchant", "Enchant")
        v_u_75.Visible = false
        RecolorSelectedFrames()
    end
end
local v285 = {
    [v_u_18:WaitForChild("Design")] = "Designs",
    [v_u_18:WaitForChild("Secret")] = "SecretDesigns",
    [v_u_18:WaitForChild("Variant")] = "Variants",
    [v_u_18:WaitForChild("Enchantments")] = "__IterableEnchants"
}
CurrentDimension = "1"
local v_u_286 = nil
for v_u_287, v_u_288 in v285 do
    v_u_287.Activated:Connect(function()
        -- upvalues: (ref) v_u_286, (copy) v_u_288, (copy) v_u_287
        v_u_286 = v_u_288
        resetThings()
        loadData(v_u_286, CurrentDimension)
        ToggleMenuList(v_u_287)
        v_u_286 = v_u_288
    end)
end
v_u_75.ClickTrigger.MouseButton1Click:Connect(function()
    -- upvalues: (copy) v_u_75, (ref) v_u_286
    if CurrentDimension == "1" then
        CurrentDimension = "2"
    else
        CurrentDimension = "1"
    end
    v_u_75.Title.TextLabel.Text = "Dimension " .. CurrentDimension
    resetThings()
    loadData(v_u_286, CurrentDimension, true)
end)
local v_u_289 = v_u_21:WaitForChild("Delete"):WaitForChild("Button")
local v_u_290 = v1:WaitForChild("Confirm")
v_u_290:WaitForChild("No").Activated:Connect(function()
    showConfirm(false)
end)
function showConfirm(p291, _, _, p_u_292)
    -- upvalues: (copy) v_u_290, (copy) v_u_20, (copy) v_u_6
    for _, v293 in v_u_290.TextLabel.Rank:GetChildren() do
        if not (v293:IsA("UIAspectRatioConstraint") or v293:IsA("UIStroke")) then
            v293:Destroy()
        end
    end
    for _, v294 in v_u_20.PreviewWrapper:GetChildren() do
        v294:Clone().Parent = v_u_290.TextLabel.Rank
    end
    local v_u_295 = os.clock()
    v_u_290.Visible = p291
    HandleTween(v_u_290, v_u_6:Create(v_u_290, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
        ["BackgroundTransparency"] = p291 and 0.2 or 1
    }))
    v_u_290:SetAttribute("Key", v_u_295)
    v_u_290:WaitForChild("Yes").Activated:Once(function()
        -- upvalues: (ref) v_u_290, (copy) v_u_295, (copy) p_u_292
        if v_u_290:GetAttribute("Key") == v_u_295 then
            p_u_292()
            showConfirm(false)
        end
    end)
end
function DeleteItem(p296, p_u_297, p_u_298)
    -- upvalues: (ref) v_u_83, (copy) v_u_289, (copy) v_u_10, (copy) v_u_20, (copy) v_u_19, (copy) v_u_33, (copy) v_u_92
    if p_u_298 then
        if v_u_83 then
            return
        else
            local v299 = v_u_289.Parent:GetAttribute("SelectedInventoryType")
            local v300 = v_u_289.Parent:GetAttribute("ItemValue")
            if p296 or v300 <= 1000000 and v300 > 0 then
                local v301 = v_u_289.Text
                v_u_289.Text = "..."
                v_u_83 = true
                if v_u_10.DeleteItem:InvokeServer(p_u_298, v299) then
                    v_u_20.Visible = false
                    pcall(function()
                        -- upvalues: (copy) p_u_297
                        p_u_297:Destroy()
                    end)
                    task.wait()
                    local v_u_302 = #v_u_19.Inventory.Roll
                    local v_u_303 = v_u_19.InventorySlots.Roll
                    local v_u_304 = Color3.fromHSV((1 - v_u_302 / v_u_19.InventorySlots.Roll) * 125 / 255, 1, 0.8823529411764706)
                    pcall(function()
                        -- upvalues: (ref) v_u_33, (ref) v_u_289, (copy) v_u_304, (ref) v_u_92, (copy) v_u_302, (copy) v_u_303
                        v_u_33.Parent.AurasGroup.Text = ("%* - <font color=\"rgb(%*,%*,%*)\">%*</font>/%*"):format(v_u_289:GetAttribute("InventoryLimitDisplayKey"), v_u_92(v_u_304.R * 255) or 0, v_u_92(v_u_304.G * 255) or 0, v_u_92(v_u_304.B * 255) or 0, v_u_302, v_u_303)
                    end)
                end
                v_u_83 = false
                v_u_289.Text = v301
                v_u_20.Visible = false
            else
                showConfirm(true, p_u_297, p_u_298, function()
                    -- upvalues: (copy) p_u_297, (copy) p_u_298
                    DeleteItem(true, p_u_297, p_u_298)
                end)
            end
        end
    else
        return
    end
end
v_u_289.Activated:Connect(function()
    -- upvalues: (ref) v_u_3, (ref) v_u_82
    DeleteItem(false, v_u_3, v_u_82)
end)
local v_u_305 = v_u_21:WaitForChild("Equip"):WaitForChild("Button")
v_u_305.Activated:Connect(function()
    -- upvalues: (ref) v_u_82, (copy) v_u_2, (copy) v_u_305, (ref) v_u_83, (copy) v_u_10, (ref) v_u_3, (copy) v_u_20
    if v_u_82 then
        if not v_u_2.Character or (not v_u_2.Character:FindFirstChild("Humanoid") or v_u_2.Character:FindFirstChild("Humanoid").Health >= v_u_2.Character:FindFirstChild("Humanoid").MaxHealth) then
            local v306 = v_u_305.Text
            v_u_305.Text = "..."
            v_u_83 = true
            local v307 = v_u_305.Parent:GetAttribute("SelectedInventoryType")
            if v_u_10.EquipItem:InvokeServer(v_u_82, v307) then
                if v_u_3 then
                    v_u_3:Destroy()
                end
                v_u_83 = false
                v_u_305.Text = v306
                loadInventory(true)
                v_u_20.Visible = false
            end
        end
    else
        return
    end
end)
v_u_18:WaitForChild("Inventory").Activated:Connect(function()
    -- upvalues: (copy) v_u_18
    resetThings()
    loadInventory()
    ToggleMenuList(v_u_18:WaitForChild("Inventory"))
end)
v_u_18:WaitForChild("Items").Activated:Connect(function()
    -- upvalues: (copy) v_u_18
    resetThings()
    loadItems()
    ToggleMenuList(v_u_18:WaitForChild("Items"))
end)
v_u_16.Activated:Connect(Toggle)
v_u_75.Visible = true
script.Parent.Secret.Visible = game:GetService("Players").LocalPlayer.DisplayName:lower() == "arcsluckisreal" and true or game:GetService("Players").LocalPlayer.DisplayName:lower() == "arc_luckisreal"