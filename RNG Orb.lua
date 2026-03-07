-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
repeat
    wait()
until script.Parent:FindFirstChild("_RNGOrbFrame") and script.Parent:FindFirstChild("_RNGOrbFrame"):IsA("ViewportFrame")
local v_u_1 = script.Parent:FindFirstChild("_RNGOrbFrame")
local v_u_2 = require(game:GetService("ReplicatedStorage"):WaitForChild("GameData"))
local v_u_3 = game.ReplicatedStorage:WaitForChild("OverheadDesigns")
local v_u_4 = game.ReplicatedStorage:WaitForChild("VariantOverheadDesigns")
local v_u_5 = require(script.EternityNum)
local v_u_6 = {
    [1] = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(1, 1, 1)),
    [10] = ColorSequence.new(Color3.new(0.666667, 0, 1), Color3.new(1, 1, 1)),
    [100] = ColorSequence.new(Color3.new(0, 0, 1), Color3.new(1, 1, 1)),
    [1000] = ColorSequence.new(Color3.new(0.333333, 1, 0), Color3.new(1, 1, 1)),
    [10000] = ColorSequence.new(Color3.new(1, 1, 0), Color3.new(1, 1, 1)),
    [100000] = ColorSequence.new(Color3.new(1, 0.666667, 0), Color3.new(1, 1, 1)),
    [1000000] = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1))
}
function Main(p7)
    -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
    local v8 = v_u_1:Clone()
    local v9 = p7["1"] or (p7[1] or 0)
    local v10 = p7["2"] or (p7[2] or 0)
    local v11 = p7["3"] or (p7[3] or -1)
    local v12 = p7["4"] or (p7[4] or "1")
    local v13 = v9 or p7["1"]
    local v14, v15 = v_u_2:GetDesignFromRNG(v13, v12)
    local v16 = v15 or v14
    if v15 then
        local v17 = v_u_2:GetDesignFromString(v15, v12)
        v9 = v17.ConvertedRNG ~= -3 and v17.ConvertedRNG or (v17.actualRNG or v9)
    end
    local v18 = script.InventoryItem:Clone()
    v18.Visible = true
    v18.Parent = v8
    local v19 = v_u_3:WaitForChild(v16)
    local v20 = (v19:FindFirstChild("Label") or v19:FindFirstChild("TextLabel")):Clone()
    local v21 = (v19:FindFirstChild("RNG") or v20):Clone()
    local v22 = p7["5"]
    v21.Text = v_u_5.short(v13)
    v21.Size = UDim2.fromScale(1, 1)
    local v23 = v18.Wrapper
    if v10 > 0 then
        local v24 = v_u_4:FindFirstChild(v_u_2.Variants[v10].Name or "None"):FindFirstChild("TextLabel"):Clone()
        v24.Size = UDim2.new(1, 0, 1, 0)
        v24.Position = UDim2.new(0, 0, 0, 0)
        v24.Parent = v23.Variant
        v9 = v9 * v_u_2.Variants[v10].Rarity
        v21.Text = v_u_5.short(v13 * v_u_2.Variants[v10].Rarity)
    end
    local v25, _ = v_u_2:GetTierFromRNG(v9, v22)
    local v26 = game:GetService("ReplicatedStorage").Tiers:FindFirstChild(v25)
    if not v25 then
        v26 = game:GetService("ReplicatedStorage").Tiers.Placeholder
    end
    local v27 = v26:FindFirstChildOfClass("UIGradient", true)
    local v28
    if v27 then
        v28 = v27.Color
    else
        v28 = ColorSequence.new(v26.TextColor3)
    end
    v18.Wrapper.UIStroke.UIGradient.Color = v28
    v18.Wrapper.isHardcore.Visible = v22
    local v29 = v18.Wrapper.Serial
    local v30
    if v11 == nil then
        v30 = false
    else
        v30 = v11 ~= -1
    end
    v29.Visible = v30
    if v11 then
        v18.Wrapper.Serial.Text = "{#" .. v11 .. "}"
        v18.Wrapper.Serial.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1))
        for v31, v32 in v_u_6 do
            if v11 <= v31 then
                v18.Wrapper.Serial.UIGradient.Color = v32
                break
            end
        end
    end
    v20:FindFirstChildOfClass("UIGradient")
    v20.Parent = v23.Title
    v21.Parent = v23.RNG
    return v8, v25, _, _, nil, false
end
return Main