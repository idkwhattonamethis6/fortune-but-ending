-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
repeat
    wait(0.1)
until game:IsLoaded()
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("GameData"))
local v2 = script.Parent.Remote:InvokeServer()
local v3 = script.Parent.Parent
local v_u_4 = {}
for _, v5 in v2 do
    if type(v5) ~= "string" then
        local v6 = v5[1]
        local v_u_7 = v5[2]
        local v_u_8 = v1.Enchants[v6][v_u_7]
        local v9 = v_u_8.SizeTier or v_u_7
        local v10 = game:GetService("ReplicatedStorage").EnchantOverheadDesigns:FindFirstChild(v_u_8.Name or "Debug") or game:GetService("ReplicatedStorage").EnchantOverheadDesigns:FindFirstChild("Debug")
        local v_u_11 = game:GetService("ReplicatedStorage").EnchantBall:Clone()
        v_u_11:ScaleTo(0.8 + v9 / 5)
        local v12 = v10:Clone()
        local v13 = v10:Clone()
        v12.Label.Text = v_u_8.Name
        v12.Label.Parent = v_u_11.Part.EnchantLabel
        v13.Label.Text = "1 in " .. v_u_8.Rarity
        v13.Label.Parent = v_u_11.Part.EnchantRNGLabel
        v_u_11.Parent = workspace.ActivatedEffects.EnchantOrbFolder.Value
        v_u_11:ScaleTo(1 + (v9 - 1) / 4)
        for _, v14 in v_u_11:GetDescendants() do
            if v14:IsA("LuaSourceContainer") then
                v14.Enabled = true
            end
        end
        table.insert(v_u_4, v_u_11)
        task.spawn(function()
            -- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_8
            local v15 = v_u_11.Part.EnchantRNGLabel.Label.UIGradient.Color
            for _, v16 in v_u_11.Part.Particle:GetChildren() do
                local v17 = v16.Name
                if tonumber(v17) then
                    local v18 = v16.Name
                    if tonumber(v18) > v_u_7 then
                        goto l4
                    end
                    ::l5::
                    v16.Enabled = true
                    v16.Color = v15
                else
                    ::l4::
                    if v16.Name == v_u_8.Name then
                        goto l5
                    end
                end
            end
            v_u_11.Part.Trail.Color = v15
            local v19 = 1
            local v20 = nil
            local v21 = nil
            while v_u_11.Parent do
                local v22 = v15.Keypoints[v19]
                local v23, v24
                if v22 then
                    v23 = v22.Value
                    v24 = v22.Time
                    if v20 then
                        local v25 = v24 - v21
                        local v26 = math.abs(v25)
                        local v27 = game:GetService("TweenService"):Create(v_u_11.Part, TweenInfo.new(v26, Enum.EasingStyle.Linear), {
                            ["Color"] = v23
                        })
                        local v28 = game:GetService("TweenService"):Create(v_u_11.Part.Core, TweenInfo.new(v26, Enum.EasingStyle.Linear), {
                            ["Color"] = v23
                        })
                        v27:Play()
                        v28:Play()
                        v28.Completed:Wait()
                    else
                        v_u_11.Part.Color = v23
                        v_u_11.Part.Core.Color = v23
                    end
                    v19 = v19 + 1
                else
                    v24 = v21
                    v23 = v20
                    v19 = 1
                end
                v21 = v24
                v20 = v23
            end
        end)
        v13:Destroy()
        v12:Destroy()
    end
end
local v_u_29 = game:GetService("TweenService")
function speeen(p_u_30, p_u_31)
    -- upvalues: (copy) v_u_29
    if p_u_30.Parent then
        local v_u_32 = v_u_29:Create(p_u_30, TweenInfo.new(1 / p_u_31, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["C0"] = p_u_30.C0 * CFrame.Angles(0, 3.141592653589793, 0)
        })
        v_u_32:Play()
        v_u_32.Completed:Once(function()
            -- upvalues: (copy) p_u_30, (copy) p_u_31, (copy) v_u_32
            speeen(p_u_30, p_u_31)
            v_u_32:Destroy()
        end)
    end
end
for v33, v34 in v_u_4 do
    local v35 = (v33 - 1) / 5
    local v36 = math.floor(v35)
    local v37 = #v_u_4
    local v38 = math.log(v37, 1.5) + 4
    if #v_u_4 > 5 then
        v38 = math.log10(5, 1.5) + 4 + v36 * 2
    end
    local v39 = 45 + 360 * (v33 / #v_u_4)
    if #v_u_4 > 5 then
        v39 = 45 + 360 * (v33 / 5)
    end
    local v40 = math.rad(v39)
    local v41 = math.sin(v40) * v38
    local v42 = math.cos(v40) * v38
    local v43 = Vector3.new(v41, 0, v42)
    local v44 = Instance.new("Weld")
    v44.Part0 = v3:WaitForChild("Torso")
    v44.Part1 = v34.Part
    v44.C1 = CFrame.new(v43)
    v44.Parent = v34
    speeen(v44, v36 * 0.25 + 0.75)
end
local v_u_45 = script.Parent
script.Parent = workspace
v_u_45.AncestryChanged:Connect(function()
    -- upvalues: (copy) v_u_45, (copy) v_u_4
    if not v_u_45:FindFirstAncestorOfClass("Workspace") then
        for _, v46 in v_u_4 do
            v46:Destroy()
        end
        script:Destroy()
    end
end)