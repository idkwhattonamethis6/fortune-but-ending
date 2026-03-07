-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.EternityNum)
local v41 = {
    {
        ["QuestDesc"] = "Gain a total of <font color=\"rgb(0,255,210)\">%s</font> RNG",
        ["Progress"] = {
            10000000,
            500000000,
            25000000000,
            750000000000,
            10000000000000,
            500000000000000,
            2.5e16,
            7.5e17,
            1e19,
            5e20,
            2.5e22,
            7.5e23,
            9.999999999999999e24
        },
        ["Reward"] = {
            { "LuckMulti", 2 },
            { "LuckMulti", 5 },
            { "LuckMulti", 10 },
            { "LuckMulti", 12 },
            { "LuckMulti", 14 },
            { "LuckMulti", 16 },
            { "LuckMulti", 18 },
            { "LuckMulti", 20 },
            { "LuckMulti", 21 },
            { "LuckMulti", 22 },
            { "LuckMulti", 23 },
            { "LuckMulti", 24 },
            { "LuckMulti", 25 }
        },
        ["RewardFormat"] = "x%s\240\159\141\128",
        ["FormatMethod"] = function(p2)
            -- upvalues: (copy) v_u_1
            return v_u_1.short(p2, 2)
        end,
        ["ProgressMethod"] = function(p_u_3, p4)
            local v_u_5 = tostring(p4)
            local _ = p_u_3.QuestProgress[v_u_5] or 0
            p_u_3:OnChange("__RolledRNG"):connect(function(p6)
                -- upvalues: (copy) p_u_3, (ref) v_u_5
                local v7 = p_u_3.QuestProgress
                local v8 = v_u_5
                v7[v8] = v7[v8] + p6
            end)
        end
    },
    {
        ["QuestDesc"] = "Roll <font color=\"rgb(0,255,210)\">%s</font> times",
        ["Progress"] = {
            500,
            2000,
            15000,
            50000,
            100000,
            250000,
            500000,
            1000000,
            2500000,
            5000000,
            10000000,
            25000000,
            50000000,
            100000000,
            250000000,
            500000000,
            1000000000
        },
        ["Reward"] = {
            { "RollSpeed", 15 },
            { "RollSpeed", 25 },
            { "RollSpeed", 35 },
            { "RollSpeed", 40 },
            { "RollSpeed", 45 },
            { "RollSpeed", 50 },
            { "RollSpeed", 52 },
            { "RollSpeed", 54 },
            { "RollSpeed", 55 },
            { "RollSpeed", 56 },
            { "RollSpeed", 57 },
            { "RollSpeed", 58 },
            { "RollSpeed", 59 },
            { "RollSpeed", 60 },
            { "RollSpeed", 61 },
            { "RollSpeed", 62 },
            { "RollSpeed", 65 }
        },
        ["RewardFormat"] = "-%s%%\226\143\177\239\184\143",
        ["FormatMethod"] = function(p9)
            return math.floor(p9)
        end,
        ["ProgressMethod"] = function(p_u_10, p11)
            local v_u_12 = tostring(p11)
            local _ = p_u_10.QuestProgress[v_u_12] or 0
            p_u_10:OnChange("Rerolls"):connect(function()
                -- upvalues: (copy) p_u_10, (ref) v_u_12
                p_u_10.QuestProgress[v_u_12] = p_u_10.QuestProgress[v_u_12] + 1
            end)
        end
    },
    {
        ["QuestDesc"] = "Gain a total of <font color=\"rgb(0,255,210)\">%s</font> <font color=\"rgb(0,190,255)\">Variant</font> RNG",
        ["Progress"] = {
            5000,
            35000,
            1000000,
            1000000000,
            1000000000000,
            1000000000000000
        },
        ["Reward"] = {
            { "MultiRoll", 1 },
            { "MultiRoll", 3 },
            { "MultiRoll", 6 },
            { "MultiRoll", 7 },
            { "MultiRoll", 8 },
            { "MultiRoll", 9 }
        },
        ["RewardFormat"] = "+%s\240\159\142\178",
        ["FormatMethod"] = function(p13)
            -- upvalues: (copy) v_u_1
            return v_u_1.short(p13, 2)
        end,
        ["ProgressMethod"] = function(p_u_14, p15)
            local v_u_16 = tostring(p15)
            local _ = p_u_14.QuestProgress[v_u_16] or 0
            p_u_14:OnChange("__RolledVariantRNG"):connect(function(p17)
                -- upvalues: (copy) p_u_14, (ref) v_u_16
                if p17 ~= 0 then
                    local v18 = p_u_14.QuestProgress
                    local v19 = v_u_16
                    v18[v19] = v18[v19] + p17
                end
            end)
        end
    },
    {
        ["QuestDesc"] = "Play for <font color=\"rgb(0,255,210)\">%s</font> <font color=\"rgb(0,255,255)\">minutes</font>",
        ["Progress"] = {
            10,
            30,
            60,
            120,
            240,
            480,
            960,
            1920,
            3840,
            7680,
            15360,
            30720,
            71440,
            142880,
            283760,
            567520,
            1000000
        },
        ["Reward"] = {
            { "Slots", 1 },
            { "Slots", 2 },
            { "Slots", 3 },
            { "Slots", 4 },
            { "Slots", 5 },
            { "Slots", 6 },
            { "Slots", 7 },
            { "Slots", 8 },
            { "Slots", 9 },
            { "Slots", 10 },
            { "Slots", 11 },
            { "Slots", 12 },
            { "Slots", 13 },
            { "Slots", 14 },
            { "Slots", 15 },
            { "Slots", 16 }
        },
        ["RewardFormat"] = "+%s\240\159\142\146",
        ["FormatMethod"] = function(p20)
            return math.floor(p20)
        end,
        ["OnUpdateMethod"] = function(p21, p22, p23)
            p21.InventorySlots.Roll = p21.BeginnerSlots.Roll + p22 + (p23:GetAttribute("ExtraSlots") or 0)
        end,
        ["ProgressMethod"] = function(p24, p25)
            local v26 = tostring(p25)
            p24.QuestProgress[v26] = p24.QuestProgress[v26] or 0
            while true do
                local v27 = wait(1)
                local v28 = p24.QuestProgress
                v28[v26] = v28[v26] + v27 / 60
            end
        end
    },
    {
        ["QuestDesc"] = "Obtain <font color=\"rgb(0,255,210)\">%s</font> <font color=\"rgb(0,255,255)\">RNG</font> from <font color=\"rgb(0,255,255)\">Secrets</font>",
        ["Progress"] = {
            10000,
            2000000,
            250000000,
            25000000000,
            750000000000,
            10000000000000,
            500000000000000,
            2.5e16,
            7.5e17,
            1e19,
            5e20,
            2.5e22,
            7.5e23,
            9.999999999999999e24
        },
        ["Reward"] = {
            { "SecretLuck", 5 },
            { "SecretLuck", 15 },
            { "SecretLuck", 25 },
            { "SecretLuck", 30 },
            { "SecretLuck", 35 },
            { "SecretLuck", 40 },
            { "SecretLuck", 45 },
            { "SecretLuck", 50 },
            { "SecretLuck", 52 },
            { "SecretLuck", 54 },
            { "SecretLuck", 56 },
            { "SecretLuck", 58 },
            { "SecretLuck", 60 },
            { "SecretLuck", 65 }
        },
        ["RewardFormat"] = "+%s%%\226\157\148",
        ["FormatMethod"] = function(p29)
            -- upvalues: (copy) v_u_1
            return v_u_1.short(p29, 2)
        end,
        ["ProgressMethod"] = function(p_u_30, p31)
            local v_u_32 = tostring(p31)
            local _ = p_u_30.QuestProgress[v_u_32] or 0
            p_u_30:OnChange("__RolledSecret"):connect(function(p33)
                -- upvalues: (copy) p_u_30, (ref) v_u_32
                if p33 ~= 0 then
                    local v34 = p_u_30.QuestProgress
                    local v35 = v_u_32
                    v34[v35] = v34[v35] + p33
                end
            end)
        end
    },
    {
        ["QuestDesc"] = "Roll an <font color=\"rgb(0,255,255)\">Enchant Orb</font> with <font color=\"rgb(0,255,210)\">%s</font> <font color=\"rgb(0,255,255)\">Enchants</font>",
        ["Progress"] = {
            1,
            2,
            3,
            4,
            5
        },
        ["Reward"] = {
            { "EnchantLuck", 5 },
            { "EnchantLuck", 10 },
            { "EnchantLuck", 15 },
            { "EnchantLuck", 20 },
            { "EnchantLuck", 25 }
        },
        ["RewardFormat"] = "+%s%%\240\159\148\174",
        ["FormatMethod"] = function(p36)
            -- upvalues: (copy) v_u_1
            return v_u_1.short(p36, 2)
        end,
        ["ProgressMethod"] = function(p_u_37, p38)
            local v_u_39 = tostring(p38)
            local _ = p_u_37.QuestProgress[v_u_39] or 0
            p_u_37:OnChange("__HighestRolledEnchantOrbCount"):connect(function(p40)
                -- upvalues: (copy) p_u_37, (ref) v_u_39
                if p40 ~= 0 then
                    if p_u_37.QuestProgress[v_u_39] < p40 then
                        p_u_37.QuestProgress[v_u_39] = p40
                    end
                end
            end)
        end
    }
}
for v42, v43 in v41 do
    v43.__index = v42
end
return v41