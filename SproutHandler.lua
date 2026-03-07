-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.FormatNumber.Simple)
local v_u_2 = require(game.ReplicatedStorage.GameData)
local v_u_3 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Effects.SoundPlayer)
require(game.ReplicatedStorage.Modules.TweenHandler)
local v_u_4 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Janitor)
local v_u_5 = require(game.ServerStorage.PlayerRolledThing)
local v_u_6 = script.Sprout
local v_u_7 = require(game.ReplicatedStorage.GameData).Variants
local v8 = require(game.ReplicatedStorage.Modules.ScriptingUtilities.Signal)
local v_u_9 = require(game.ServerScriptService.MainScript:WaitForChild("ItemMethods"):WaitForChild("\"Clover\""))
local v_u_10 = require(game.ServerScriptService.PlayerDataHandler.PlayerDataParser)
local v_u_11 = v_u_2.IS_STUDIO and 20 or 300
local v_u_12 = {}
local v_u_13 = false
function v_u_12.new(p14)
    -- upvalues: (ref) v_u_13, (copy) v_u_6, (copy) v_u_4, (copy) v_u_12
    if not v_u_13 then
        v_u_13 = true
        local v15 = {
            ["Model"] = v_u_6:Clone(),
            ["AccumulatedVariantLuck"] = 1,
            ["Luck"] = 1,
            ["UpgradeCount"] = 0,
            ["RolledVariant"] = 0,
            ["Alpha"] = 0.25,
            ["StateJanitor"] = v_u_4.new(),
            ["GrowthC0"] = CFrame.identity,
            ["GrowthSize"] = Vector3.new(0, 0, 0),
            ["HP"] = 0,
            ["DmgList"] = {}
        }
        v15.GrowthSize = v15.Model.Growth.Size
        v15.GrowthC0 = v15.Model.Growth.Weld.C0
        v15.Model.Parent = workspace
        v15.Model:PivotTo(CFrame.new(p14.SpawnLoc) * CFrame.Angles(0, math.random(0, 360), 0))
        task.spawn(v_u_12.Cycle, v15)
        return v15
    end
end
v_u_12.SproutDamageSignal = v8.new()
v_u_12.SproutLuckBoostSignal = v8.new()
v_u_12.SproutContributedSignal = v8.new()
v_u_12.SproutDefeatSignal = v8.new()
local v_u_16 = {
    1.5,
    2,
    2.5,
    3.5,
    6
}
function v_u_12.Cycle(p_u_17)
    -- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_16, (copy) v_u_7, (copy) v_u_12, (ref) v_u_11
    local v_u_18 = 1
    local v_u_19 = 1
    local v_u_28 = v_u_5.Signal:Connect(function(p20, p21)
        -- upvalues: (ref) v_u_10, (copy) p_u_17, (ref) v_u_16, (ref) v_u_18, (ref) v_u_7, (ref) v_u_19, (ref) v_u_12
        local v22 = v_u_10(p20, nil, true)
        if p21.RollPosition then
            if (p21.RollPosition - p_u_17.Model.Anchor.Position).Magnitude <= 50 then
                local v23 = 1
                if v22 then
                    for _, v24 in v22.Enchants do
                        if v24[1] == "Clover" and v_u_16[v24[2]] then
                            v23 = v23 * v_u_16[v24[2]]
                        end
                    end
                end
                local v25 = v_u_18
                local v26 = p21.Value
                v_u_18 = v25 + math.log10(v26) * v23
                local v27
                if v_u_7[p21.VariantID] then
                    v27 = v_u_7[p21.VariantID].Rarity * v23
                    v_u_19 = v_u_19 + v27
                else
                    v27 = 0
                end
                v_u_12.SproutContributedSignal:Fire(p20, p21.Value * v23, v27)
            end
        else
            return
        end
    end)
    local v_u_29 = 1
    local v_u_30 = 1
    local v_u_31 = 1
    local v_u_32 = false
    local v_u_33 = nil
    p_u_17.StateJanitor:Add(task.spawn(function()
        -- upvalues: (ref) v_u_32, (ref) v_u_18, (ref) v_u_31, (ref) v_u_19, (ref) v_u_29, (ref) v_u_30, (ref) v_u_12, (copy) p_u_17
        while wait(5) and not v_u_32 do
            local v34 = v_u_18
            local v35 = math.log10(v34)
            local v36 = math.round(v35) * v_u_31
            local v37 = v_u_19 ^ 5
            local v38 = math.log(v37) ^ 2
            if v_u_29 ~= v36 or v38 ~= v_u_30 then
                v_u_12.UpgradeLuck(p_u_17, v36, nil, v38)
            end
            local v39 = v_u_29
            v_u_29 = math.max(v36, v39)
            local v40 = v_u_30
            v_u_30 = math.max(v38, v40)
        end
    end))
    p_u_17.StateJanitor:Add(v_u_5.Signal:Connect(function(p41, _)
        -- upvalues: (copy) p_u_17, (ref) v_u_33, (ref) v_u_11, (ref) v_u_12, (ref) v_u_31, (ref) v_u_18, (ref) v_u_19, (ref) v_u_29, (ref) v_u_30, (ref) v_u_32, (copy) v_u_28
        if p41.Character and p41.Character.Parent then
            local v42 = p41.Character.PrimaryPart
            if v42 then
                if (v42.Position - p_u_17.Model.Anchor.Position).Magnitude > 50 then
                    return
                elseif not v_u_33 then
                    v_u_33 = workspace:GetServerTimeNow()
                    local v43 = p_u_17.Model.TimerThingy:Clone()
                    v43.Name = "STimerThingy"
                    v43:SetAttribute("Ended", workspace:GetServerTimeNow() + v_u_11)
                    v43.Parent = p_u_17.Model
                    for v44 = 1, 4 do
                        task.delay(v_u_11 * ((v44 - 0.5) / 4), function()
                            -- upvalues: (ref) v_u_12, (ref) p_u_17, (ref) v_u_31, (ref) v_u_18, (ref) v_u_19, (ref) v_u_29, (ref) v_u_30
                            v_u_12.IncrementGrowth(p_u_17, 1.4)
                            v_u_31 = v_u_31 * 1.25
                            local v45 = v_u_18
                            local v46 = math.log10(v45)
                            local v47 = math.round(v46) * v_u_31
                            local v48 = v_u_19 ^ 5
                            local v49 = math.log(v48) ^ 2
                            if v_u_29 ~= v47 or v49 ~= v_u_30 then
                                v_u_12.UpgradeLuck(p_u_17, v47, nil, v49)
                            end
                            local v50 = v_u_29
                            v_u_29 = math.max(v47, v50)
                            local v51 = v_u_30
                            v_u_30 = math.max(v49, v51)
                        end)
                    end
                    task.delay(v_u_11, function()
                        -- upvalues: (ref) v_u_32, (ref) v_u_12, (ref) p_u_17, (ref) v_u_29, (ref) v_u_30, (ref) v_u_28
                        v_u_32 = true
                        v_u_12.StartBlasting(p_u_17, v_u_29, v_u_30)
                        v_u_28:Disconnect()
                    end)
                end
            else
                return
            end
        else
            return
        end
    end))
end
function v_u_12.UpgradeLuck(p52, p53, p54, p55)
    for _, v56 in p52.Model:QueryDescendants(">#NUpgradeLuck") do
        v56:Destroy()
    end
    local v57 = p52.Model.UpdateLuck:Clone()
    v57:SetAttribute("NoSound", p54)
    v57:SetAttribute("FinalLuck", p53)
    v57:SetAttribute("VarLuck", p55)
    v57.Name = "NUpgradeLuck"
    v57.Enabled = true
    v57.Parent = p52.Model
end
function v_u_12.IncrementGrowth(p58, p59)
    p58.Alpha = p58.Alpha + p59 / 15
    local v60 = p58.Alpha
    local _ = p58.Model.Growth.Weld
    for _, v61 in p58.Model:QueryDescendants(">#SSizeThingy") do
        v61:Destroy()
    end
    local v62 = p58.Model.SizeThingy:Clone()
    local v63 = 1.5 - v60
    if p59 == 0 then
        v62:SetAttribute("Duration", 15)
        v63 = 0.25
    end
    v62:SetAttribute("PlaybackSpeed", v63)
    p58.GrowthSize = p58.GrowthSize * p59
    p58.GrowthC0 = CFrame.new(p58.GrowthC0.Position * p59)
    v62:SetAttribute("Size", p58.GrowthSize)
    v62:SetAttribute("C0", p58.GrowthC0)
    v62.Enabled = true
    v62.Name = "SSizeThingy"
    v62.Parent = p58.Model
end
function CopyProperties(p64, p65)
    p65.TextColor = p64.TextColor
    p65.TextStrokeColor3 = p64.TextStrokeColor3
    p65.TextTransparency = p64.TextTransparency
    p65.TextTransparency = p64.TextTransparency
end
function v_u_12.Blast(p66)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_10, (copy) v_u_9, (copy) v_u_12
    local v67, v68 = v_u_2:GetVariant(p66.AccumulatedVariantLuck, nil)
    local v69 = v_u_2.Variants[v67]
    if v69 and (not v_u_2.Variants[p66.RolledVariant] or v_u_2:GetVariantChanceFromID(p66.RolledVariant) < v68) then
        local v70 = v_u_2
        if v70 then
            v70 = game.ReplicatedStorage.VariantOverheadDesigns:FindFirstChild(v69.Name)
        end
        p66.RolledVariant = v67
        local v71 = v70:FindFirstChild("TextLabel"):Clone()
        local v72 = v71:FindFirstChildOfClass("UIGradient")
        v71.Parent = p66.Model.BillboardGui.VariantName
        if v72 then
            local v73 = v72:Clone()
            local v74 = v73.Color.Keypoints[1].Value
            p66.Model.Growth.Color = v74
            v73.Parent = p66.Model.BillboardGui.CName
            v73.Rotation = v73.Rotation + 180
            CopyProperties(v71, p66.Model.BillboardGui.CName)
        end
        local v75 = game.ReplicatedStorage.VariantAuraDesigns:FindFirstChild(v69.Name)
        if v75 and v75:FindFirstChild("Torso") then
            for _, v76 in v75:FindFirstChild("Torso"):GetChildren() do
                v76:Clone().Parent = p66.Model.Growth
            end
        end
    end
    local v77 = p66.Model.Growth:QueryDescendants(".Emit ParticleEmitter")
    v_u_3(p66.Model.Anchor.Money)
    for _, v78 in v77 do
        v78:Emit(v78.Rate)
    end
    for _, v79 in game.Players:GetPlayers() do
        if v79.Character and (v79.Character.PrimaryPart and (v79.Character.PrimaryPart.Position - p66.Model.Anchor.Position).Magnitude < 50) then
            local v80 = v_u_10(v79, nil, true)
            if not v80 then
                return
            end
            v_u_9(v79, {
                ["Multiplier"] = p66.Luck,
                ["variant"] = p66.RolledVariant
            }, v80)
            v_u_12.SproutLuckBoostSignal:Fire(v79, p66.Luck, p66.RolledVariant)
        end
    end
end
function v_u_12.StartBlasting(p_u_81, p_u_82, p83)
    -- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_10, (copy) v_u_16, (ref) v_u_13
    p_u_81.StateJanitor:Cleanup()
    p_u_81.Luck = p_u_82
    p_u_81.AccumulatedVariantLuck = p83
    for _, v84 in p_u_81.Model:QueryDescendants(">#STimerThingy") do
        v84:Destroy()
    end
    for _, v85 in p_u_81.Model.Growth:QueryDescendants(".Enable PartilceEmitter") do
        v85.Enabled = true
    end
    p_u_81.Model.Anchor.Slot:Play()
    p_u_81.StateJanitor:Add(task.spawn(function()
        -- upvalues: (ref) v_u_12, (copy) p_u_81
        while true do
            wait(math.random(1, 3))
            v_u_12.Blast(p_u_81)
            v_u_12.UpgradeCheck(p_u_81)
        end
    end))
    local v_u_86 = p_u_82 ^ 10
    local v87 = p_u_82 ^ 2
    local v_u_88 = math.round(v87)
    p_u_81.HP = v_u_86
    p_u_81.StateJanitor:Add(task.spawn(function()
        -- upvalues: (ref) v_u_12, (copy) p_u_81, (copy) v_u_86
        while wait(1) do
            v_u_12.UpdateHP(p_u_81, p_u_81.HP, v_u_86)
        end
    end))
    p_u_81.StateJanitor:Add(v_u_5.Signal:Connect(function(p89, p90)
        -- upvalues: (ref) v_u_10, (copy) p_u_81, (ref) v_u_16, (ref) v_u_12
        local v91 = v_u_10(p89, nil, true)
        if p90.RollPosition then
            if (p90.RollPosition - p_u_81.Model.Anchor.Position).Magnitude <= 50 then
                local v92 = 1
                if v91 then
                    for _, v93 in v91.Enchants do
                        if v93[1] == "Clover" and v_u_16[v93[2]] then
                            v92 = v92 * v_u_16[v93[2]]
                        end
                    end
                end
                local v94 = p_u_81
                v94.HP = v94.HP - p90.Value * v92
                v_u_12.SproutDamageSignal:Fire(p89, p90.Value * v92)
                p_u_81.DmgList[p89] = p_u_81.DmgList[p89] or 0
                local v95 = p_u_81.DmgList
                v95[p89] = v95[p89] + p90.Value * v92
            end
        else
            return
        end
    end))
    p_u_81.StateJanitor:Add(function()
        -- upvalues: (ref) v_u_12, (copy) p_u_81, (ref) v_u_10, (copy) v_u_86, (copy) v_u_88, (copy) p_u_82, (ref) v_u_13
        v_u_12.IncrementGrowth(p_u_81, 0)
        v_u_12.UpdateHP(p_u_81, p_u_81.HP, 0)
        if p_u_81.HP <= 0 then
            for v96, v97 in p_u_81.DmgList do
                local v98 = v_u_10(v96, nil, true)
                if v98 then
                    local v99 = v97 / v_u_86
                    local v100 = v_u_88
                    if v99 < 0.1 then
                        v100 = v100 * v99
                    else
                        v_u_12.SproutDefeatSignal:Fire(v96, p_u_81.RolledVariant)
                    end
                    v98:AddItem("Clover Shard", nil, v100)
                    warn("gave", v100, "shards to", v96, v99, p_u_82)
                end
            end
        end
        game.Debris:AddItem(p_u_81.Model, 25)
        table.clear(p_u_81.DmgList)
        table.clear(p_u_81)
        v_u_13 = false
    end)
    p_u_81.StateJanitor:Add(task.delay(300, function()
        -- upvalues: (copy) p_u_81
        p_u_81.StateJanitor:Cleanup()
    end))
end
function v_u_12.UpdateHP(p101, p102, p103)
    -- upvalues: (copy) v_u_1
    local v104 = math.max(0, p102)
    local v105 = v104 / p103
    p101.Model.BillboardGui.HP.Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 128):Lerp(Color3.fromHSV(1, 1, 1), 1 - v105)
    p101.Model.BillboardGui.HP.Bar.Size = UDim2.fromScale(v105, 1)
    p101.Model.BillboardGui.HP.Txt.Text = v_u_1.FormatCompact(v104, ".##")
end
function v_u_12.UpgradeCheck(p106)
    -- upvalues: (copy) v_u_12, (copy) v_u_3
    wait(1)
    if math.random(1, 2) == 1 then
        p106.UpgradeCount = p106.UpgradeCount + 1
        local v107 = p106.UpgradeCount
        local v108 = p106.Model.Anchor
        if v107 < 10 then
            p106.Luck = p106.Luck * Random.new():NextNumber(1, 2) ^ 1.5
            v_u_12.UpgradeLuck(p106, p106.Luck, true)
        end
        if v107 < 8 then
            v_u_3(v108.Spray, v107 * 0.1 + 0.8, v107 * 0.1 + 0.8)
        elseif v107 < 9 then
            v_u_3(v108.AlmostFull)
        else
            if v107 >= 10 then
                return
            end
            v_u_3(v108.Full)
        end
        v_u_12.IncrementGrowth(p106, 1.25)
        wait(3)
    end
end
if v_u_2.IS_RUNTIME then
    v_u_6.Parent = nil
end
return v_u_12