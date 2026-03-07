-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local function v_u_10(p1, p2, p3)
    while true do
        local v4 = task.wait(p2) and (p1.Parent and p1:FindFirstChild("HumanoidRootPart"))
        if not v4 then
            break
        end
        local v5 = workspace.CloverDropper.CloverSpawningScript.ForceSpawn
        local v6 = not p3
        if v6 then
            local v7 = v4.Position
            local v8 = math.random(-1, 1)
            local v9 = math.random(-1, 1) or nil
            v6 = v7 + Vector3.new(v8, 20, v9)
        end
        v5:Fire(v6)
    end
end
local v11 = {
    ["Transmunity"] = {
        {
            ["Name"] = "Transmunity",
            ["Rarity"] = 1000,
            ["Attributes"] = { 3 },
            ["Description"] = "Every clover you pick up will have a <font color=\"rgb(80, 165, 225)\">%s%%</font> chance to be upgraded! (Does not stack)"
        },
        {
            ["Name"] = "Transmunity II",
            ["Rarity"] = 30000,
            ["Attributes"] = { 7 },
            ["Description"] = "Every clover you pick up will have a <font color=\"rgb(80, 165, 225)\">%s%%</font> chance to be upgraded! (Does not stack)"
        },
        {
            ["Name"] = "Transmunity III",
            ["Rarity"] = 500000,
            ["Attributes"] = { 15 },
            ["Description"] = "Every clover you pick up will have a <font color=\"rgb(80, 165, 225)\">%s%%</font> chance to be upgraded! (Does not stack)"
        },
        {
            ["Name"] = "Transfiguration",
            ["Rarity"] = 15000000,
            ["Attributes"] = { 25 },
            ["Description"] = "Every clover you pick up will have a <font color=\"rgb(80, 165, 225)\">%s%%</font> chance to be upgraded! (Does not stack)"
        },
        {
            ["Name"] = "Covalence",
            ["Rarity"] = 30000000000,
            ["Attributes"] = { 100 },
            ["Description"] = "Every clover you pick up will have a <font color=\"rgb(80, 165, 225)\">%s%%</font> chance to be upgraded! (Does not stack)"
        }
    }
}
local v12 = {}
local v13 = {
    ["Name"] = "Omen",
    ["Rarity"] = 5184,
    ["EnchantStats"] = {
        ["LuckMulti"] = -3.5,
        ["SecretLuck"] = 75,
        ["VariantLuck"] = -50
    },
    ["Lore"] = "On dat Void grinding aren\'t we?"
}
local v14 = {
    ["Name"] = "Gluttony",
    ["Rarity"] = 22687.317492378865,
    ["EnchantStats"] = {
        ["MultiRoll"] = -100,
        ["LuckMulti"] = 9,
        ["SecretLuck"] = 50,
        ["RollSpeed"] = 50,
        ["VariantLuck"] = 5
    },
    ["Lore"] = "What\'s that? You don\'t even have 6 Bulk Roll?!? Pfftt... skill issue."
}
local v15 = {
    ["Name"] = "Greed",
    ["Rarity"] = 60025,
    ["EnchantStats"] = {
        ["MultiRoll"] = 9,
        ["LuckMulti"] = -6.5,
        ["SecretLuck"] = -55
    },
    ["Lore"] = "Something something the more you take, the less you get."
}
local v16 = {
    ["Name"] = "Overwhelm",
    ["Rarity"] = 60025,
    ["EnchantStats"] = {
        ["MultiRoll"] = 4,
        ["LuckMulti"] = 5,
        ["SecretLuck"] = 100,
        ["RollSpeed"] = -1000
    }
}
local v17 = {
    ["Name"] = "Avarice",
    ["Lore"] = "Extreme edge of Greed.",
    ["Rarity"] = 420175,
    ["EnchantStats"] = {
        ["MultiRoll"] = 25,
        ["LuckMulti"] = -25,
        ["RollSpeed"] = -150,
        ["SecretLuck"] = -100
    }
}
local v18 = {
    ["Name"] = "Heresy",
    ["Lore"] = "It is too late to forget.",
    ["Rarity"] = 2941225,
    ["EnchantStats"] = {
        ["MultiRoll"] = 3,
        ["LuckMulti"] = -100,
        ["RollSpeed"] = -200,
        ["SecretLuck"] = 350
    }
}
local v19 = {
    ["Name"] = "Apocrypha",
    ["Lore"] = "\"If it means the World will End, I will Save You.\"",
    ["Description"] = "<font color=\'#ff0000\'>I\'m sorry. That option is not avaliable for you. It will never avaliable for anyone.</font>\n\n<font color=\'#aa0000\'>In your final moments, you will see every beginning, every conclusion, every possibility fly past your reach. You will see sights you\'ll never experience in person, see truths that you will never attain. In the end, nothing will remain for you.\n\nThis is the only atonement fitting for someone like you.</font>",
    ["Rarity"] = 20588575,
    ["EnchantStats"] = {
        ["MultiRoll"] = 0,
        ["LuckMulti"] = 0,
        ["RollSpeed"] = 0,
        ["SecretLuck"] = 0
    }
}
__set_list(v12, 1, {v13, v14, v15, v16, v17, v18, v19})
v11.Curses = v12
local v20 = {}
local v21 = {
    ["Name"] = "Luck I",
    ["Rarity"] = 25,
    ["EnchantStats"] = {
        ["LuckMulti"] = 1.5
    },
    ["Lore"] = "\'luck won...\'"
}
local v22 = {
    ["Name"] = "Luck II",
    ["Rarity"] = 125,
    ["EnchantStats"] = {
        ["LuckMulti"] = 2
    },
    ["Lore"] = "\'luck too...\'"
}
local v23 = {
    ["Name"] = "Luck III",
    ["Rarity"] = 625,
    ["EnchantStats"] = {
        ["LuckMulti"] = 2.8
    },
    ["Lore"] = "\'luck tree...\'"
}
local v24 = {
    ["Name"] = "Fortune",
    ["Rarity"] = 3125,
    ["EnchantStats"] = {
        ["LuckMulti"] = 4
    },
    ["Lore"] = "\'luck for...\'"
}
local v25 = {
    ["Name"] = "Fortune II",
    ["Rarity"] = 12800,
    ["EnchantStats"] = {
        ["LuckMulti"] = 6
    },
    ["Lore"] = "\'luck for...\'"
}
local v26 = {
    ["Name"] = "Destiny",
    ["Rarity"] = 2000000000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 15
    },
    ["Lore"] = "\'luck FAI...\'"
}
__set_list(v20, 1, {v21, v22, v23, v24, v25, v26})
v11.Luck = v20
local v27 = {}
local v28 = {
    ["Name"] = "Speed I",
    ["Rarity"] = 50,
    ["EnchantStats"] = {
        ["RollSpeed"] = 20
    },
    ["Lore"] = "\'speed won...\'"
}
local v29 = {
    ["Name"] = "Speed II",
    ["Rarity"] = 250,
    ["EnchantStats"] = {
        ["RollSpeed"] = 33
    },
    ["Lore"] = "\'speed too...\'"
}
local v30 = {
    ["Name"] = "Speed III",
    ["Rarity"] = 1250,
    ["EnchantStats"] = {
        ["RollSpeed"] = 44
    },
    ["Lore"] = "\'speed tree...\'"
}
local v31 = {
    ["Name"] = "Blitz",
    ["Rarity"] = 6250,
    ["EnchantStats"] = {
        ["RollSpeed"] = 60
    },
    ["Lore"] = "\'speed for...\'"
}
local v32 = {
    ["Name"] = "Overture",
    ["Rarity"] = 1111111,
    ["EnchantStats"] = {
        ["RollSpeed"] = 80
    },
    ["Lore"] = "\'speed fai...\'",
    ["Description"] = "This enchant will also <b>halve</b> the time of <b>roll Cutscenes.</b>"
}
__set_list(v27, 1, {v28, v29, v30, v31, v32})
v11.Speed = v27
local v33 = {}
local v34 = {
    ["Name"] = "Dupe I",
    ["Rarity"] = 200,
    ["EnchantStats"] = {
        ["MultiRoll"] = 1
    },
    ["Lore"] = "\'dup won...\'"
}
local v35 = {
    ["Name"] = "Dupe II",
    ["Rarity"] = 1000,
    ["EnchantStats"] = {
        ["MultiRoll"] = 2
    },
    ["Lore"] = "\'dup too...\'"
}
local v36 = {
    ["Name"] = "Dupe III",
    ["Rarity"] = 5000,
    ["EnchantStats"] = {
        ["MultiRoll"] = 3
    },
    ["Lore"] = "\'dup tree...\'"
}
local v37 = {
    ["Name"] = "Replica",
    ["Rarity"] = 25000,
    ["EnchantStats"] = {
        ["MultiRoll"] = 4
    },
    ["Lore"] = "\'dup for...\'"
}
local v38 = {
    ["Name"] = "Unlimited",
    ["Rarity"] = 10000000000,
    ["EnchantStats"] = {
        ["MultiRoll"] = 8
    },
    ["Lore"] = "\'dup fiv...\'"
}
__set_list(v33, 1, {v34, v35, v36, v37, v38})
v11.Dupe = v33
local v39 = {}
local v40 = {
    ["Name"] = "Unusual I",
    ["Rarity"] = 333,
    ["EnchantStats"] = {
        ["VariantLuck"] = 25
    },
    ["Lore"] = "\'unusal won...\'"
}
local v41 = {
    ["Name"] = "Unusual II",
    ["Rarity"] = 1665,
    ["EnchantStats"] = {
        ["VariantLuck"] = 40
    },
    ["Lore"] = "\'unusal too...\'"
}
local v42 = {
    ["Name"] = "Unusual III",
    ["Rarity"] = 8325,
    ["EnchantStats"] = {
        ["VariantLuck"] = 65
    },
    ["Lore"] = "\'unusal tree...\'"
}
local v43 = {
    ["Name"] = "Bizarre",
    ["Rarity"] = 41625,
    ["EnchantStats"] = {
        ["VariantLuck"] = 100
    },
    ["Lore"] = "\'unusal for...\'"
}
local v44 = {
    ["Name"] = "Unique",
    ["Rarity"] = 20000000000,
    ["EnchantStats"] = {
        ["VariantLuck"] = 500
    },
    ["Lore"] = "\'unusal fiv...\'"
}
__set_list(v39, 1, {v40, v41, v42, v43, v44})
v11.Unusual = v39
local v45 = {}
local v46 = {
    ["Name"] = "Magical I",
    ["Rarity"] = 1000,
    ["EnchantStats"] = {
        ["EnchantLuck"] = 15
    },
    ["Lore"] = "\'magicl won...\'"
}
local v47 = {
    ["Name"] = "Magical II",
    ["Rarity"] = 5000,
    ["EnchantStats"] = {
        ["EnchantLuck"] = 35
    },
    ["Lore"] = "\'magicl too...\'"
}
local v48 = {
    ["Name"] = "Magical III",
    ["Rarity"] = 25000,
    ["EnchantStats"] = {
        ["EnchantLuck"] = 55
    },
    ["Lore"] = "\'magicl tree...\'"
}
local v49 = {
    ["Name"] = "Supernatural",
    ["Rarity"] = 125000,
    ["EnchantStats"] = {
        ["EnchantLuck"] = 90
    },
    ["Lore"] = "\'magicl fiv...\'"
}
local v50 = {
    ["Name"] = "Otherworldly",
    ["Rarity"] = 100000000000,
    ["EnchantStats"] = {
        ["EnchantLuck"] = 450
    },
    ["Lore"] = "\'magicl fiv...\'"
}
__set_list(v45, 1, {v46, v47, v48, v49, v50})
v11.Magical = v45
v11.Clover = {
    {
        ["Name"] = "Clover I",
        ["Rarity"] = 3333,
        ["EnchantStats"] = {},
        ["ServerFunction"] = function(p51)
            -- upvalues: (copy) v_u_10
            v_u_10(p51, 480)
        end,
        ["Lore"] = "\'Clover won...\'",
        ["Description"] = "A Clover will spawn ontop of you every 480s\n\n<b>Other people can collect the clover!</b>\n +50% Lucky Sprout Efficiency"
    },
    {
        ["Name"] = "Clover II",
        ["Rarity"] = 16665,
        ["EnchantStats"] = {},
        ["ServerFunction"] = function(p52)
            -- upvalues: (copy) v_u_10
            v_u_10(p52, 240)
        end,
        ["Lore"] = "\'Clover too...\'",
        ["Description"] = "A Clover will spawn ontop of you every 240s\n\n<b>Other people can collect the clover!</b>\n +100% Lucky Sprout Efficiency"
    },
    {
        ["Name"] = "Clover III",
        ["Rarity"] = 83325,
        ["EnchantStats"] = {},
        ["ServerFunction"] = function(p53)
            -- upvalues: (copy) v_u_10
            v_u_10(p53, 120)
        end,
        ["Lore"] = "\'Clover tree...\'",
        ["Description"] = "A Clover will spawn ontop of you every 120s\n\n<b>Other people can collect the clover!</b>\n +150% Lucky Sprout Efficiency"
    },
    {
        ["Name"] = "Sprout",
        ["Rarity"] = 416625,
        ["EnchantStats"] = {},
        ["ServerFunction"] = function(p54)
            -- upvalues: (copy) v_u_10
            v_u_10(p54, 60)
        end,
        ["Lore"] = "\'Clover for...\'",
        ["Description"] = "A Clover will spawn ontop of you every 60s\n\n<b>Other people can collect the clover!</b>\n +250% Lucky Sprout Efficiency"
    },
    {
        ["Name"] = "Florescence",
        ["Rarity"] = 300000000000,
        ["EnchantStats"] = {},
        ["ServerFunction"] = function(p55)
            -- upvalues: (copy) v_u_10
            v_u_10(p55, 15)
        end,
        ["Lore"] = "\'Clover fai...\'",
        ["Description"] = "A Clover will spawn ontop of you every 5s\n\n<b>Other people can collect the clover!</b>\n +500% Lucky Sprout Efficiency"
    }
}
local v56 = {}
local v57 = {
    ["Name"] = "Insight I",
    ["Rarity"] = 100,
    ["EnchantStats"] = {
        ["SecretLuck"] = 10
    },
    ["Lore"] = "\'eyesight won...\'"
}
local v58 = {
    ["Name"] = "Insight II",
    ["Rarity"] = 500,
    ["EnchantStats"] = {
        ["SecretLuck"] = 21
    },
    ["Lore"] = "\'eyesight too...\'"
}
local v59 = {
    ["Name"] = "Insight III",
    ["Rarity"] = 2500,
    ["EnchantStats"] = {
        ["SecretLuck"] = 35
    },
    ["Lore"] = "\'eyesight tree...\'"
}
local v60 = {
    ["Name"] = "Wisdom",
    ["Rarity"] = 12500,
    ["EnchantStats"] = {
        ["SecretLuck"] = 55
    },
    ["Lore"] = "\'eyesight for...\'"
}
local v61 = {
    ["Name"] = "Omniscience",
    ["Rarity"] = 50000000000,
    ["EnchantStats"] = {
        ["SecretLuck"] = 0
    },
    ["Lore"] = "\'eyesight fiv...\'"
}
__set_list(v56, 1, {v57, v58, v59, v60, v61})
v11.Insight = v56
local v62 = {}
local v63 = {
    ["Name"] = "Anas\' Blessing",
    ["Rarity"] = 1000000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 1.99,
        ["EnchantLuck"] = 39.9,
        ["RollSpeed"] = 39.9,
        ["VariantLuck"] = 39.99,
        ["MultiRoll"] = 3
    },
    ["SizeTier"] = 5,
    ["Lore"] = "\'\240\159\141\141\'",
    ["Description"] = "Makes you him"
}
__set_list(v62, 1, {v63})
v11["Anas\' Blessing"] = v62
local v64 = {}
local v65 = {
    ["Name"] = "Reaper",
    ["Rarity"] = 666666,
    ["EnchantStats"] = {
        ["Luck"] = -0.5,
        ["SecretLuck"] = 150
    },
    ["SizeTier"] = 5,
    ["Lore"] = "\'DEATHLY TOUCH\'",
    ["Description"] = "No one can approach you anymore\n\nYou also feel a lil unlimited..."
}
__set_list(v64, 1, {v65})
v11.Reaper = v64
local v66 = {}
local v67 = {
    ["Name"] = "Requiem",
    ["Rarity"] = 100000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 1.5,
        ["SecretLuck"] = 27,
        ["EnchantLuck"] = 55,
        ["RollSpeed"] = 55,
        ["VariantLuck"] = 35,
        ["MultiRoll"] = 2
    },
    ["SizeTier"] = 5,
    ["Lore"] = "\'KOREGA... REQUIEM DA.\'"
}
local v68 = {
    ["Name"] = "Genesis",
    ["Rarity"] = 2500000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 3,
        ["SecretLuck"] = 54,
        ["EnchantLuck"] = 110,
        ["RollSpeed"] = 75,
        ["VariantLuck"] = 70,
        ["MultiRoll"] = 4
    },
    ["SizeTier"] = 7,
    ["Lore"] = "\'KOREGA... OVER HEAVEN DA.\'"
}
local v69 = {
    ["Name"] = "Exodus",
    ["Rarity"] = 62500000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 4.5,
        ["SecretLuck"] = 81,
        ["EnchantLuck"] = 165,
        ["RollSpeed"] = 90,
        ["VariantLuck"] = 105,
        ["MultiRoll"] = 6
    },
    ["SizeTier"] = 9,
    ["Lore"] = "\'WE SHALL BEGIN ANEW.\'",
    ["Description"] = "<i>This enchant may be reworked in the future</i>"
}
__set_list(v66, 1, {v67, v68, v69})
v11.Requiem = v66
local v70 = {}
local v71 = {
    ["Name"] = "Almighty",
    ["Rarity"] = (1 / 0),
    ["EnchantStats"] = {
        ["SecretLuck"] = 0,
        ["EnchantLuck"] = 0,
        ["RollSpeed"] = 0,
        ["VariantLuck"] = 0,
        ["LuckMulti"] = 0,
        ["MultiRoll"] = 0
    },
    ["Lore"] = "\'THE ALMIGHTY\'",
    ["Description"] = "You win the game basically\n\nsignificantly increases every stat",
    ["SizeTier"] = 15
}
local v72 = {
    ["Name"] = "YHWACH",
    ["Rarity"] = (1 / 0),
    ["EnchantStats"] = {
        ["SecretLuck"] = 0,
        ["EnchantLuck"] = 0,
        ["RollSpeed"] = 0,
        ["VariantLuck"] = 0,
        ["LuckMulti"] = 0,
        ["MultiRoll"] = 0
    },
    ["Lore"] = "\'The child could not see, could not hear, could not speak, could not even move. He had no means of surviving... But the child was not afraid. He did not cry because he could not use his throat. But even if he could, <b>He probably wouldn\'t have.</b> The child knew that even without any means of survival... <b>He would survive.</b> The people around him treated him like a treasure, because they realized that by touching him, parts they were missing would gradually be filled. Those with ailing lungs saw their lungs healed, the lonely had their hearts filled, the timid were filled with courage. Even those who lost their legs slowly regained them. What the child had, was the power to impart his soul. His soul would be bestowed whenever he was touched. Wounds that could not be healed by their own soul... would be healed. At the same time... while their wounds were healing... the knowledge they\'d gained, acquired talents that blossomed, all of it, were ingrained in the pieces of the child\'s soul given to them. And... All of that would return to the child when they died. Those who touched the child did not live for long. A few years, a few months, some would die after only a few days. Yet the people kept flocking to the child. Everytime a piece of his soul returned, the child\'s unmoving arms and legs, and his eyes that could not see would slowly heal. Eventually, as his unhearing ears were hearing, he realized the people were calling him by a strange name. He understood that this was the name of the god these people worshipped, but he choose nonetheless to take that name for his own. Yhwach!",
    ["Description"] = "makes you the quincy king",
    ["SizeTier"] = 100
}
local v73 = {
    ["Name"] = "Lol",
    ["Rarity"] = (1 / 0),
    ["EnchantStats"] = {
        ["SecretLuck"] = 0,
        ["EnchantLuck"] = 0,
        ["MultiRoll"] = 1
    },
    ["Lore"] = "\'Lol\'",
    ["Description"] = "Oh well, to each their own.\n\nThe economy is ruined...",
    ["SizeTier"] = 300
}
__set_list(v70, 1, {v71, v72, v73, {
    ["Name"] = "Saigyou Ayakashi",
    ["Rarity"] = (1 / 0),
    ["EnchantStats"] = {},
    ["ServerFunction"] = function(p74)
        -- upvalues: (copy) v_u_10
        v_u_10(p74, 999, true)
    end,
    ["Lore"] = "\'\'",
    ["Description"] = "A long time ago, there lived a divinely talented poet who traveled around Gensokyo. When the poet became aware that the hour of his death drew near, he chose to begin his eternal rest under the most beautiful cherry tree he could find. After the poet\'s death, word of the beauty of the cherry tree began to spread across the land. That cherry tree has grown even more beautiful since then, charming many people into resting in peace beneath its blossoms. The tree with the mortuary charm became known as Saigyou Ayakashi\n\nA Clover will spawn every 0.5s\n\n<b>Other people can collect the clover!</b>"
}})
v11.Almighty = v70
local v75 = {}
local v76 = {
    ["Name"] = "Alpha",
    ["Rarity"] = 155555,
    ["EnchantStats"] = {
        ["LuckMulti"] = 0.1,
        ["SecretLuck"] = 6,
        ["EnchantLuck"] = 5,
        ["RollSpeed"] = 4,
        ["VariantLuck"] = 6
    },
    ["SizeTier"] = 2,
    ["Lore"] = "...?",
    ["Description"] = "This enchant can merge without being locked :O\n\n<b>(BOTH enchants must be purely the Alpha enchant to prevent being locked)</b>\n\n(You cannot merge more than 45 Alphas together!)\n"
}
__set_list(v75, 1, {v76})
v11.Alpha = v75
local v77 = {}
local v78 = {
    ["Name"] = "Unlicensed Grey Horse",
    ["Rarity"] = 490613600,
    ["Lore"] = "WHITE LIGHTNING COMING THROUGH!!1!",
    ["Description"] = "Broke-ahh",
    ["EnchantStats"] = {
        ["RollSpeed"] = 77,
        ["LuckMulti"] = -5,
        ["SecretLuck"] = 500,
        ["VariantLuck"] = 500
    }
}
local v79 = {
    ["Name"] = "Unlicensed Black Horse",
    ["Rarity"] = 522834000,
    ["Lore"] = "Coffee backwards is- nyeh nyeh u\'re weird. shut up, bro.",
    ["Description"] = "Cafe from Manhattan",
    ["EnchantStats"] = {
        ["RollSpeed"] = -100,
        ["LuckMulti"] = -1.5,
        ["SecretLuck"] = 150,
        ["MultiRoll"] = 5
    }
}
local v80 = {
    ["Name"] = "Unlicensed Chestnut Horse",
    ["Rarity"] = 1000697000,
    ["Lore"] = "when the Cheval... is Grand..",
    ["Description"] = "Big Horse",
    ["EnchantStats"] = {
        ["RollSpeed"] = -75,
        ["LuckMulti"] = 4,
        ["SecretLuck"] = -150,
        ["MultiRoll"] = 10
    }
}
local v81 = {
    ["Name"] = "Unlicensed Bay Horse",
    ["Rarity"] = 1876843000,
    ["EnchantStats"] = {
        ["LuckMulti"] = 5,
        ["RollSpeed"] = 85,
        ["SecretLuck"] = -250,
        ["MultiRoll"] = 13
    },
    ["Lore"] = "What do you mean this stayer is a sprinter descent??",
    ["Description"] = "HARIKITTE IKOU"
}
__set_list(v77, 1, {v78, v79, v80, v81})
v11.Horses = v77
local v82 = require(game.ReplicatedStorage.Modules.TranslateBuffKeys)
for _, v83 in v11 do
    for _, v84 in v83 do
        local v85 = ""
        if v84.EnchantStats then
            for v86, v87 in v84.EnchantStats do
                v85 = v85 .. v82(v86, v87) .. "\n"
            end
            if v85:len() > 0 then
                v84.Description = v84.Description or ""
                if v84.Description:len() > 0 then
                    v84.Description = v84.Description .. "\n"
                end
                v84.Description = v84.Description .. v85
            end
        else
            v84.EnchantStats = {}
        end
        if v84.Attributes then
            local v88 = v84.Description
            local v89 = v84.Attributes
            v84.Description = v88:format(table.unpack(v89))
        end
    end
end
return v11