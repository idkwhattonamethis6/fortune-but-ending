-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.UI.Stories.Interface.CloverMerger)
local v_u_2 = require(game.ReplicatedStorage.ClientDataParser)
local function v_u_8(p_u_3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_8
    print("uh")
    for _ = 1, 25 do
        local v4 = v_u_2.Inventory.Items
        local v5 = os.clock()
        local v6 = {
            ["Name"] = "\"Clover\"",
            ["Attributes"] = {
                ["variant"] = math.random(1, 5),
                ["Multiplier"] = math.random(85, 100),
                ["SpecialAttribute"] = nil
            }
        }
        v4[v5] = v6
    end
    print("uh")
    local v_u_7 = nil
    v_u_7 = v_u_1(p_u_3, {
        ["CloseFeedback"] = function()
            -- upvalues: (ref) v_u_7, (ref) v_u_8, (copy) p_u_3
            v_u_7.UI:Destroy()
            v_u_8(p_u_3)
        end
    })
end
return v_u_8