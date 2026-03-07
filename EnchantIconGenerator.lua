-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = Instance.new("UIStroke")
v_u_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
v_u_1.Thickness = 1
v_u_1.Color = Color3.fromRGB(255, 255, 255)
function main(p2, p3, p4, p5)
    -- upvalues: (copy) v_u_1
    local v6 = script.EnchantIcon:Clone()
    local v7 = p3:Clone()
    for _, v8 in v7:GetDescendants() do
        if v8:IsA("LuaSourceContainer") then
            v8:Destroy()
        end
    end
    local v9 = game:GetService("ReplicatedStorage").EnchantIcon:FindFirstChild(p3:GetAttribute("Custom") or "")
    if v9 then
        v6 = v9:Clone()
    end
    if p4 then
        v6.Size = UDim2.fromScale(0.6, 0.6)
        v6.Position = UDim2.fromScale(0.5, 0.5)
        v6.AnchorPoint = Vector2.new(0.5, 0.5)
    end
    if v9 then
        return v6
    end
    v7.FontFace.Bold = true
    v7.Text = "^"
    if p5 then
        v7.Text = ""
        v7.Position = UDim2.fromScale(0, 0.5)
    end
    v7.TextStrokeTransparency = 1
    for _, v10 in v7:GetChildren() do
        if v10:IsA("UIStroke") and v10.ApplyStrokeMode == Enum.ApplyStrokeMode.Contextual then
            v10.Enabled = false
        elseif v10:IsA("UIGradient") then
            v10:Clone().Parent = v6
        end
    end
    v_u_1:Clone().Parent = v7
    if p2 == 1 then
        local v11 = script.Anchor:Clone()
        v11.Parent = v6
        v11.Name = "1"
        v7:Clone().Parent = v11
    else
        for v12 = 1, p2 do
            local v13 = script.Anchor:Clone()
            local v14 = v7:Clone()
            v14.Parent = v13
            v13.Rotation = 360 / p2 * (v12 - 1)
            v13.Name = tostring(v12)
            if p5 then
                v14.Rotation = -v13.Rotation
            end
            v13.Parent = v6
        end
    end
    v7:Destroy()
    return v6
end
return main