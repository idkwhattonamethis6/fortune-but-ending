-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("GameData"))
local v_u_2 = game:GetService("ReplicatedStorage"):WaitForChild("VariantOverheadDesigns")
local v_u_3 = {
    "Mega",
    "Giga",
    "Nexus",
    "Titanic",
    "Perlica"
}
function trim(p4)
    return p4:match("^%s*(.-)%s*$"):gsub("%s+", " ")
end
function Main(p5)
    -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
    local v6 = script.Template:Clone()
    v6.Multiplier.Text = p5.Multiplier or 1
    local v7 = nil
    local v8 = nil
    local v9 = v_u_1.Variants[p5.variant or 0]
    local v10 = p5.SpecialAttribute
    if v10 then
        v10 = v_u_1.SpecialCloverAttributes[p5.SpecialAttribute]
    end
    local v11 = v10 and v10.Chance or 1
    local _, v12, _ = v_u_1:GetTierFromRNG((p5.Multiplier or 1) * (v9 and (v9.Rarity or 1) or 1) * 10 * v11)
    local v13 = v12.Name
    local v14
    if v9 then
        v14 = v_u_2:FindFirstChild(v9.Name)
    else
        v14 = v9
    end
    local v15 = nil
    if v14 and v14:FindFirstChild("TextLabel") then
        local v16 = v14:FindFirstChild("TextLabel")
        if v16:FindFirstChildOfClass("UIGradient") then
            local v17 = v16:FindFirstChildOfClass("UIGradient"):Clone()
            v17.Name = "newGradient"
            v17.Parent = v6
            v6.defaultGradient.Enabled = false
            local v18 = v17.Color.Keypoints
            table.sort(v18, function(p19, p20)
                local _, v21, v22 = p19.Value:ToHSV()
                local _, v23, v24 = p20.Value:ToHSV()
                return v23 < v21 and true or v24 < v22
            end)
            local v25 = v18[1].Value
            local v26 = v25.R * 255
            local v27 = math.round(v26)
            local v28 = v25.G * 255
            local v29 = math.round(v28)
            local v30 = v25.B * 255
            local v31 = ("<font color=\"rgb(%*,%*,%*)\">%*</font>"):format(v27, v29, math.round(v30), v14.Name)
            v15 = ("\nThis Clover radiates %* Variant. Guarantees the next roll being %* Aura(s)"):format(v31, v31)
        end
    end
    if p5.SpecialAttribute and v11 ~= 1 then
        game.ReplicatedStorage.CloverAttributeLabelDesign:FindFirstChild(p5.SpecialAttribute):Clone().Parent = v6.Label
        local v32 = v_u_1.SpecialCloverAttributes[p5.SpecialAttribute]
        if v32 then
            v15 = ("- %*\"\n\"%*"):format(v15 or "", v32.Description)
        end
    end
    if p5.SpecialAttribute or p5.CloverType and p5.CloverType > 0 or p5.variant ~= 0 then
        v7 = trim((("%* %* %* \"Clover\""):format(p5.variant == 0 and "" or (v9.Name or ""), v_u_3[p5.CloverType] or "", p5.SpecialAttribute or "")))
    end
    if (p5.Multiplier or 1) < 1 then
        v6.defaultGradient.Enabled = false
        local v33 = Instance.new("UIGradient")
        v33.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
        v33.Parent = v6
        local _, v34, _ = v_u_1:GetTierFromRNG(-69420)
        v13 = v34.Name
        v7 = "\"Evil Clover\""
        v8 = "Muhahahahahah!!!!1! >:))))"
    end
    return v6, v13, v15, v7, v8
end
return Main