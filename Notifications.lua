-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v_u_4 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Notifications")
function v1.New(p5, p6, p7, p8, p9)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
    if p5 and p7 then
        local v10 = v_u_4.Frame.TemeplateHolder.Template:Clone()
        v_u_3:AddItem(v10, p7 + 0.3)
        v10.Size = UDim2.new(0, 0, 0, 0)
        if p6 == nil then
            local v11 = Color3.fromRGB(58, 59, 76)
            v10.BackgroundColor3 = v11
            local v12, v13, v14 = v11:ToHSV()
            v10.UIStroke.Color = Color3.fromHSV(v12, v13, v14 + 0.1)
        elseif p6 == "warning" then
            local v15 = Color3.fromRGB(230, 96, 80)
            v10.BackgroundColor3 = v15
            local v16, v17, v18 = v15:ToHSV()
            v10.UIStroke.Color = Color3.fromHSV(v16, v17, v18 + 0.1)
        elseif p6 == "error" then
            local v19 = Color3.fromRGB(150, 30, 30)
            v10.BackgroundColor3 = v19
            local v20, v21, v22 = v19:ToHSV()
            v10.UIStroke.Color = Color3.fromHSV(v20, v21, v22 + 0.1)
        elseif p6 == "accept" then
            local v23 = Color3.fromRGB(55, 107, 66)
            v10.BackgroundColor3 = v23
            local v24, v25, v26 = v23:ToHSV()
            v10.UIStroke.Color = Color3.fromHSV(v24, v25, v26 + 0.1)
        else
            v10.BackgroundColor3 = p6
            local v27, v28, v29 = p6:ToHSV()
            v10.UIStroke.Color = Color3.fromHSV(v27, v28, v29 + 0.1)
        end
        local v30 = string.len(p5) / 14
        local v31 = math.ceil(v30)
        local v32 = v_u_2:Create(v10, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, v31 * 100, 0.05, 0),
            ["BackgroundTransparency"] = 0
        })
        v10.Text = p5
        if p8 == true then
            v10.Sound:Play()
        end
        if p9 == true then
            v10.SFX:Play()
        end
        v32:Play()
        v_u_2:Create(v10, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["TextTransparency"] = 0
        }):Play()
        v10.Parent = v_u_4.Frame
        task.wait(p7)
        v_u_2:Create(v10, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 0, 0, 0),
            ["Transparency"] = 1,
            ["BackgroundTransparency"] = 1
        }):Play()
        v_u_2:Create(v10.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            ["Transparency"] = 1
        }):Play()
    end
end
return v1