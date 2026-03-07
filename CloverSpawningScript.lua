-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
for _, v2 in script.Parent:GetChildren() do
    if v2:isA("Part") then
        v2.Transparency = 1
        table.insert(v_u_1, v2)
    end
end
local v_u_3 = require(script.SproutHandler)
local v_u_4 = require(game.ReplicatedStorage.GameData)
local v_u_5 = game.ServerStorage.LuckClover
local v_u_6 = Random.new()
local v7 = not v_u_4.IS_PRODUCTION and ({ 3, 10 } or nil) or nil
local v_u_8 = v7 and 60 or nil
local v_u_9 = game:GetService("RunService")
local v_u_20 = {
    ["CloverDropInterval"] = v7 or { 45, 225 },
    ["CloverDespawnDuration"] = 180,
    ["TypeChances"] = {
        100,
        50,
        25,
        10,
        10
    },
    ["PremiumRateBoost"] = 25,
    ["RegularBoost"] = 10,
    ["CloverVariantFormula"] = function()
        -- upvalues: (copy) v_u_4, (copy) v_u_6
        local v10 = 0
        for v11, v12 in v_u_4.Variants do
            local v13 = v12.RNG or v12.Rarity
            if v13 >= 1 then
                local v14 = v_u_6
                local v15 = v13 / 1.3
                if v14:NextInteger(1, (math.round(v15))) == 1 then
                    v10 = v11
                end
            end
        end
        return v10
    end,
    ["CloverMultiplierFormula"] = function()
        if math.random(1, 10000) == 1 then
            return math.random(0.1, 0.9)
        end
        local v16 = math.random()
        local v17 = math.max(v16, 0.1)
        local v18 = -math.log(v17) / 2 * 35
        local v19 = math.max(v18, 5)
        return math.round(v19)
    end
}
function GetSpawnPoint()
    -- upvalues: (copy) v_u_1
    local v21 = v_u_1[math.random(1, #v_u_1)]
    local v22 = v21.Size.X
    local _ = v21.Size.Y
    local v23 = v21.Size.Z
    local v24 = v21.Position
    local v25 = math.random(-v22 / 2, v22 / 2)
    local v26 = math.random
    local v27 = -v23 / 2
    local v28 = v23 / 2
    return v24 + Vector3.new(v25, 0, v26(v27, v28))
end
local v29 = { workspace.MainMap, workspace.Map }
local v_u_30 = RaycastParams.new()
v_u_30.FilterType = Enum.RaycastFilterType.Include
v_u_30.FilterDescendantsInstances = v29
v_u_30.RespectCanCollide = true
function spawnClover(p31, p32, p33, p34, p35, p36, p37)
    -- upvalues: (copy) v_u_20, (copy) v_u_4, (copy) v_u_5, (copy) v_u_8, (copy) v_u_30, (copy) v_u_9
    local v38 = p33 or v_u_20.CloverVariantFormula()
    local v39 = p32 or v_u_20.CloverMultiplierFormula()
    local v40 = p37 or v_u_4:getCloverSpecialAttribute()
    local v_u_41 = CFrame.new(p31 or GetSpawnPoint())
    local v42 = v_u_5:Clone()
    local v43 = "OwnerUID"
    local v44
    if p34 then
        v44 = p34.UserId or nil
    else
        v44 = nil
    end
    v42:SetAttribute(v43, v44)
    v42:SetAttribute("riggedType", p36)
    local v45 = 0
    local v46 = p36 or 0
    if not (p32 or p35) then
        v46, v39 = v_u_4:GetCloverType(v_u_20.TypeChances, v39, v46)
    end
    local v47 = v45 + v46 * 150
    local v48 = 1
    if p34 then
        v48 = v48 + (p34:GetAttribute("CloverMultiplierRate") or 0)
    end
    local v49 = v39 * v48
    local v50 = v49 / 300
    local v51 = math.log(v50)
    local v52 = (math.max(0, v51) + 1) * (v38 / 8 + 1)
    local v53 = math.min(3, v52)
    if v38 ~= 0 then
        v47 = v47 + 360
    end
    if v49 <= 1 then
        v42.Part.BillboardGui.NameTxt.Text = "Evil Clover"
        v42.Part.BillboardGui.NameTxt.TextColor3 = Color3.new(1, 0, 0)
        v42.Part.Decorate.Mesh.VertexColor = Vector3.new(5, 0.5, 0.5)
        v42.Part.PointLight.Color = Color3.new(1, 0, 0)
        v42.Part.Attachment.AltWave.Color = ColorSequence.new(Color3.new(1, 0, 0))
        v42.Part.Attachment.Icon.Color = ColorSequence.new(Color3.new(1, 0, 0))
        v42.Part.Sparkle.Color = ColorSequence.new(Color3.new(0, 0, 0))
        v53 = 1
    end
    if v46 == 5 then
        v53 = v53 * 9
        v42.Part.BillboardGui.NameTxt.Text = "UUUUOOOOHHHH PERLICA " .. v42.Part.BillboardGui.NameTxt.Text
    elseif v46 == 4 then
        v53 = v53 * 7
        v42.Part.BillboardGui.NameTxt.Text = "Titanic " .. v42.Part.BillboardGui.NameTxt.Text
    elseif v46 == 3 then
        v53 = v53 * 5
        v42.Part.BillboardGui.NameTxt.Text = "Nexus " .. v42.Part.BillboardGui.NameTxt.Text
    elseif v46 == 2 then
        v53 = v53 * 3
        v42.Part.BillboardGui.NameTxt.Text = "Giga " .. v42.Part.BillboardGui.NameTxt.Text
    elseif v46 == 1 then
        v53 = v53 * 2
        v42.Part.BillboardGui.NameTxt.Text = "Mega " .. v42.Part.BillboardGui.NameTxt.Text
    end
    v42.Multiplier.Value = v49
    v42.Variant.Value = v38
    v42:SetAttribute("CloverType", v46)
    v42:SetAttribute("CloverSpecialAttribute", v40)
    v42.Rigged.Value = (p37 or (p32 or (p33 or p36))) and true or p36
    local v54 = v42.Part
    v54.Size = v54.Size * v53
    local v55 = v42.Part.Decorate.Mesh
    v55.Scale = v55.Scale * v53
    v42.Parent = workspace
    local v56 = v42.Part.BillboardGui.Size
    v42.Part.BillboardGui.Size = UDim2.new(v56.X.Scale * v53, v56.X.Offset, v56.Y.Scale * v53, v56.Y.Offset)
    local v57 = v42.Part.BillboardGui
    local v58 = v53 + v42.Part.BillboardGui.Size.Y.Scale
    v57.StudsOffsetWorldSpace = Vector3.new(0, v58, 0)
    task.wait()
    v42.Parent = workspace.SpawnedClovers
    v42.Part.CFrame = v_u_41
    v42.RegisteredTick.Value = workspace:GetServerTimeNow()
    game.Debris:AddItem(v42, v_u_8 or v_u_20.CloverDespawnDuration + v47)
    local v_u_59 = v42.Part
    local v60 = workspace:Raycast(v_u_59.Position, Vector3.new(0, -69420, 0), v_u_30)
    local v61 = v_u_59.Position - Vector3.new(0, 50, 0)
    if v60 then
        local v62 = v60.Position
        local v63 = v_u_59.Size.Y / 2
        v61 = v62 + Vector3.new(0, v63, 0)
    end
    local v_u_64 = CFrame.new(v61)
    local v65 = (v61 - v_u_41.Position).Magnitude
    local v_u_66 = workspace:GetServerTimeNow()
    local v_u_67 = 3 * (v65 / 25)
    v_u_59.Parent.LandingAt.Value = workspace:GetServerTimeNow() + v_u_67
    v_u_59.Parent.LandingPos.Value = v61
    task.spawn(function()
        -- upvalues: (ref) v_u_9, (copy) v_u_59, (copy) v_u_66, (copy) v_u_67, (copy) v_u_41, (copy) v_u_64
        local v_u_68 = nil
        v_u_68 = v_u_9.Heartbeat:Connect(function()
            -- upvalues: (ref) v_u_59, (ref) v_u_68, (ref) v_u_66, (ref) v_u_67, (ref) v_u_41, (ref) v_u_64
            if v_u_59.Parent then
                local v69 = (workspace:GetServerTimeNow() - v_u_66) / v_u_67
                local v70 = math.min(1, v69)
                v_u_59.CFrame = v_u_41:Lerp(v_u_64, v70)
                if v70 >= 1 then
                    v_u_68:Disconnect()
                end
            else
                v_u_68:Disconnect()
            end
        end)
    end)
end
local v_u_71 = workspace.Clover_Board
local v_u_72 = workspace.Clover_Board.Decoration.Active
function CountPlayer()
    -- upvalues: (copy) v_u_20, (copy) v_u_71, (copy) v_u_72
    local v73 = 0
    for _, v74 in game.Players:GetPlayers() do
        v73 = v73 + v_u_20.RegularBoost
        if v74.MembershipType == Enum.MembershipType.Premium then
            v73 = v73 + v_u_20.PremiumRateBoost
        end
    end
    local v75 = v73 * 1
    v_u_71.Mainpart.SurfaceGui.Indicator.Text = string.format("+%s%%", v75)
    script.Boost.Value = v75
    local v76 = v75 / 300
    local v77 = math.min(1, v76)
    v_u_72.Transparency = 1 - v77
    local v78 = v75 / 300 > 0.5
    v_u_72.ParticleEmitter.Enabled = v78
    v_u_72.SpotLight.Brightness = v77
    v_u_72.ParticleEmitter.Rate = v77 * 60
    local v79 = workspace
    return v75 * (tonumber(v79:GetAttribute("CloverRate")) or 1) / 100 + 1
end
script.Event.Event:Connect(function(p80, p81, p82, p83, p84, p85, p86, p87)
    -- upvalues: (copy) v_u_4
    local v88 = tonumber(p81) or 1
    if p80 and (not p80:GetAttribute("GroupRank") or p80:GetAttribute("GroupRank") < 253) then
        v88 = math.min(v88, 10000000)
    elseif not v88 then
        spawnClover()
    end
    local v89 = p82 == "" and 0 or (tonumber(p82) or 0)
    local v90 = v_u_4.Variants[v89] and v89 and v89 or 0
    local v91 = v90 == 18 and 18 or v90
    if p80 then
        if p80.Character and (p80.Character:FindFirstChild("HumanoidRootPart") and not p87) then
            p87 = p80.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
        end
    else
        p87 = nil
    end
    if p83 then
        spawnClover(p87, v88, v91, p80, p84, p85, p86)
    else
        spawnClover(p87, v88, v91, nil, p84, p85, p86)
    end
end)
script.ForceSpawn.Event:Connect(function(p92, ...)
    spawnClover(p92, ...)
end)
local v93 = v_u_20.CloverDropInterval
local v_u_94, v_u_95 = table.unpack(v93)
local v_u_96 = game:GetService("Players")
local v_u_100 = {
    ["DropSprout"] = function()
        -- upvalues: (copy) v_u_30, (copy) v_u_3
        local v97 = GetSpawnPoint()
        local v98 = workspace:Raycast(v97, Vector3.new(0, -69420, 0), v_u_30)
        local v99 = v97 - Vector3.new(0, 50, 0)
        if v98 then
            v99 = v98.Position
        end
        v_u_3.new({
            ["SpawnLoc"] = v99
        })
    end
}
local v_u_101 = 0
v_u_100.spawnClover = v_u_100
task.defer(function()
    -- upvalues: (copy) v_u_94, (copy) v_u_95, (copy) v_u_96, (ref) v_u_101, (copy) v_u_4, (copy) v_u_100
    while true do
        local v102 = CountPlayer()
        wait(math.random(v_u_94, v_u_95) / v102)
        for _, v103 in v_u_96:GetPlayers() do
            spawnClover(nil, nil, nil, v103)
        end
        if math.random(1, 300) <= v_u_101 + 1 or (v_u_4.IS_STUDIO or not v_u_4.IS_PRODUCTION) then
            v_u_101 = 0
            v_u_100.DropSprout()
        else
            v_u_101 = v_u_101 + #v_u_96:GetPlayers() * 0.1
        end
    end
end)
return v_u_100