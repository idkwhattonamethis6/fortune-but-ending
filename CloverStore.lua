-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("RunService")
local v_u_2 = game.ReplicatedStorage
local v_u_3 = nil
local v_u_4 = require(game.ReplicatedStorage:WaitForChild("GameData"))
game.ReplicatedStorage:WaitForChild("AuraDesigns")
local v_u_5 = game.ReplicatedStorage.NotifyCloverScore
local v_u_6 = nil
local v_u_7 = nil
if v_u_1:IsServer() then
    v_u_6 = require(game.ServerScriptService.PlayerDataHandler.PlayerDataParser)
    v_u_3 = require(game.ServerStorage.AddAura)
elseif v_u_1:IsClient() then
    v_u_7 = require(game:WaitForChild("ReplicatedStorage"):WaitForChild("ClientDataParser"))
end
local v8 = {}
local v_u_9 = workspace.AlignThingies.BaseItem
function AddAlignItem(p10, p11)
    -- upvalues: (copy) v_u_9
    local v_u_12 = v_u_9:Clone()
    v_u_12.Name = "Item"
    v_u_12.Item.Value = p11
    v_u_12.TargetChar.Value = p10
    p10.Destroying:Connect(function()
        -- upvalues: (copy) v_u_12
        v_u_12:Destroy()
    end)
    local v13 = script:WaitForChild("Cleanup"):Clone()
    v13.Parent = v_u_12
    v13.Enabled = true
    v_u_12.Parent = workspace.AlignThingies
    return v_u_12
end
function HandleFullCharMorph(p14, p15)
    AddAlignItem(p14, p15)
end
local function v_u_24(p16, p17)
    -- upvalues: (copy) v_u_2
    for _, v18 in v_u_2.AuraDesigns:FindFirstChild(p16):GetChildren() do
        if v18.Name == "FullCharMorph" then
            HandleFullCharMorph(p17, v18)
        else
            local v19 = v18:Clone()
            if v19:IsA("Script") and v18.RunContext == Enum.RunContext.Client then
                v19.Enabled = true
            end
            for _, v20 in v19:GetDescendants() do
                if v20.Name == "Theme" and v20:isA("Sound") then
                    v20.Playing = true
                end
                if v20:IsA("Script") and v20.RunContext == Enum.RunContext.Client then
                    v20.Enabled = true
                end
                if v20:IsA("Weld") and (v20.Part0 and p17:FindFirstChild(v20.Part0.Name)) then
                    v20.Part0 = p17:FindFirstChild(v20.Part0.Name)
                end
                if v20:IsA("Motor6D") and (v20.Part0 and p17:FindFirstChild(v20.Part0.Name)) then
                    v20.Part0 = p17:FindFirstChild(v20.Part0.Name)
                end
            end
            for _, v21 in v19:GetChildren() do
                if p17:FindFirstChild(v18.Name) then
                    v21.Parent = p17:FindFirstChild(v18.Name)
                end
            end
            v19:Destroy()
        end
    end
    local v22 = v_u_2.OverheadDesigns:FindFirstChild(p16):Clone()
    local v23 = v22.Brightness
    v22.Brightness = math.max(2, v23)
    v22.ClipsDescendants = false
    v22.Name = "OverHeadRNGUI"
    v22.Parent = p17.Head
end
local function v_u_29(p25, p26)
    -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7
    local v27 = v_u_1:IsServer() and v_u_6(p25) or v_u_7
    for _, v28 in p26 do
        v27:AddItem(v28[1], {}, v28[2])
    end
end
v8["Lucky Pack"] = {
    ["Name"] = "Lucky Pack",
    ["Price"] = 2500,
    ["Description"] = "Luck III, Unusual I.",
    ["OnPurchase"] = function(p30)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v31 = v_u_1:IsServer() and v_u_6(p30) or v_u_7
        local v32 = ("%*_%*"):format(p30.UserId, (workspace:GetServerTimeNow()))
        v31.Inventory.Enchant[v32] = {
            { "Luck", 3 },
            { "Unusual", 1 }
        }
        v_u_5:FireClient(p30, "Congrats on buying the Lucky Pack!")
    end
}
v8["Hyper Luck Pack"] = {
    ["Name"] = "Hyper Luck Pack",
    ["Price"] = 15000,
    ["Description"] = "Fortune, Insight III, Unusual II.",
    ["OnPurchase"] = function(p33)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v34 = v_u_1:IsServer() and v_u_6(p33) or v_u_7
        local v35 = ("%*_%*"):format(p33.UserId, (workspace:GetServerTimeNow()))
        v34.Inventory.Enchant[v35] = {
            { "Luck", 4 },
            { "Unusual", 2 },
            { "Insight", 3 }
        }
        v_u_5:FireClient(p33, "Congrats on buying the Hyper Luck Pack!")
    end
}
v8.Supernatural = {
    ["Name"] = "Supernatural",
    ["Price"] = 40000,
    ["Description"] = "90% more enchant luck.",
    ["OnPurchase"] = function(p36)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v37 = v_u_1:IsServer() and v_u_6(p36) or v_u_7
        local v38 = ("%*_%*"):format(p36.UserId, (workspace:GetServerTimeNow()))
        v37.Inventory.Enchant[v38] = {
            { "Magical", 4 }
        }
        v_u_5:FireClient(p36, "Congrats on buying the Supernatural enchant!")
    end
}
v8["Druid Pack"] = {
    ["Name"] = "Druid Pack",
    ["Price"] = 40000,
    ["Description"] = "Sprout, Clover III, Clover II, Clover I",
    ["OnPurchase"] = function(p39)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v40 = v_u_1:IsServer() and v_u_6(p39) or v_u_7
        local v41 = ("%*_%*"):format(p39.UserId, (workspace:GetServerTimeNow()))
        v40.Inventory.Enchant[v41] = {
            { "Clover", 4 },
            { "Clover", 3 },
            { "Clover", 2 },
            { "Clover", 1 }
        }
        v_u_5:FireClient(p39, "Congrats on buying the Druid Pack!")
    end
}
v8.Requiem = {
    ["Name"] = "Requiem",
    ["Price"] = 125000,
    ["Description"] = "Requiem, 1.5x Luck, 27% Secret Luck, 55% Enchant Luck, 55% Roll Speed, 35% Variant Luck, +2 Multi Roll.",
    ["OnPurchase"] = function(p42)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v43 = v_u_1:IsServer() and v_u_6(p42) or v_u_7
        local v44 = ("%*_%*"):format(p42.UserId, (workspace:GetServerTimeNow()))
        v43.Inventory.Enchant[v44] = {
            { "Requiem", 1 }
        }
        v_u_5:FireClient(p42, "Congrats on buying the Requiem enchant!")
    end
}
v8.Genesis = {
    ["Name"] = "Genesis",
    ["Price"] = 2500000,
    ["Description"] = "Genesis, 3x Luck, 54% Secret Luck, 110% Enchant Luck, 75% Roll Speed, 70% Variant Luck, +4 Multi Roll.",
    ["OnPurchase"] = function(p45)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v46 = v_u_1:IsServer() and v_u_6(p45) or v_u_7
        local v47 = ("%*_%*"):format(p45.UserId, (workspace:GetServerTimeNow()))
        v46.Inventory.Enchant[v47] = {
            { "Requiem", 2 }
        }
        v_u_5:FireClient(p45, "Congrats on buying the Genesis enchant!")
    end
}
v8["Quickroller Pack I"] = {
    ["Name"] = "Quickroller Pack I",
    ["Price"] = 500,
    ["Description"] = "Speed II and Luck I Enchants.",
    ["OnPurchase"] = function(p48)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v49 = v_u_1:IsServer() and v_u_6(p48) or v_u_7
        local v50 = ("%*_%*"):format(p48.UserId, (workspace:GetServerTimeNow()))
        v49.Inventory.Enchant[v50] = {
            { "Speed", 2 },
            { "Luck", 1 }
        }
        v_u_5:FireClient(p48, "Congrats on buying the Quickroller Pack I!")
    end
}
v8["Quickroller Pack II"] = {
    ["Name"] = "Quickroller Pack II",
    ["Price"] = 2500,
    ["Description"] = "Speed III and Luck II Enchants.",
    ["OnPurchase"] = function(p51)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v52 = v_u_1:IsServer() and v_u_6(p51) or v_u_7
        local v53 = ("%*_%*"):format(p51.UserId, (workspace:GetServerTimeNow()))
        v52.Inventory.Enchant[v53] = {
            { "Speed", 3 },
            { "Luck", 2 }
        }
        v_u_5:FireClient(p51, "Congrats on buying the Quickroller Pack II!")
    end
}
v8["Quickroller Pack III"] = {
    ["Name"] = "Quickroller Pack III",
    ["Price"] = 5000,
    ["Description"] = "Blitz and Luck III Enchants, Dupe I.",
    ["OnPurchase"] = function(p54)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v55 = v_u_1:IsServer() and v_u_6(p54) or v_u_7
        local v56 = ("%*_%*"):format(p54.UserId, (workspace:GetServerTimeNow()))
        v55.Inventory.Enchant[v56] = {
            { "Speed", 4 },
            { "Luck", 3 },
            { "Dupe", 1 }
        }
        v_u_5:FireClient(p54, "Congrats on buying the Quickroller Pack III!")
    end
}
v8["Alpha Pack"] = {
    ["Name"] = "Alpha Pack",
    ["Price"] = 222222,
    ["Description"] = "15x Alphas",
    ["OnPurchase"] = function(p57)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local v58 = v_u_1:IsServer() and v_u_6(p57) or v_u_7
        local v59 = ("%*_%*"):format(p57.UserId, (workspace:GetServerTimeNow()))
        v58.Inventory.Enchant[v59] = {
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 },
            { "Alpha", 1 }
        }
        v_u_5:FireClient(p57, "Congrats on buying the Alpha Pack!")
    end
}
v8.Strawberry = {
    ["Name"] = "Strawberry",
    ["Price"] = 1000,
    ["Description"] = "7 minutes of +2 Bulk Roll",
    ["OnPurchase"] = function(p60)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p60, {
            { "Strawberry", 1 }
        })
        v_u_5:FireClient(p60, "Congrats on buying a strawberry!")
    end
}
v8.Blueberry = {
    ["Name"] = "Blueberry",
    ["Price"] = 700,
    ["Description"] = "7 minutes of +50% Roll Speed",
    ["OnPurchase"] = function(p61)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p61, {
            { "Blueberry", 1 }
        })
        v_u_5:FireClient(p61, "Congrats on buying a blueberry!")
    end
}
v8.Mango = {
    ["Name"] = "Mango",
    ["Price"] = 1000,
    ["Description"] = "7 minutes of +50% Variant Luck",
    ["OnPurchase"] = function(p62)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p62, {
            { "Mango", 1 }
        })
        v_u_5:FireClient(p62, "Congrats on buying a mango!")
    end
}
v8.Avocado = {
    ["Name"] = "Avocado",
    ["Price"] = 1500,
    ["Description"] = "7 minutes of +3x Luck Multiplier",
    ["OnPurchase"] = function(p63)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p63, {
            { "Avocado", 1 }
        })
        v_u_5:FireClient(p63, "Congrats on buying a avocado!")
    end
}
v8.Grape = {
    ["Name"] = "Grape",
    ["Price"] = 2000,
    ["Description"] = "7 minutes of +50% Secret Luck",
    ["OnPurchase"] = function(p64)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p64, {
            { "Grape", 1 }
        })
        v_u_5:FireClient(p64, "Congrats on buying a grape!")
    end
}
v8["Ultimate Smoothie"] = {
    ["Name"] = "Ultimate Smoothie",
    ["Price"] = 10000,
    ["Description"] = "7 minutes of +100% Secret Luck, +3.5x Luck Multiplier, +5 Multi Roll, 100% Variant Luck, +150% Roll Speed, +50% Enchant Luck",
    ["OnPurchase"] = function(p65)
        -- upvalues: (copy) v_u_29, (copy) v_u_5
        v_u_29(p65, {
            { "Ultimate Smoothie", 1 }
        })
        v_u_5:FireClient(p65, "Congrats on buying the ultimate smoothie!")
    end
}
v8["Floating Luck"] = {
    ["Name"] = "Floating Luck",
    ["Price"] = 5000,
    ["Description"] = "",
    ["OnPurchase"] = function(p66)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p66)
        local v67 = Random.new()
        local v68 = ""
        local v69 = nil
        for v70, v71 in v_u_4.Variants do
            local v72 = v71.RNG or v71.Rarity
            if v72 >= 1 then
                local v73 = (v72 / 1) ^ 1
                if v67:NextInteger(1, (math.round(v73))) == 1 then
                    v68 = v71.Name .. " "
                    v69 = v70
                end
            end
        end
        v_u_5:FireClient(p66, "Congratulations on buying " .. v68 .. "Floating Luck!")
        v_u_3(p66, true, {
            ["Requirement"] = -7.1,
            ["Dimension"] = "1"
        }, v69, true, false)
    end,
    ["OnClientUpdate"] = function(_, p74)
        -- upvalues: (copy) v_u_24
        v_u_24("Floating Luck", p74)
    end
}
v8["Heavy Pity"] = {
    ["Name"] = "Heavy Pity",
    ["Price"] = 5000,
    ["Description"] = "",
    ["OnPurchase"] = function(p75)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p75)
        local v76 = Random.new()
        local v77 = ""
        local v78 = nil
        for v79, v80 in v_u_4.Variants do
            local v81 = v80.RNG or v80.Rarity
            if v81 >= 1 then
                local v82 = (v81 / 1) ^ 1
                if v76:NextInteger(1, (math.round(v82))) == 1 then
                    v77 = v80.Name .. " "
                    v78 = v79
                end
            end
        end
        v_u_5:FireClient(p75, "Congratulations on buying " .. v77 .. "Heavy Pity!")
        v_u_3(p75, true, {
            ["Requirement"] = -7.2,
            ["Dimension"] = "1"
        }, v78, true, false)
    end,
    ["OnClientUpdate"] = function(_, p83)
        -- upvalues: (copy) v_u_24
        v_u_24("Heavy Pity", p83)
    end
}
v8.Cloventine = {
    ["Name"] = "Cloventine",
    ["Price"] = 20000,
    ["Description"] = "",
    ["OnPurchase"] = function(p84)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p84)
        local v85 = Random.new()
        local v86 = ""
        local v87 = nil
        for v88, v89 in v_u_4.Variants do
            local v90 = v89.RNG or v89.Rarity
            if v90 >= 1 then
                local v91 = (v90 / 1) ^ 1
                if v85:NextInteger(1, (math.round(v91))) == 1 then
                    v86 = v89.Name .. " "
                    v87 = v88
                end
            end
        end
        v_u_5:FireClient(p84, "Congratulations on buying " .. v86 .. "Cloventine")
        v_u_3(p84, true, {
            ["Requirement"] = -7.3,
            ["Dimension"] = "1"
        }, v87, true, false)
    end,
    ["OnClientUpdate"] = function(_, p92)
        -- upvalues: (copy) v_u_24
        v_u_24("Cloventine", p92)
    end
}
v8.Cloverveil = {
    ["Name"] = "Cloverveil",
    ["Price"] = 35000,
    ["Description"] = "",
    ["OnPurchase"] = function(p93)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p93)
        local v94 = Random.new()
        local v95 = ""
        local v96 = nil
        for v97, v98 in v_u_4.Variants do
            local v99 = v98.RNG or v98.Rarity
            if v99 >= 1 then
                local v100 = (v99 / 1) ^ 1
                if v94:NextInteger(1, (math.round(v100))) == 1 then
                    v95 = v98.Name .. " "
                    v96 = v97
                end
            end
        end
        v_u_5:FireClient(p93, "Congratulations on buying " .. v95 .. "Cloverveil")
        v_u_3(p93, true, {
            ["Requirement"] = -7.4,
            ["Dimension"] = "1"
        }, v96, true, false)
    end,
    ["OnClientUpdate"] = function(_, p101)
        -- upvalues: (copy) v_u_24
        v_u_24("Cloverveil", p101)
    end
}
v8.Skysprout = {
    ["Name"] = "Skysprout",
    ["Price"] = 20000,
    ["Description"] = "",
    ["OnPurchase"] = function(p102)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p102)
        local v103 = Random.new()
        local v104 = ""
        local v105 = nil
        for v106, v107 in v_u_4.Variants do
            local v108 = v107.RNG or v107.Rarity
            if v108 >= 1 then
                local v109 = (v108 / 1) ^ 1
                if v103:NextInteger(1, (math.round(v109))) == 1 then
                    v104 = v107.Name .. " "
                    v105 = v106
                end
            end
        end
        v_u_5:FireClient(p102, "Congratulations on buying " .. v104 .. "Skysprout")
        v_u_3(p102, true, {
            ["Requirement"] = -7.5,
            ["Dimension"] = "1"
        }, v105, true, false)
    end,
    ["OnClientUpdate"] = function(_, p110)
        -- upvalues: (copy) v_u_24
        v_u_24("Skysprout", p110)
    end
}
v8.Fortuna = {
    ["Name"] = "Fortuna",
    ["Price"] = 50000,
    ["Description"] = "",
    ["OnPurchase"] = function(p111)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p111)
        local v112 = Random.new()
        local v113 = ""
        local v114 = nil
        for v115, v116 in v_u_4.Variants do
            local v117 = v116.RNG or v116.Rarity
            if v117 >= 1 then
                local v118 = (v117 / 1) ^ 1
                if v112:NextInteger(1, (math.round(v118))) == 1 then
                    v113 = v116.Name .. " "
                    v114 = v115
                end
            end
        end
        v_u_5:FireClient(p111, "Congratulations on buying " .. v113 .. "FortunA")
        v_u_3(p111, true, {
            ["Requirement"] = -7.6,
            ["Dimension"] = "1"
        }, v114, true, false)
    end,
    ["OnClientUpdate"] = function(_, p119)
        -- upvalues: (copy) v_u_24
        v_u_24("Fortuna", p119)
    end
}
v8.Elarune = {
    ["Name"] = "Elarune",
    ["Price"] = 30000,
    ["Description"] = "",
    ["OnPurchase"] = function(p120)
        -- upvalues: (copy) v_u_1, (ref) v_u_6, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (ref) v_u_3
        local _ = v_u_1:IsServer() and v_u_6(p120)
        local v121 = Random.new()
        local v122 = ""
        local v123 = nil
        for v124, v125 in v_u_4.Variants do
            local v126 = v125.RNG or v125.Rarity
            if v126 >= 1 then
                local v127 = (v126 / 1) ^ 1
                if v121:NextInteger(1, (math.round(v127))) == 1 then
                    v122 = v125.Name .. " "
                    v123 = v124
                end
            end
        end
        v_u_5:FireClient(p120, "Congratulations on buying " .. v122 .. "Elarune")
        v_u_3(p120, true, {
            ["Requirement"] = -7.7,
            ["Dimension"] = "1"
        }, v123, true, false)
    end,
    ["OnClientUpdate"] = function(_, p128)
        -- upvalues: (copy) v_u_24
        v_u_24("Elarune", p128)
    end
}
return v8