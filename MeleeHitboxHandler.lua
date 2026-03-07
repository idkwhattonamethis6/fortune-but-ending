-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
function SetupAnimHitbox(p_u_1, p2, p_u_3)
    local v4 = string.gsub(p2.Animation.AnimationId, "rbxassetid://", "")
    local v_u_5 = tonumber(v4)
    local v_u_6 = table.find(p_u_3.Animations, v_u_5)
    local v_u_7 = {}
    p2:GetMarkerReachedSignal("Attack"):connect(function()
        -- upvalues: (copy) p_u_3, (copy) v_u_6, (copy) v_u_7, (copy) p_u_1, (ref) v_u_5
        local v_u_8 = p_u_3.Hitbox[v_u_6]
        local v_u_9 = {}
        local v10 = v_u_7
        local v11 = p_u_1.Char[v_u_8].Touched
        local function v16(p12)
            -- upvalues: (ref) p_u_1, (copy) v_u_9, (ref) p_u_3, (ref) v_u_5, (copy) v_u_8
            if p12.Parent then
                if p12:IsDescendantOf(p_u_1.Char) then
                    return
                elseif table.find(v_u_9, p12.Parent) then
                    return
                elseif p12.Parent:FindFirstChild("Humanoid") then
                    local v13 = v_u_9
                    local v14 = p12.Parent
                    table.insert(v13, v14)
                    local v15 = v_u_5
                    p_u_1.CommunicateRemote:FireServer("Hitbox", p_u_3.AttackName, tonumber(v15), p_u_1.Char[v_u_8].CFrame, p12, workspace:GetServerTimeNow())
                end
            else
                return
            end
        end
        table.insert(v10, v11:connect(v16))
    end)
    p2:GetMarkerReachedSignal("AttackEnd"):Connect(function()
        -- upvalues: (copy) v_u_7
        for _, v17 in v_u_7 do
            v17:Disconnect()
        end
    end)
end
return SetupAnimHitbox