-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("RunService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("GameData"))
local v_u_3 = require(script.EternityNumber)
local v_u_4 = game.ReplicatedStorage:WaitForChild("NotifyCloverScore")
local v_u_5 = v1:IsServer() and require(game.Workspace.CloverDropper.CloverSpawningScript.SproutHandler) or nil
local v_u_6 = v1:IsServer() and require(game.ServerStorage.PlayerRolledThing) or nil
local v_u_7 = {
    100,
    500,
    2500,
    10000,
    50000,
    1000000
}
return {
    ["CloverCollector"] = {
        ["QuestDescription"] = "Collect <font color=\"rgb(46, 204, 113)\">INSERTREQUIREMENTAMOUNTHERE Clovers</font>",
        ["Requirements"] = {
            100,
            1000,
            10000,
            (1 / 0)
        },
        ["Rewards"] = { 50, 500, 5000 },
        ["ProgressMethod"] = function(p_u_8, p_u_9)
            game.ReplicatedStorage.CloverCaught.Event:Connect(function(p10, _)
                -- upvalues: (copy) p_u_8, (copy) p_u_9
                if p10.UserId == p_u_8.UserId then
                    p_u_9.CurrentGlobalQuest.CloverCollector.Progress = p_u_9.CurrentGlobalQuest.CloverCollector.Progress + 1
                end
            end)
        end,
        ["OnLevelUp"] = function(p11, p12, p13, p14)
            -- upvalues: (copy) v_u_4
            p12.CurrentGlobalQuest.CloverPoints = p12.CurrentGlobalQuest.CloverPoints + p13
            p12.CurrentGlobalQuest.CloverScore = p12.CurrentGlobalQuest.CloverScore + p13
            v_u_4:FireClient(p11, "Congratulations on completing level " .. tostring(p14) .. " of the Clover Catcher Quest, you\'ve been awarded " .. tostring(p13) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 0
    },
    ["RareCloverCollector"] = {
        ["QuestDescription"] = "Collect a total of <font color=\"rgb(46, 204, 113)\">INSERTREQUIREMENTAMOUNTHERE Clover RNG</font>",
        ["Requirements"] = {
            1000,
            10000,
            500000,
            1000000,
            25000000,
            100000000
        },
        ["Rewards"] = {
            10,
            35,
            250,
            1000,
            16161,
            34343
        },
        ["ProgressMethod"] = function(p_u_15, p_u_16)
            -- upvalues: (copy) v_u_2
            game.ReplicatedStorage.CloverCaught.Event:Connect(function(p17, p18)
                -- upvalues: (copy) p_u_15, (copy) p_u_16, (ref) v_u_2
                if p17.UserId == p_u_15.UserId then
                    p_u_16.CurrentGlobalQuest.RareCloverCollector.Progress = p_u_16.CurrentGlobalQuest.RareCloverCollector.Progress + (not v_u_2.Variants[p18] or v_u_2.Variants[p18].Rarity or (v_u_2.Variants[p18].RNG or 0))
                end
            end)
        end,
        ["OnLevelUp"] = function(p19, p20, p21, p22)
            -- upvalues: (copy) v_u_4
            p20.CurrentGlobalQuest.CloverPoints = p20.CurrentGlobalQuest.CloverPoints + p21
            p20.CurrentGlobalQuest.CloverScore = p20.CurrentGlobalQuest.CloverScore + p21
            v_u_4:FireClient(p19, "Congratulations on completing level " .. tostring(p22) .. " of the Rare Clover Catcher Quest, you\'ve been awarded " .. tostring(p21) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 1
    },
    ["HighRoller"] = {
        ["QuestDescription"] = "Roll a <font color=\"rgb(41, 128, 185)\">INSERTREQUIREMENTAMOUNTHERE RNG Aura</font>",
        ["Requirements"] = {
            100,
            10000,
            1000000,
            10000000,
            1000000000,
            100000000000,
            1000000000000,
            100000000000000,
            1000000000000000,
            1e17,
            1e18
        },
        ["Rewards"] = {
            3,
            5,
            10,
            25,
            10,
            100,
            1000,
            5000,
            10000,
            15000,
            20000
        },
        ["ProgressMethod"] = function(p23, p_u_24)
            -- upvalues: (copy) v_u_6
            v_u_6.Signal:Connect(function(_, p25)
                -- upvalues: (copy) p_u_24
                p_u_24.CurrentGlobalQuest.HighRoller.Progress = p_u_24.CurrentGlobalQuest.HighRoller.Progress < p25.Value and p25.Value or p_u_24.CurrentGlobalQuest.HighRoller.Progress
            end):LinkToInstance(p23)
        end,
        ["OnLevelUp"] = function(p26, p27, p28, p29)
            -- upvalues: (copy) v_u_4
            p27.CurrentGlobalQuest.CloverPoints = p27.CurrentGlobalQuest.CloverPoints + p28
            p27.CurrentGlobalQuest.CloverScore = p27.CurrentGlobalQuest.CloverScore + p28
            v_u_4:FireClient(p26, "Congratulations on completing level " .. tostring(p29) .. " of the High Roller Quest, you\'ve been awarded " .. tostring(p28) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 2
    },
    ["GlobalRolls"] = {
        ["QuestDescription"] = "Roll <font color=\"rgb(52, 152, 219)\">INSERTREQUIREMENTAMOUNTHERE Times</font>",
        ["Requirements"] = { 1000000 },
        ["Rewards"] = { 0 },
        ["ProgressMethod"] = function(p_u_30, p_u_31)
            -- upvalues: (copy) v_u_4
            game.ServerScriptService.CloverGlobalQuests.GlobalQuestUpdate.Event:Connect(function(p32)
                -- upvalues: (copy) p_u_31, (ref) v_u_4, (copy) p_u_30
                p_u_31.CurrentGlobalQuest.GlobalRolls.Progress = p32.Rolls
                local v33 = 0
                for v34, _ in p_u_31.CurrentGlobalQuest.GlobalRolls.Ticks do
                    if tonumber(v34) < p32.Tick then
                        v33 = v33 + p_u_31.CurrentGlobalQuest.GlobalRolls.Ticks[v34]
                        p_u_31.CurrentGlobalQuest.GlobalRolls.Ticks[v34] = nil
                    end
                end
                local v35 = math.floor(v33)
                if v35 > 0 then
                    p_u_31.CurrentGlobalQuest.CloverPoints = p_u_31.CurrentGlobalQuest.CloverPoints + v35
                    p_u_31.CurrentGlobalQuest.CloverScore = p_u_31.CurrentGlobalQuest.CloverScore + v35
                    v_u_4:FireClient(p_u_30, "Thank you for participating on the Global Rolls Quest, you\'ve been awarded " .. tostring(v35) .. " Clover Points for your previous contributions!")
                end
            end)
        end,
        ["OnLevelUp"] = function(_, _, _, _) end,
        ["FormatReward"] = function()
            -- upvalues: (copy) v_u_3
            local v36 = require(game.ReplicatedStorage.ClientDataParser)
            local v37 = 0
            for v38, _ in v36.CurrentGlobalQuest.GlobalRolls.Ticks do
                v37 = v37 + v36.CurrentGlobalQuest.GlobalRolls.Ticks[v38]
            end
            local v39 = math.floor(v37)
            return "\240\159\141\128 " .. v_u_3.short(v39, 2) .. " Clover Points"
        end,
        ["LayoutOrder"] = 3
    },
    ["SproutHunter"] = {
        ["QuestDescription"] = "Defeat <font color=\"rgb(27, 199, 0)\">INSERTREQUIREMENTAMOUNTHERE Clover Sprouts</font>",
        ["Requirements"] = {
            3,
            10,
            25,
            50,
            100,
            250,
            500,
            1000,
            3333,
            10000
        },
        ["Rewards"] = {
            15,
            75,
            150,
            250,
            500,
            1000,
            2000,
            3000,
            6767,
            50000
        },
        ["ProgressMethod"] = function(p_u_40, p_u_41)
            -- upvalues: (copy) v_u_5
            v_u_5.SproutDefeatSignal:Connect(function(p42)
                -- upvalues: (copy) p_u_40, (copy) p_u_41
                if p42 == p_u_40 then
                    p_u_41.CurrentGlobalQuest.SproutHunter.Progress = p_u_41.CurrentGlobalQuest.SproutHunter.Progress + 1
                end
            end)
        end,
        ["OnLevelUp"] = function(p43, p44, p45, p46)
            -- upvalues: (copy) v_u_4
            p44.CurrentGlobalQuest.CloverPoints = p44.CurrentGlobalQuest.CloverPoints + p45
            p44.CurrentGlobalQuest.CloverScore = p44.CurrentGlobalQuest.CloverScore + p45
            v_u_4:FireClient(p43, "Congratulations on completing level " .. tostring(p46) .. " of the Sprout Hunter Quest, you\'ve been awarded " .. tostring(p45) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 4
    },
    ["VariantSproutHunter"] = {
        ["QuestDescription"] = "INSERTREQUIREMENTAMOUNTHERE",
        ["Requirements"] = {
            1,
            1,
            1,
            1,
            1,
            1
        },
        ["Rewards"] = {
            25,
            50,
            100,
            350,
            500,
            1000
        },
        ["ProgressMethod"] = function(p_u_47, p_u_48)
            -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_7
            v_u_5.SproutDefeatSignal:Connect(function(p49, p50)
                -- upvalues: (copy) p_u_47, (ref) v_u_2, (ref) v_u_7, (copy) p_u_48
                if p49 == p_u_47 then
                    local v51 = v_u_2.Variants[p50]
                    local v52 = v_u_7[p_u_48.CurrentGlobalQuest.VariantSproutHunter.Level + 1]
                    if v52 then
                        if (v51.Rarity or v51.RNG) >= v52 then
                            p_u_48.CurrentGlobalQuest.VariantSproutHunter.Progress = p_u_48.CurrentGlobalQuest.VariantSproutHunter.Progress + 1
                        end
                    else
                        return
                    end
                else
                    return
                end
            end)
        end,
        ["FormatDescriptionMethod"] = function(_, p53)
            -- upvalues: (copy) v_u_7, (copy) v_u_2
            local v54 = v_u_7[p53.CurrentGlobalQuest.VariantSproutHunter.Level + 1] or v_u_7[p53.CurrentGlobalQuest.VariantSproutHunter.Level]
            local v55 = nil
            for _, v56 in v_u_2.Variants do
                if (v56.Rarity or v56.RNG) == v54 then
                    v55 = v56
                end
            end
            return not v55 and "There\'s no variant." or ("Defeat a <font color=\"#%*\">%*+</font> <font color=\"rgb(27, 199, 0)\">Clover Sprout</font>"):format(game.ReplicatedStorage.VariantOverheadDesigns:FindFirstChild(v55.Name).TextLabel:FindFirstChildWhichIsA("UIGradient").Color.Keypoints[1].Value:ToHex(), v55.Name)
        end,
        ["OnLevelUp"] = function(p57, p58, p59, p60)
            -- upvalues: (copy) v_u_4
            p58.CurrentGlobalQuest.CloverPoints = p58.CurrentGlobalQuest.CloverPoints + p59
            p58.CurrentGlobalQuest.CloverScore = p58.CurrentGlobalQuest.CloverScore + p59
            v_u_4:FireClient(p57, "Congratulations on completing level " .. tostring(p60) .. " of the Variant Sprout Hunter Quest, you\'ve been awarded " .. tostring(p59) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 5
    },
    ["SproutContributor"] = {
        ["QuestDescription"] = "Contribute INSERTREQUIREMENTAMOUNTHERE RNG to <font color=\"rgb(27, 199, 0)\">Clover Sprouts</font>",
        ["Requirements"] = {
            100,
            10000,
            1000000,
            10000000,
            1000000000,
            100000000000,
            1000000000000,
            100000000000000,
            1000000000000000,
            1e17
        },
        ["Rewards"] = {
            3,
            5,
            10,
            25,
            10,
            100,
            1000,
            10000,
            15000,
            20000
        },
        ["ProgressMethod"] = function(p_u_61, p_u_62)
            -- upvalues: (copy) v_u_5
            v_u_5.SproutContributedSignal:Connect(function(p63, p64, _)
                -- upvalues: (copy) p_u_61, (copy) p_u_62
                if p63 == p_u_61 then
                    p_u_62.CurrentGlobalQuest.SproutContributor.Progress = p_u_62.CurrentGlobalQuest.SproutContributor.Progress + p64
                end
            end)
        end,
        ["OnLevelUp"] = function(p65, p66, p67, p68)
            -- upvalues: (copy) v_u_4
            p66.CurrentGlobalQuest.CloverPoints = p66.CurrentGlobalQuest.CloverPoints + p67
            p66.CurrentGlobalQuest.CloverScore = p66.CurrentGlobalQuest.CloverScore + p67
            v_u_4:FireClient(p65, "Congratulations on completing level " .. tostring(p68) .. " of the Sprout Contributor Quest, you\'ve been awarded " .. tostring(p67) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 6
    },
    ["SproutBooster"] = {
        ["QuestDescription"] = "Get INSERTREQUIREMENTAMOUNTHEREx Total Luck Multipliers from <font color=\"rgb(27, 199, 0)\">Clover Sprouts</font>",
        ["Requirements"] = {
            100,
            10000,
            1000000,
            10000000,
            1000000000,
            100000000000,
            1000000000000,
            100000000000000
        },
        ["Rewards"] = {
            10,
            25,
            100,
            250,
            750,
            1000,
            5000,
            10000
        },
        ["ProgressMethod"] = function(p_u_69, p_u_70)
            -- upvalues: (copy) v_u_5
            v_u_5.SproutLuckBoostSignal:Connect(function(p71, p72, _)
                -- upvalues: (copy) p_u_69, (copy) p_u_70
                if p71 == p_u_69 then
                    p_u_70.CurrentGlobalQuest.SproutBooster.Progress = p_u_70.CurrentGlobalQuest.SproutBooster.Progress + p72
                end
            end)
        end,
        ["OnLevelUp"] = function(p73, p74, p75, p76)
            -- upvalues: (copy) v_u_4
            p74.CurrentGlobalQuest.CloverPoints = p74.CurrentGlobalQuest.CloverPoints + p75
            p74.CurrentGlobalQuest.CloverScore = p74.CurrentGlobalQuest.CloverScore + p75
            v_u_4:FireClient(p73, "Congratulations on completing level " .. tostring(p76) .. " of the Sprout Booster Quest, you\'ve been awarded " .. tostring(p75) .. " Clover Points!")
        end,
        ["LayoutOrder"] = 7
    }
}