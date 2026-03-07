-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Assets
local v_u_3 = require(script.Assets.Modules.Ragdoll)
return {
    ["begin"] = function(p_u_4)
        -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
        if not game.Players.LocalPlayer then
            local v_u_5 = p_u_4.Character
            local v6 = v_u_5.Humanoid
            local v7 = v_u_5.HumanoidRootPart
            local v_u_8 = v6:LoadAnimation(script.Animation)
            v_u_8:Play()
            v_u_8:GetMarkerReachedSignal("Stop"):Connect(function()
                -- upvalues: (copy) v_u_8
                v_u_8:AdjustSpeed(0)
            end)
            v7.Anchored = true
            v6.AutoRotate = false
            task.wait(3.5)
            local v9 = v_u_2.MalevolentShrine.GroundPiece.Attachment:Clone()
            v9.Parent = v7
            local v10 = script.Waterdrop:Clone()
            v10.Parent = v7
            v10:Play()
            game.Debris:AddItem(v10, 5)
            task.wait(0.5)
            local v11 = v_u_2.MalevolentShrine.Part.Attachment:Clone()
            v11.Parent = v7
            v11.Emit:Emit(3)
            local v12 = v_u_2.MalevolentShrine.Part.Attachment2:Clone()
            v12.Parent = v7
            v12.Emit:Emit(3)
            v9.Splash.Enabled = false
            v9.Splash2.Enabled = false
            local v13 = script.Sound:Clone()
            v13.Parent = v7
            v13:Play()
            task.wait(0.5)
            for _, v14 in v11:GetDescendants() do
                if v14:IsA("ParticleEmitter") then
                    v14.Enabled = false
                end
            end
            for _, v15 in v12:GetDescendants() do
                if v15:IsA("ParticleEmitter") then
                    v15.Enabled = false
                end
            end
            local v16 = script.White:Clone()
            v16.Parent = v_u_5
            v16.Enabled = true
            local v17 = v_u_2.MalevolentShrine.MalevolentShrine:Clone()
            v17.Parent = workspace.Effects
            v17.CFrame = v7.CFrame * CFrame.new(0, 0, 0)
            v17.MalevolentShrine.Main.CFrame = v7.CFrame * CFrame.new(0, -85, -23) * CFrame.Angles(0, 1.5707963267948966, 0)
            v7.Anchored = false
            local v18 = Instance.new("BodyVelocity", v7)
            v18.MaxForce = Vector3.new(1000000, 1000000, 1000000)
            v18.Parent = v7
            v18.Velocity = Vector3.new(1, 1, 1) * p_u_4.Character:WaitForChild("HumanoidRootPart").CFrame.LookVector * 0
            v18.Name = "SmallMoveVel"
            v_u_1:Create(v7, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["CFrame"] = v7.CFrame * CFrame.new(0, 17, 0)
            }):Play()
            v_u_1:Create(v17.MalevolentShrine.Main, TweenInfo.new(1.5, Enum.EasingStyle.Cubic), {
                ["CFrame"] = v17.MalevolentShrine.Main.CFrame * CFrame.new(0, 100, 0)
            }):Play()
            task.wait(1)
            v7.Anchored = true
            local v19 = script.ImpactFrame:Clone()
            v19.Parent = v_u_5
            v19.Enabled = true
            local v20 = script.Night:Clone()
            v20.Parent = v_u_5
            v20.Enabled = true
            local v_u_21 = v_u_2.MalevolentShrine.DomainExpansionFX:Clone()
            v_u_21.Parent = workspace.Effects
            v_u_21.CFrame = v7.CFrame * CFrame.new(0, 31, 0)
            spawn(function()
                -- upvalues: (copy) v_u_21, (copy) v_u_5, (ref) v_u_2, (copy) p_u_4
                for _ = 1, 260 do
                    task.wait(0.1)
                    local v22 = {}
                    for _, v23 in workspace:GetPartBoundsInBox(v_u_21.CFrame * CFrame.new(0, 0, 0), Vector3.new(500, 100, 500)) do
                        if v23.Parent and (v23.Parent:FindFirstChild("Humanoid") and (v23.Parent ~= v_u_5 and (v23.Parent:FindFirstChild("HumanoidRootPart") and (v23.Parent.HumanoidRootPart.Anchored == false and not v22[v23.Parent.Humanoid])))) then
                            v22[v23.Parent.Humanoid] = true
                            local v24 = v23.Parent.HumanoidRootPart
                            local v25 = v23.Parent.Humanoid:LoadAnimation(script.Hit1)
                            local v26 = v23.Parent.Humanoid:LoadAnimation(script.Hit2)
                            v23.Parent.Humanoid:TakeDamage(5)
                            local v27 = script.HitSound:Clone()
                            v27.Parent = v24
                            v27:Play()
                            game.Debris:AddItem(v27, 1)
                            if math.random(1, 2) == 1 then
                                v25:Play()
                            else
                                v26:Play()
                            end
                            local v28 = v_u_2.MalevolentShrine.Blood.blood:Clone()
                            v28.Parent = v24
                            for _, v29 in v28:GetDescendants() do
                                if v29:IsA("ParticleEmitter") then
                                    v29:Emit(v29:GetAttribute("EmitCount"))
                                end
                            end
                            game.Debris:AddItem(v28, 2)
                            local v30 = Instance.new("BodyVelocity", v23.Parent.Torso)
                            v30.MaxForce = Vector3.new(1000000, 1000000, 1000000)
                            v30.Parent = v23.Parent.Torso
                            v30.Velocity = Vector3.new(1, 1, 1) * p_u_4.Character:WaitForChild("HumanoidRootPart").CFrame.LookVector * 0
                            v30.Name = "SmallMoveVel"
                            game.Debris:AddItem(v30, 0.1)
                        end
                    end
                end
            end)
            for _, v31 in game:GetService("Players"):GetPlayers() do
                v_u_2.Events.ShakeClient:Clone().Parent = v31.Character
            end
            task.wait(30)
            v19.Enabled = false
            for _, v32 in v_u_21:GetDescendants() do
                if v32:IsA("ParticleEmitter") then
                    v32.Enabled = false
                end
            end
            local v33 = script["Charging Flame"]:Clone()
            v33.Parent = v_u_21
            v33:Play()
            for _, v34 in v_u_21.Attachment:GetDescendants() do
                if v34:IsA("ParticleEmitter") then
                    v34:Emit(v34:GetAttribute("EmitCount"))
                end
            end
            task.wait(0.3)
            local v35 = {}
            for _, v_u_36 in workspace:GetPartBoundsInBox(v_u_21.CFrame * CFrame.new(0, 0, 0), Vector3.new(500, 100, 500)) do
                if v_u_36.Parent and (v_u_36.Parent:FindFirstChild("Humanoid") and (v_u_36.Parent ~= v_u_5 and (v_u_36.Parent:FindFirstChild("HumanoidRootPart") and (v_u_36.Parent.HumanoidRootPart.Anchored == false and not v35[v_u_36.Parent.Humanoid])))) then
                    v35[v_u_36.Parent.Humanoid] = true
                    v_u_36.Parent.Humanoid:TakeDamage(50)
                    v_u_3.StartRagdoll(v_u_36.Parent)
                    local v37 = Instance.new("BodyVelocity", v_u_36.Parent.HumanoidRootPart)
                    v37.MaxForce = Vector3.new(1000000, 1000000, 1000000)
                    v37.Parent = v_u_36.Parent.HumanoidRootPart
                    v37.Velocity = Vector3.new(1, 1, 1) * p_u_4.Character:WaitForChild("HumanoidRootPart").CFrame.UpVector * 100
                    v37.Name = "SmallMoveVel"
                    game.Debris:AddItem(v37, 0.2)
                    task.delay(1, function()
                        -- upvalues: (ref) v_u_3, (copy) v_u_36
                        v_u_3.EndRagdoll(v_u_36.Parent)
                    end)
                end
            end
            v19.Enabled = true
            local v38 = script["Fire 2"]:Clone()
            v38.Parent = v_u_21
            v38:Play()
            for _, v39 in v_u_21.Attachment2:GetDescendants() do
                if v39:IsA("ParticleEmitter") then
                    v39:Emit(v39:GetAttribute("EmitCount"))
                end
            end
            task.wait(0.7)
            local v40 = script.Flame:Clone()
            v40.Parent = v17.MalevolentShrine.Rock
            v40:Play()
            v_u_1:Create(v7, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                ["CFrame"] = v7.CFrame * CFrame.new(0, -17, 0)
            }):Play()
            v_u_1:Create(v17.MalevolentShrine.Main, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
                ["CFrame"] = v17.MalevolentShrine.Main.CFrame * CFrame.new(0, -100, 0)
            }):Play()
            for _, v41 in v17.MalevolentShrine.Rock:GetDescendants() do
                if v41:IsA("ParticleEmitter") then
                    v41.Enabled = true
                end
            end
            v19.Enabled = false
            task.wait(0.5)
            v16.Enabled = false
            local v42 = script.Day:Clone()
            v42.Parent = v_u_5
            v42.Enabled = true
            v19.Enabled = true
            v_u_8:Stop()
            v18:Destroy()
            v6.AutoRotate = true
            v7.Anchored = false
            for _, v43 in v17.MalevolentShrine.Rock:GetDescendants() do
                if v43:IsA("ParticleEmitter") then
                    v43.Enabled = false
                end
            end
            task.wait(5)
            v20:Destroy()
            v42:Destroy()
            v19:Destroy()
            v13:Destroy()
            v17:Destroy()
        end
    end
}