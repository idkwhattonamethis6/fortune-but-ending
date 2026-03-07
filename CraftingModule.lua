-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.GameData)
return {
    ["CreateCraftData"] = function(_, _, p2, p3)
        -- upvalues: (copy) v_u_1
        local v4 = {
            ["1"] = 1.01,
            ["2"] = 0,
            ["3"] = -1,
            ["4"] = "1"
        }
        for _, v5 in v_u_1.SecretDesigns[p2["4"]] do
            if v5.Requirement == p2["1"] then
                warn("Cannot craft using secrets")
                return v4
            end
        end
        for _, v6 in v_u_1.SecretDesigns[p3["4"]] do
            if v6.Requirement == p3["1"] then
                warn("Cannot craft using secrets")
                return v4
            end
        end
        if p2["1"] <= 0 or p3["1"] <= 0 then
            warn("Cannot craft using negatives")
            return v4
        end
        if p2["4"] == p3["4"] then
            v4["4"] = p2["4"]
        elseif p2["1"] > p3["1"] then
            v4["4"] = p2["4"]
        else
            v4["4"] = p3["4"]
        end
        local v7 = (p2["2"] + p3["2"]) / 2
        local v8 = math.round(v7)
        if math.random(1, 5) == 1 then
            v8 = v8 + 1
        end
        if math.random(1, 12) == 1 then
            v8 = v8 + 1
        end
        local v9 = math.clamp(v8, 0, 17)
        v4["2"] = v9
        local v10 = false
        if Random.new():NextInteger(1, 5) == 1 or p2["2"] == 18 and p3["2"] == p2["2"] then
            v4["2"] = 18
            v10 = p2["2"] == 18 and p3["2"] == p2["2"] and true or v10
        end
        local v11 = not v_u_1.Variants[v9] and 1 or v_u_1.Variants[v9].Rarity / 1.75
        local _ = (p2["1"] + p3["1"]) * v11 * 1.1
        local _ = p2["1"] + p3["1"]
        local v12 = v_u_1:GetRankValue(p2["1"], p2["2"], p2["4"]) + v_u_1:GetRankValue(p3["1"], p3["2"], p3["4"])
        if v_u_1.Variants[v9] then
            if v10 then
                v12 = v12 / v_u_1.Variants[18].Rarity
            else
                v12 = v12 / v_u_1.Variants[v9].Rarity
            end
        end
        v4["1"] = v12 * (1.05 + math.random(-5, 5) / 100)
        v4["3"] = 0
        return v4
    end
}