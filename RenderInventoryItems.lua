-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = script.ExtraInfo
local v_u_4 = v_u_3.ExtraInfo
local v_u_5
if game["Run Service"]:IsRunning() then
    repeat
        wait()
    until v2:GetAttribute("HardcoreEnabled") ~= nil
    v_u_5 = v2:GetAttribute("HardcoreEnabled")
    repeat
        wait(0.1)
    until game:IsLoaded()
    v_u_4.Visible = false
    v_u_4.Archivable = true
    v_u_3.Parent = v2.PlayerGui
else
    v_u_5 = nil
end
local v_u_6 = game.ReplicatedStorage
local v_u_7 = require(game.ReplicatedStorage.GameData)
local v_u_8 = require(game.ReplicatedStorage.EternityNum)
local v_u_9 = script:WaitForChild("ConsumableItem")
local v_u_10 = game.ReplicatedStorage:WaitForChild("ItemThumbnails")
local v_u_11 = v_u_6.VariantOverheadDesigns
local v_u_12 = v_u_6.OverheadDesigns
local v_u_13 = require(game.ReplicatedStorage.Modules.TweenHandler)
local v_u_14 = require(game.ReplicatedStorage.DupedRarities)
local v_u_15 = {
    [1] = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(1, 1, 1)),
    [10] = ColorSequence.new(Color3.new(0.666667, 0, 1), Color3.new(1, 1, 1)),
    [100] = ColorSequence.new(Color3.new(0, 0, 1), Color3.new(1, 1, 1)),
    [1000] = ColorSequence.new(Color3.new(0.333333, 1, 0), Color3.new(1, 1, 1)),
    [10000] = ColorSequence.new(Color3.new(1, 1, 0), Color3.new(1, 1, 1)),
    [100000] = ColorSequence.new(Color3.new(1, 0.666667, 0), Color3.new(1, 1, 1)),
    [1000000] = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1))
}
local v_u_16 = nil
local v_u_17 = nil
function showItemDescription(p_u_18, p19, p20, p21, p22, p23)
    -- upvalues: (ref) v_u_4, (ref) v_u_17, (ref) v_u_16
    hideExtraInfo()
    local v24 = v_u_4:Clone()
    v24.Archivable = false
    local v25 = v24.Wrapper
    v25.ItemName.Text = p19
    v25.Yapping.Description.Text = p20
    v25.Yapping.Lore.Text = p21
    if p22 then
        v25.SourceLabel.Visible = true
        v25.Source.Text = p22
    else
        v25.SourceLabel.Visible = false
        v25.Source.Text = ""
    end
    v25.SourceLabel.Text = p23 or v25.SourceLabel.Text
    v_u_17 = p_u_18
    v_u_16 = v24
    showExtraInfo(p_u_18)
    local v_u_26 = os.clock()
    p_u_18:SetAttribute("__LeavConSet", v_u_26)
    local v_u_27 = nil
    v_u_27 = p_u_18.MouseLeave:Connect(function()
        -- upvalues: (copy) p_u_18, (copy) v_u_26, (ref) v_u_27
        local _ = p_u_18.Name == "PreviewWrapper"
        if v_u_26 == p_u_18:GetAttribute("__LeavConSet") then
            hideExtraInfo(p_u_18)
        else
            v_u_27:Disconnect()
        end
    end)
end
function applyTier(p28, p29)
    local v30 = game:GetService("ReplicatedStorage").Tiers:FindFirstChild(p28.Name)
    if not p28 then
        v30 = game:GetService("ReplicatedStorage").Tiers.Placeholder
    end
    local v31 = v30:FindFirstChildOfClass("UIGradient", true)
    local v32
    if v31 then
        v32 = v31.Color
    else
        v32 = ColorSequence.new(v30.TextColor3)
    end
    p29.Wrapper.UIStroke.UIGradient.Color = v32
    return v30
end
function showExtraInfo(p_u_33)
    -- upvalues: (copy) v_u_3, (ref) v_u_16
    local v_u_34 = Instance.new("Frame")
    v_u_34.Size = UDim2.fromOffset(p_u_33.AbsoluteSize.X, p_u_33.AbsoluteSize.Y)
    v_u_34.Position = UDim2.fromOffset(p_u_33.AbsolutePosition.X, p_u_33.AbsolutePosition.Y)
    v_u_34.BackgroundTransparency = 1
    v_u_34.Parent = v_u_3
    local v_u_35 = p_u_33:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        -- upvalues: (copy) v_u_34, (copy) p_u_33
        v_u_34.Size = UDim2.fromOffset(p_u_33.AbsoluteSize.X, p_u_33.AbsoluteSize.Y)
        v_u_34.Position = UDim2.fromOffset(p_u_33.AbsolutePosition.X, p_u_33.AbsolutePosition.Y)
    end)
    local v_u_36 = p_u_33:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        -- upvalues: (copy) v_u_34, (copy) p_u_33
        v_u_34.Size = UDim2.fromOffset(p_u_33.AbsoluteSize.X, p_u_33.AbsoluteSize.Y)
        v_u_34.Position = UDim2.fromOffset(p_u_33.AbsolutePosition.X, p_u_33.AbsolutePosition.Y)
    end)
    v_u_34.Destroying:Connect(function()
        -- upvalues: (copy) v_u_35, (copy) v_u_36
        v_u_35:Disconnect()
        v_u_36:Disconnect()
    end)
    local v37 = p_u_33.AbsolutePosition + p_u_33.AbsoluteSize
    local v38 = workspace.CurrentCamera.ViewportSize
    local v39 = v37.X - v38.X / 2
    local v40 = v37.Y - v38.Y / 2
    local v41 = math.sign(v39)
    local v42 = math.sign(v40)
    local v43 = math.max(0, v41)
    local v44 = math.max(0, v42)
    local _ = 1 - math.abs(v39) * 2 / v38.X
    local _ = 1 - math.abs(v40) * 2 / v38.Y
    v_u_16.AnchorPoint = Vector2.new(v43, v44)
    v_u_16.Position = UDim2.new(v43, v41 * -10, 1 - v44, v42 * -10)
    v_u_16.Parent = v_u_34
    v_u_16.Size = UDim2.fromOffset(v38.X / 1.8, v38.Y / 1.8)
    v_u_16.Visible = true
    v_u_16 = v_u_34
end
function hideExtraInfo(p45)
    -- upvalues: (ref) v_u_17, (ref) v_u_16
    if not p45 or p45 == v_u_17 then
        if v_u_16 then
            v_u_16:Destroy()
            v_u_16 = nil
            v_u_17 = nil
        end
    end
end
local v_u_46 = game:GetService("TweenService")
function applyHoverAnim(p_u_47, p_u_48)
    -- upvalues: (copy) v_u_13, (copy) v_u_46
    local function v_u_49()
        -- upvalues: (copy) p_u_47, (ref) v_u_13, (ref) v_u_46
        if p_u_47.Parent then
            if not p_u_47:GetAttribute("LockedHover") then
                v_u_13.HandleTween(p_u_47, v_u_46:Create(p_u_47.Wrapper, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                }))
            end
        else
            return
        end
    end
    local function v_u_50()
        -- upvalues: (copy) p_u_47, (ref) v_u_13, (ref) v_u_46
        if p_u_47.Parent then
            v_u_13.HandleTween(p_u_47, v_u_46:Create(p_u_47.Wrapper, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.new(1, 10, 1, 10)
            }))
        end
    end
    p_u_47.Wrapper.MouseLeave:Connect(v_u_49)
    p_u_47.Wrapper.MouseEnter:Connect(v_u_50)
    p_u_47:GetAttributeChangedSignal("LockedHover"):Connect(function()
        -- upvalues: (copy) p_u_47, (copy) v_u_50, (copy) v_u_49
        if p_u_47:GetAttribute("LockedHover") then
            v_u_50()
        else
            v_u_49()
        end
    end)
    p_u_47.Wrapper.ClickTrigger.MouseEnter:Connect(function()
        -- upvalues: (copy) p_u_48, (copy) p_u_47
        p_u_48(p_u_47.Wrapper)
    end)
    p_u_47.Wrapper.ClickTrigger.MouseLeave:Connect(function()
        -- upvalues: (copy) p_u_47
        hideExtraInfo(p_u_47.Wrapper)
    end)
    p_u_47.AncestryChanged:Connect(function()
        -- upvalues: (copy) p_u_47
        if not p_u_47.Parent then
            hideExtraInfo(p_u_47.Wrapper)
        end
    end)
end
function v1.RenderIndexItems(p_u_51, p52, p53)
    -- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_7
    local v54 = p_u_51.Rarity or p_u_51.Requirement
    local v55 = p_u_51.ConvertedRNG or (p_u_51.Rarity or p_u_51.Requirement)
    local v_u_56 = not p53 and true or p53[p_u_51.Name]
    if v54 and (p_u_51.ConvertedRNG == nil or (p_u_51.ConvertedRNG > 0 or v_u_56)) then
        if not p_u_51.Rarity or (p_u_51.Rarity > 0 or v_u_56) then
            local v_u_57 = script.TemplateItem:Clone()
            local v58 = math.log10(v54)
            v_u_57.LayoutOrder = math.floor(v58)
            local v59 = not v_u_56 and v_u_12:FindFirstChild("Basic") or (p52:FindFirstChild(p_u_51.Name) or v_u_12:FindFirstChild("Basic"))
            local v60 = (v59:FindFirstChild("Label") or v59:FindFirstChild("TextLabel")):Clone()
            local v61 = (v59:FindFirstChild("RNG") or v60):Clone()
            v60.Text = not v_u_56 and "???" or v60.Text
            v60.Size = UDim2.new(1, 0, 1, 0)
            v60.Position = UDim2.new(0, 0, 0, 0)
            v61.Size = UDim2.new(1, 0, 1, 0)
            v61.Position = UDim2.new(0, 0, 0, 0)
            v61.Text = v_u_8.short(v54)
            local _, v62, v63 = v_u_7:GetTierFromRNG(v55)
            if v_u_56 then
                applyTier(v62, v_u_57)
            end
            local v64 = v_u_57.Wrapper
            v60.Parent = v64.Title
            v61.Parent = v64.RNG
            local function v71(p65)
                -- upvalues: (copy) v_u_57, (ref) v_u_56, (copy) p_u_51
                local v66 = showItemDescription
                local v67 = p65 or v_u_57.Wrapper
                local v68 = v_u_56 and p_u_51.Name or "Undiscovered"
                local v69
                if v_u_56 then
                    v69 = p_u_51.Description or "No Description Available"
                else
                    v69 = string.gsub(p_u_51.Description or "No Description Available", "%S", "?")
                end
                local v70
                if v_u_56 then
                    v70 = p_u_51.Lore or "No Lore Available"
                else
                    v70 = string.gsub(p_u_51.Lore or "No Lore Available", "%S", "?")
                end
                v66(v67, v68, v69, v70, p_u_51.Credits and "Created by " .. p_u_51.Credits or "No Credits Available", "Credits")
            end
            applyHoverAnim(v_u_57, v71)
            return v_u_57, v71, v60, v_u_56, v63, v55
        end
    end
end
function getCount(p72)
    local v73 = 0
    for _, _ in p72 do
        v73 = v73 + 1
    end
    return v73
end
local v_u_74 = require(game.ReplicatedStorage.Modules.TranslateBuffKeys)
local v_u_75 = require(game.ReplicatedStorage.Modules.EnchantIconGenerator)
function v1.RenderEnchantItems(p76)
    -- upvalues: (copy) v_u_75, (copy) v_u_12, (copy) v_u_7, (copy) v_u_74
    local v_u_77 = script.TemplateItem:Clone()
    v_u_77.Visible = true
    local v78 = v_u_75(getCount(p76) - (table.find(p76, "_SPLIT") and 1 or 0), v_u_12.Basic.Label, nil, true)
    v78.Size = UDim2.fromScale(0.9, 0.9)
    v78.IsLocked.Visible = table.find(p76, "_SPLIT")
    v78.Parent = v_u_77.Wrapper
    local v79 = 0
    local v_u_80 = ""
    local v81 = {}
    local v82 = 1
    for _, v83 in p76 do
        if v83 ~= "_SPLIT" then
            v79 = v79 + 1
            local v84 = v83["1"] or v83[1]
            local v85 = v83["2"] or v83[2]
            local v86 = v_u_7.Enchants[v84]
            if v86 then
                local v87 = v86[v85]
                if v87 then
                    v82 = v82 * v87.Rarity
                    v_u_75(v85, (game:GetService("ReplicatedStorage").EnchantOverheadDesigns:FindFirstChild(v87.Name) or game:GetService("ReplicatedStorage").EnchantOverheadDesigns.Debug):FindFirstChild("Label"), true).Parent = v78:FindFirstChild((tostring(v79))).Label
                    for v88, v89 in v87.EnchantStats do
                        if v81[v88] then
                            v81[v88] = v81[v88] + v89
                        else
                            v81[v88] = v89
                        end
                    end
                    if v87.Attributes then
                        v_u_80 = v_u_80 .. v87.Description .. "\n"
                    end
                end
            end
        end
    end
    for v90, v91 in v81 do
        v_u_80 = v_u_80 .. v_u_74(v90, v91) .. "\n"
    end
    local function v93(p92)
        -- upvalues: (copy) v_u_77, (ref) v_u_80
        showItemDescription(p92 or v_u_77.Wrapper, "Enchantment Orb", v_u_80, "")
    end
    local _, v94 = v_u_7:GetTierFromRNG(v82)
    applyHoverAnim(v_u_77, v93)
    return v_u_77, v93, v82, applyTier(v94, v_u_77), v94
end
function v1.RenderAuraSlot(p95, p96, _, p97)
    -- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_11, (copy) v_u_15
    local v98 = p95["1"] or p95[1]
    local v99 = p95["2"] or p95[2]
    local v100 = p95["3"] or p95[3]
    local v101 = p95["4"] or p95[4]
    local v_u_102 = p95["5"] or p95[5]
    local v103 = v98 or p95["1"]
    local v104, v105 = v_u_7:GetDesignFromRNG(v103, v101)
    local v_u_106 = v105 or v104
    local v_u_107 = v_u_7:GetDesignFromString(v_u_106, v101)
    if v105 then
        v98 = v_u_107.ConvertedRNG ~= -3 and v_u_107.ConvertedRNG or (v_u_107.actualRNG or v98)
    end
    if p97 then
        if require(v_u_6.AuraDesigns[v_u_106]).Untradeable or v100 == 0 then
            return
        end
        for _, v108 in pairs(v_u_14) do
            if v108[1] == v_u_106 and (v108[2] == v99 and (v108[3] == v100 and v108[4] == v101)) then
                return
            end
        end
    end
    local v_u_109 = script.InventoryItem:Clone()
    v_u_109.Visible = true
    if p96 then
        v_u_109.Name = p96 or ""
        local v110 = p96:split("_")[2]
        local v111
        if tonumber(v110) then
            local v112 = tonumber(v110)
            v111 = math.round(v112) or 0
        else
            v111 = 0
        end
        v_u_109.LayoutOrder = -v111
    end
    local v113 = v_u_12:WaitForChild(v_u_106)
    local v114 = (v113:FindFirstChild("Label") or v113:FindFirstChild("TextLabel")):Clone()
    v114.Size = UDim2.new(1, 0, 1, 0)
    v114.Position = UDim2.new(0, 0, 0, 0)
    v114.AnchorPoint = Vector2.new(0, 0)
    local v115 = (v113:FindFirstChild("RNG") or v114):Clone()
    v115.Size = UDim2.new(1, 0, 1, 0)
    v115.Position = UDim2.new(0, 0, 0, 0)
    v115.AnchorPoint = Vector2.new(0, 0)
    v115.Text = v_u_8.short(v103)
    v115.Size = UDim2.fromScale(1, 1)
    local v116 = v_u_109.Wrapper
    local v117 = ""
    if v99 > 0 then
        local v118 = v_u_11:FindFirstChild(v_u_7.Variants[v99].Name or "None"):FindFirstChild("TextLabel"):Clone()
        v118.Size = UDim2.new(1, 0, 1, 0)
        v118.Position = UDim2.new(0, 0, 0, 0)
        v118.Parent = v116.Variant
        if v118:FindFirstChildOfClass("UIGradient") then
            local v119 = v118:FindFirstChildOfClass("UIGradient").Color.Keypoints
            table.sort(v119, function(p120, p121)
                local _, v122, v123 = p120.Value:ToHSV()
                local _, v124, v125 = p121.Value:ToHSV()
                return v124 < v122 and true or v125 < v123
            end)
            local v126 = v119[1].Value
            local v127 = v126.R * 255
            local v128 = math.round(v127)
            local v129 = v126.G * 255
            local v130 = math.round(v129)
            local v131 = v126.B * 255
            v117 = ("\nThis Aura radiates %* Variant. Changes the Aura(s) color."):format((("<font color=\"rgb(%*,%*,%*)\">%*</font>"):format(v128, v130, math.round(v131), v_u_7.Variants[v99].Name)))
        end
        v98 = v98 * v_u_7.Variants[v99].Rarity
        v115.Text = v_u_8.short(v103 * v_u_7.Variants[v99].Rarity)
    end
    local _, v132 = v_u_7:GetTierFromRNG(v98, v_u_102)
    applyTier(v132, v_u_109)
    if v_u_102 then
        v_u_109.Wrapper.isHardcore.Visible = true
    end
    local v133 = v_u_109.Wrapper.Serial
    local v134
    if v100 == nil then
        v134 = false
    else
        v134 = v100 ~= -1
    end
    v133.Visible = v134
    if v100 then
        v_u_109.Wrapper.Serial.Text = "{#" .. v100 .. "}"
        v_u_109.Wrapper.Serial.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1))
        for v135, v136 in v_u_15 do
            if v100 <= v135 then
                v_u_109.Wrapper.Serial.UIGradient.Color = v136
                break
            end
        end
    end
    v114.Parent = v116.Title
    v115.Parent = v116.RNG
    local v137 = v_u_107.Description
    if v_u_102 then
        v117 = v117 .. "\nThis Aura is rolled in \240\159\148\165HARDCORE\240\159\148\165 mode. Raises it\'s value by x250 times!" or v117
    end
    local v138
    if v117 or v137 then
        v138 = ("%*%*"):format(v137 or "No Description Available", v117) or nil
    else
        v138 = nil
    end
    local v_u_139 = v138
    local function v141(p140)
        -- upvalues: (copy) v_u_109, (copy) v_u_102, (copy) v_u_106, (ref) v_u_139, (copy) v_u_107
        showItemDescription(p140 or v_u_109.Wrapper, (v_u_102 and "\240\159\148\165HARDCORE\240\159\148\165 " or "") .. v_u_106, v_u_139, v_u_107.Lore or "No Lore Available", "Created by " .. v_u_107.Credits or "No Credits Available", "Credits")
    end
    applyHoverAnim(v_u_109, v141)
    return v_u_109, v141, v98
end
function v1.GetItemRNG(_) end
function v1.RenderConsumableItems(p_u_142, p143, p144)
    -- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (ref) v_u_5
    local v145 = false
    if not p_u_142.Locked then
        local v_u_146 = p_u_142.Name or p143
        local v_u_147 = v_u_7.Items[v_u_146]
        if v_u_147 and (not p144 or v_u_147.Tradable ~= false) then
            local v_u_148 = v_u_9:Clone()
            v_u_148.Visible = true
            local v149 = nil
            local v_u_150 = nil
            local v_u_151 = nil
            local v_u_152 = nil
            local v153 = nil
            local v154 = v_u_10:FindFirstChild(v_u_146) or v_u_10:FindFirstChild("Template")
            local v155
            if v154:IsA("ModuleScript") then
                v155, v149, v_u_150, v_u_151, v_u_152, v153 = require(v154)(p_u_142.Attributes)
            else
                v155 = v154:Clone()
            end
            v155.Name = "Thumbnail"
            v155.Parent = v_u_148.Wrapper
            local v156
            if p_u_142.Count then
                if getmetatable(p_u_142) then
                    local v_u_157 = p_u_142:OnChange("Count"):Connect(function()
                        -- upvalues: (copy) v_u_148, (copy) p_u_142
                        v_u_148.Wrapper.Count.Text = "x" .. p_u_142.Count
                    end)
                    v_u_148.AncestryChanged:Connect(function()
                        -- upvalues: (copy) v_u_148, (copy) v_u_157
                        if not v_u_148.Parent then
                            v_u_157:Disconnect()
                        end
                    end)
                end
                v_u_148.Wrapper.Count.Text = "x" .. p_u_142.Count
                v_u_148.Wrapper.Count.Visible = true
                v_u_148.LayoutOrder = v_u_148.LayoutOrder - #v_u_7.Tiers
                v156 = p_u_142.Count > 0
            else
                v145 = true
                v156 = true
            end
            local v158, v159 = v_u_7:GetTierFromString(v149 or (v_u_147.Tier or "Common"))
            local v160 = applyTier(v158, v_u_148)
            v_u_148.LayoutOrder = v_u_148.LayoutOrder - v159
            local v161 = v_u_147.Consumable and (v_u_147.CanUseOnHardcore or not v_u_5)
            if v161 then
                if v156 then
                    v156 = not v153
                end
            else
                v156 = v161
            end
            local function v163(p162)
                -- upvalues: (copy) v_u_148, (ref) v_u_151, (copy) v_u_146, (ref) v_u_152, (copy) v_u_147, (ref) v_u_150
                showItemDescription(p162 or v_u_148.Wrapper, v_u_151 or v_u_146, (v_u_152 or (v_u_147.Description or "")) .. (v_u_150 or ""), v_u_147.Lore or "", v_u_147.Sources, "Sources")
            end
            applyHoverAnim(v_u_148, v163)
            return v_u_148, v163, v_u_147, v145, v156, v158, v160, v_u_151 or v_u_146
        end
    end
end
return v1