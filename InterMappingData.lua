-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v29 = {
    ["Desc"] = {
        ["BulkRoll"] = "+1 <font color=\"rgb(80, 165, 225)\">Bulk Roll</font> on <font color=\"rgb(80, 165, 225)\">Dimension 2</font>",
        ["Luck"] = "<font color=\"rgb(80, 165, 225)\">Dimension 2</font> Luck <font color=\"rgb(80, 165, 225)\">+%s%%</font>",
        ["CloverBoost"] = "\'Clover\' spawned on <font color=\"rgb(80, 165, 225)\">Dimension 1</font> gains <font color=\"rgb(80, 165, 225)\">+%s%%</font> Luck",
        ["CloverStackable"] = "\'Clovers\' are <font color=\"rgb(80, 165, 225)\">stackable</font> (up to 2 \'Clovers\') if the <font color=\"rgb(80, 165, 225)\">Variant</font> of the next \'Clover\' is equal to the previous one. Additionally, the second \'Clover\' will have <font color=\"rgb(80, 165, 225)\">+50%%</font> Multiplier.",
        ["Ionize"] = "Using <font color=\"rgb(80, 165, 225)\">Mega/Giga/Nexus/Titanic</font> \'Clover\' increases Luck by <font color=\"rgb(80, 165, 225)\">1000%%/2000%%/3000%%/4000%%</font> for 2 Minutes",
        ["Secret"] = "<font color=\"rgb(80, 165, 225)\">Dimension 2</font> Secret Luck <font color=\"rgb(80, 165, 225)\">+%s%%</font>",
        ["Variant"] = "Variant Luck <font color=\"rgb(80, 165, 225)\">+%s%%</font>",
        ["Speed"] = "<font color=\"rgb(80, 165, 225)\">Dimension 2</font> Rolling Speed <font color=\"rgb(80, 165, 225)\">+%s%%</font>",
        ["Gambler"] = "Luck <font color=\"rgb(225, 0, 41)\">-25%%</font>\n When rolling something with RNG less than <font color=\"rgb(80, 165, 225)\">200</font>. <font color=\"rgb(80, 165, 225)\">+75%%</font> Luck\nThis buff will add up until you roll something more than 200 RNG",
        ["IndexFortune"] = "(this node aint working yet)",
        ["SExpand"] = "Aura Inventory Slots <font color=\"rgb(80, 165, 225)\">+%s</font>"
    },
    ["Stats"] = {
        ["BulkRoll"] = 1,
        ["Luck"] = 100,
        ["CloverBoost"] = { 50, 75, 100 },
        ["Secret"] = 7.5,
        ["Variant"] = 5,
        ["Speed"] = 7.5,
        ["Gambler"] = 0.25,
        ["SExpand"] = 3
    },
    ["Cost"] = {
        ["BulkRoll"] = {
            1,
            1,
            2,
            3,
            5,
            10
        },
        ["Luck"] = {
            1,
            1,
            1,
            1,
            2,
            2,
            2,
            3,
            3,
            4,
            4,
            4
        },
        ["CloverBoost"] = { 3, 6, 9 },
        ["CloverStackable"] = 3,
        ["Ionize"] = 3,
        ["Secret"] = {
            2,
            2,
            4,
            4
        },
        ["Variant"] = {
            2,
            2,
            2,
            3
        },
        ["Speed"] = {
            1,
            1,
            1,
            1,
            2,
            2,
            2,
            3,
            3,
            4,
            4,
            4
        },
        ["Gambler"] = 6,
        ["IndexFortune"] = 11111,
        ["SExpand"] = 0
    },
    ["Methods"] = {
        ["BulkRoll"] = function(p1, p2)
            local v3 = require(p1.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats)["2"]
            v3.MultiRoll = v3.MultiRoll + p2
        end,
        ["SExpand"] = function(p4, p5)
            local v6 = require(game.ServerScriptService.PlayerDataHandler.PlayerDataParser)(p4).InventorySlots
            v6.Roll = v6.Roll + p5
            p4:SetAttribute("ExtraSlots", (p4:GetAttribute("ExtraSlots") or 0) + p5)
        end,
        ["Luck"] = function(p7, p8)
            local v9 = require(p7.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats)["2"]
            v9.LuckMulti = v9.LuckMulti + p8 / 100
        end,
        ["Secret"] = function(p10, p11)
            local v12 = require(p10.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats)["2"]
            v12.SecretLuck = v12.SecretLuck + p11
        end,
        ["Variant"] = function(p13, p14)
            local v15 = require(p13.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats).__global
            v15.VariantLuck = v15.VariantLuck + p14
        end,
        ["Gambler"] = function(p16, p_u_17)
            local v_u_18 = require(p16.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats)
            local v_u_19 = 0
            p16.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.OnRolledRNGBindable.Event:Connect(function(p20)
                -- upvalues: (ref) v_u_19, (copy) v_u_18, (copy) p_u_17
                if p20 < 200 then
                    v_u_19 = v_u_19 + 0.75
                    v_u_18:AddBuff("Unfortunate One\'s Pity", {
                        ["LuckMulti"] = p_u_17 + v_u_19
                    })
                else
                    v_u_19 = 0
                    v_u_18:AddBuff("Unfortunate One\'s Pity", {
                        ["LuckMulti"] = p_u_17 + v_u_19
                    })
                end
            end)
        end,
        ["Ionize"] = function(p21)
            p21:SetAttribute("IonizeEnabled", true)
        end,
        ["CloverBoost"] = function(p22, p23)
            p22:SetAttribute("CloverMultiplierRate", (p22:GetAttribute("CloverMultiplierRate") or 0) + p23 / 100)
        end,
        ["CloverStackable"] = function(p24)
            p24.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript:SetAttribute("CloverStackLimit", 2)
        end,
        ["Speed"] = function(p25, p26)
            local v27 = require(p25.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript.DimensionStats)["2"]
            v27.RollSpeed = v27.RollSpeed + p26
        end,
        ["IndexFortune"] = function(p28)
            p28.PlayerGui["ClientBased-Rolling"].ROLL_BUTTON.RollingScript:SetAttribute("IndexFortune", 1000)
        end
    }
}
return v29