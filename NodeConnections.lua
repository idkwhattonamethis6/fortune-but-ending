-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = Color3.fromRGB(100, 100, 100)
Color3.fromRGB(122, 122, 122)
local v_u_2 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TweenHandler"))
local v_u_3 = {
    ["nodeOffsetFromCamera"] = 50,
    ["NodeLabels"] = {
        ["Luck"] = "Fortune",
        ["Secret"] = "Wisdom",
        ["Variant"] = "Twilight",
        ["Speed"] = "Haste",
        ["CloverBoost"] = "Radioactive Volatility",
        ["Ionize"] = "Ionizing Radiation",
        ["BulkRoll"] = "Multiply",
        ["CloverStackable"] = "Radiation Compound",
        ["IndexFortune"] = "Astronomic Attraction",
        ["Gambler"] = "Unfortunate One\'s Pity",
        ["SExpand"] = "Expansion"
    },
    ["nodePartCloneFolder"] = nil,
    ["litStep"] = function(_, _) end
}
local v_u_4 = game.Players.LocalPlayer
local v_u_5 = v_u_4.PlayerGui:WaitForChild("MappingUI"):WaitForChild("Background"):WaitForChild("CountBG")
local v_u_6 = {
    { 1000, "M" },
    { 900, "CM" },
    { 500, "D" },
    { 400, "CD" },
    { 100, "C" },
    { 90, "XC" },
    { 50, "L" },
    { 40, "XL" },
    { 10, "X" },
    { 9, "IX" },
    { 5, "V" },
    { 4, "IV" },
    { 1, "I" }
}
local v_u_7 = {}
v_u_3.nodeUIs = v_u_7
function unlitNode(p8)
    -- upvalues: (copy) v_u_7
    local v9 = v_u_7[p8] or p8:FindFirstChild("Border")
    v9.Border.ImageColor3 = Color3.fromRGB(100, 100, 100)
    v9.OuterBorder.ImageColor3 = Color3.fromRGB(100, 100, 100)
    if v9:FindFirstChild("Image") then
        local v10 = v9.Image:GetDescendants()
        local v11 = v9.Image
        table.insert(v10, v11)
        for _, v12 in v10 do
            if v12:IsA("ImageLabel") and v12.Name == "Image" then
                v12.ImageColor3 = Color3.fromRGB(126, 126, 126)
            end
        end
    end
end
game:GetService("UserInputService")
local v_u_13 = game:GetService("UserInputService")
game:GetService("CollectionService")
local v_u_14 = game:GetService("TweenService")
local v_u_15 = game.Players.LocalPlayer:GetMouse()
local v_u_16 = script.Parent:Clone()
local function v_u_22(p17)
    -- upvalues: (copy) v_u_6
    local v18 = ""
    for _, v19 in ipairs(v_u_6) do
        local v20, v21 = table.unpack(v19)
        while v20 <= p17 do
            v18 = v18 .. v21
            p17 = p17 - v20
        end
    end
    return v18
end
for _, v23 in v_u_16:GetChildren() do
    if not v23:IsA("Part") then
        v23:Destroy()
    end
end
v_u_3.nodePartCloneFolder = v_u_16
v_u_16.Name = "NodeParts"
v_u_16.Parent = workspace
script:WaitForChild("DisplayTXT").Parent = script
local v24 = script.Parent:WaitForChild("StartNode")
local v_u_25 = script:WaitForChild("Select")
repeat
    wait()
until v24.Value ~= nil
local v_u_26 = v_u_16:FindFirstChild(v24.Value.Name)
function onDeselectNode(p27)
    -- upvalues: (copy) v_u_2
    if p27 then
        local v_u_28 = p27:FindFirstChild("Select")
        if v_u_28 then
            local v29 = p27.Size.X
            v_u_2.HandleTween(v_u_28, v_u_2.TS:Create(v_u_28, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.fromScale(v29 * 1.5, v29 * 1.5)
            }))
            v_u_2.HandleTween(v_u_28.ImageLabel, v_u_2.TS:Create(v_u_28.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 1
            })).Completed:Connect(function(p30)
                -- upvalues: (copy) v_u_28
                if p30 == Enum.PlaybackState.Completed then
                    v_u_28:Destroy()
                end
            end)
        end
    else
        return
    end
end
local v_u_31 = {}
local v_u_32 = 0
local v_u_33 = 0
function updateCount()
    -- upvalues: (ref) v_u_32, (copy) v_u_5, (ref) v_u_33
    if v_u_32 then
        v_u_5.Count.Text = string.format("<font size=\'20\'>%s</font><font transparency=\'.5\'>/%s</font>", v_u_32, v_u_33)
    end
end
function v_u_3.RenderNodes(p34, p_u_35)
    -- upvalues: (ref) v_u_32, (copy) v_u_3, (ref) v_u_26, (ref) v_u_33, (copy) v_u_25, (copy) v_u_2, (copy) v_u_16, (copy) v_u_7, (copy) v_u_22, (copy) v_u_4, (copy) v_u_13, (copy) v_u_31, (copy) v_u_1, (copy) v_u_15, (copy) v_u_14
    v_u_32 = 0
    for _ in p_u_35 do
        v_u_32 = v_u_32 + 1
    end
    local v36 = CFrame.new(0, 0, -22)
    local v37 = p34.Position
    local v38 = v_u_3.nodeOffsetFromCamera
    local v39 = v_u_26.CFrame
    local v_u_40 = {}
    local v_u_41 = {}
    local v_u_42 = {}
    local v43 = CFrame.new(0, 0, -v38)
    local _ = (p34 * v43).Position
    v_u_33 = 0
    local function v_u_48(p44)
        -- upvalues: (ref) v_u_25, (ref) v_u_2
        if p44 then
            local v45 = p44:FindFirstChild("Select")
            local v46 = v45 or v_u_25:Clone()
            local v47 = p44.Size.X
            if not v45 then
                v46.Size = UDim2.fromScale(v47 * 1.5, v47 * 1.5)
                v46.ImageLabel.ImageTransparency = 1
                v_u_2.HandleTween(p44, v_u_2.TS:Create(v46.ImageLabel, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                    ["Rotation"] = 180
                }))
            end
            v_u_2.HandleTween(v46, v_u_2.TS:Create(v46, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.fromScale(v47, v47)
            }))
            v_u_2.HandleTween(v46.ImageLabel, v_u_2.TS:Create(v46.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["ImageTransparency"] = 0
            }))
            v46.Parent = p44
        end
    end
    local v49 = p34 * CFrame.Angles(0, 3.141592653589793, 0) - p34.Position
    local v_u_50 = nil
    local function v_u_56(p51, _)
        -- upvalues: (ref) v_u_16, (ref) v_u_50, (copy) v_u_48
        local v52 = script:GetAttribute("lockFocus")
        if v52 then
            p51 = p51 or v_u_16:FindFirstChild(v52)
        end
        if p51 ~= v_u_50 then
            onDeselectNode(v_u_50)
            v_u_48(p51)
        end
        v_u_50 = p51
        local v53 = script
        local v54 = "HoveringNode"
        local v55 = v_u_50
        if v55 then
            v55 = v_u_50.Name
        end
        v53:SetAttribute(v54, v55)
    end
    script:GetAttributeChangedSignal("lockFocus"):Connect(function()
        -- upvalues: (ref) v_u_50
        if not script:GetAttribute("lockFocus") then
            onDeselectNode(v_u_50)
            v_u_50 = nil
            script:SetAttribute("HoveringNode", false)
        end
    end)
    local v57 = {}
    for _, v58 in v_u_16:GetChildren() do
        if v58:IsA("BasePart") or v58:IsA("UnionOperation") then
            table.insert(v57, v58)
        end
    end
    for _, v_u_59 in v57 do
        v_u_59.Anchored = true
        v_u_59.CanQuery = true
        table.insert(v_u_40, v_u_59)
        local v60 = v36 * p34 * CFrame.new(v39:ToObjectSpace(v_u_59.CFrame).Position * 1.3)
        v_u_59:SetAttribute("NodeOffsetPosition", p34:ToObjectSpace(v60))
        local v61 = (v60 * v43).Position
        v_u_59.Material = Enum.Material.ForceField
        v_u_59.Color = Color3.new(1, 1, 1)
        local v62 = CFrame.new(v61, v37)
        v_u_59.CFrame = v49 + v62.Position
        v_u_41[#v_u_40] = { v62, v61, v_u_59.CFrame.Position }
        local v63 = v_u_59:FindFirstChild("Border")
        v63.Face = Enum.NormalId.Front
        v_u_7[v_u_59] = v63
        v63.Adornee = v_u_59
        if v_u_59.Name ~= "_NodeConnection" then
            v_u_33 = v_u_33 + 1
            local v64 = script:WaitForChild("DisplayTXT"):Clone()
            local v65 = v_u_59.Name:gsub("%d", "")
            local v66 = v_u_59.Name:gsub("%a+", "")
            local v67 = tonumber(v66)
            local v68 = v67 and " " .. v_u_22(v67) or ""
            local v69 = v_u_59.Size.X / 6
            local v70 = -6 * v69
            v64.StudsOffset = Vector3.new(0, v70, 0)
            v64.Size = UDim2.new(12 * v69 * 1.2, 0, 2 * v69, 0)
            v64.Wrapper.Label.Text = (v_u_3.NodeLabels[v65] or v65) .. v68
            v64.Parent = v_u_59
            v63.Parent = v_u_4.PlayerGui
            local v71 = Instance.new("TextButton")
            v71.Text = ""
            v71.Size = UDim2.fromScale(1, 1)
            v71.BackgroundTransparency = 1
            v71.Parent = v63:FindFirstChild("OuterBorder")
            v71.Active = false
            if v_u_13.TouchEnabled and not v_u_13.KeyboardEnabled then
                v71.MouseButton1Up:Connect(function()
                    -- upvalues: (copy) v_u_56, (copy) v_u_59
                    v_u_56(v_u_59)
                end)
            else
                v71.MouseButton1Click:Connect(function()
                    -- upvalues: (copy) v_u_56, (copy) v_u_59
                    v_u_56(v_u_59)
                end)
                v71.MouseEnter:connect(function()
                    -- upvalues: (copy) v_u_56, (copy) v_u_59
                    v_u_56(v_u_59)
                end)
                v71.MouseLeave:connect(function()
                    -- upvalues: (copy) v_u_56
                    v_u_56(nil)
                end)
            end
            v_u_59:SetAttribute("NodeHitboxSize", v69)
        end
    end
    updateCount()
    for _, v72 in v57 do
        local v73 = v72.Size.X
        v_u_31[v72] = {}
        for _, v74 in v72:GetChildren() do
            if v74:IsA("Beam") and (v74.Attachment0 and v74.Attachment1) then
                v74.Segments = 150
                v74.Color = ColorSequence.new(v_u_1)
                local v75 = Instance.new("Attachment")
                v75.Parent = v74.Parent
                v75.WorldCFrame = CFrame.new(v72.Position, v74.Attachment1.Parent.Position) * CFrame.new(0, 0, -v73 / 2 + 0.05)
                local _, v76, _ = v75.WorldCFrame:ToEulerAnglesYXZ()
                v75.WorldCFrame = v75.WorldCFrame * (CFrame.Angles(0, -v76, 0) * CFrame.Angles(0, 0, 3.141592653589793))
                v74.Attachment0 = v75
                v75.Name = "Self-" .. v74.Attachment1.Parent.Name
                v74.Name = "Self-" .. v74.Attachment1.Parent.Name
                v_u_31[v72][v74.Attachment1.Parent] = v74
                local v77 = v74.Attachment1.Parent.Size.X
                local v78 = Instance.new("Attachment")
                v78.Parent = v74.Attachment1.Parent
                v78.WorldCFrame = CFrame.new(v74.Attachment1.Parent.Position, v72.Position) * CFrame.new(0, 0, -v77 / 2 + 0.05)
                v78.WorldCFrame = v78.WorldCFrame * CFrame.Angles(0, -v76, 0)
                v78.Name = v72.Name .. "-Self"
                if v74.Attachment1.Parent.Name == "_NodeConnection" then
                    v_u_42[v74.Attachment1.Parent] = v72.Name
                end
                v74.Attachment1 = v78
            end
        end
    end
    for _, v79 in v57 do
        for _, v80 in v79:GetChildren() do
            if v80:IsA("Beam") and not (v80.Attachment1 and v80.Attachment0) then
                v80:Destroy()
            end
        end
    end
    local v_u_81 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local function v_u_83(p82)
        -- upvalues: (ref) v_u_2, (copy) v_u_81
        return v_u_2.HandleTween(p82, v_u_2.TS:Create(p82, v_u_81, {
            ["ImageColor3"] = Color3.new(1, 1, 1)
        }))
    end
    local function v_u_89(p84)
        -- upvalues: (ref) v_u_7, (copy) v_u_83
        local v85 = v_u_7[p84] or p84:FindFirstChild("Border")
        v_u_83(v85.Border)
        if v85:FindFirstChild("Image") then
            local v86 = v85.Image:GetDescendants()
            local v87 = v85.Image
            table.insert(v86, v87)
            for _, v88 in v86 do
                if v88:IsA("ImageLabel") and v88.Name == "Image" then
                    v_u_83(v88)
                end
            end
        end
        return v_u_83(v85.OuterBorder)
    end
    for _, v90 in v57 do
        unlitNode(v90)
    end
    function v_u_3.loadAnim()
        -- upvalues: (ref) v_u_7, (ref) v_u_16, (copy) v_u_89, (ref) v_u_31, (copy) v_u_42, (copy) p_u_35, (ref) v_u_32, (ref) v_u_3, (ref) v_u_26
        local v_u_91 = {}
        game:GetService("RunService").PreRender:Connect(function()
            -- upvalues: (copy) v_u_91, (ref) v_u_7
            local v92 = {}
            for v93, v94 in v_u_91 do
                local v95 = v94 or v93.Attachment0.Parent
                local _, _, v96 = (v_u_7[v95] or v95:FindFirstChild("Border")):FindFirstChild("Border").ImageColor3:ToHSV()
                if v96 == 1 then
                    table.insert(v92, v93)
                end
                local v97 = ColorSequence.new
                local v98 = {}
                local v99 = ColorSequenceKeypoint.new
                local v100 = v93.Attachment0.Parent
                local v101 = v99(0, (v_u_7[v100] or v100:FindFirstChild("Border")):FindFirstChild("Border").ImageColor3)
                local v102 = ColorSequenceKeypoint.new
                local v103 = v93.Attachment1.Parent
                __set_list(v98, 1, {v101, v102(1, (v_u_7[v103] or v103:FindFirstChild("Border")):FindFirstChild("Border").ImageColor3)})
                v93.Color = v97(v98)
            end
            for _, v104 in v92 do
                v_u_91[v104] = nil
            end
        end)
        local function v_u_108(p105, _)
            -- upvalues: (ref) v_u_16, (ref) v_u_89, (copy) v_u_91, (ref) v_u_31, (ref) v_u_42, (ref) p_u_35, (copy) v_u_108
            if typeof(p105) == "string" then
                p105 = v_u_16:FindFirstChild(p105)
            end
            if p105 then
                v_u_89(p105)
                for _, v106 in p105:GetChildren() do
                    if v106:IsA("Beam") then
                        v_u_91[v106] = false
                    end
                end
                for v107, _ in v_u_31[p105] do
                    if p_u_35[v107.Name == "_NodeConnection" and v_u_42[v107] or v107.Name] or v107.Name == "_NodeConnection" then
                        task.delay(0.1, v_u_108, v107)
                    end
                end
            end
        end
        function v_u_3.litStep(_, p109)
            -- upvalues: (ref) v_u_16, (ref) v_u_32, (copy) v_u_108, (ref) v_u_31, (copy) v_u_91
            local v110 = v_u_16:FindFirstChild(typeof(p109) == "string" and p109 and p109 or p109.Name)
            v_u_32 = v_u_32 + 1
            updateCount()
            v_u_108(v110, true)
            for _, v111 in v_u_31 do
                if v111[v110] then
                    v_u_91[v111[v110]] = v110
                end
            end
        end
        if p_u_35[v_u_26.Name] then
            v_u_108(v_u_26.Name)
        end
    end
    local v_u_112 = Enum.EasingStyle.Sine
    local v_u_113 = Enum.EasingDirection.Out
    local v_u_114 = p34
    game:GetService("RunService").PreRender:Connect(function(p115)
        -- upvalues: (ref) v_u_114, (ref) v_u_3, (ref) v_u_15, (copy) v_u_40, (copy) v_u_41, (ref) v_u_14, (copy) v_u_112, (copy) v_u_113
        local v116 = p115 * 60
        local v117 = script:GetAttribute("zoomRate")
        v_u_114 = v_u_114:Lerp(script:GetAttribute("startCF"), 0.1 * v116)
        local v118 = v_u_114 * CFrame.new(0, 0, -v_u_3.nodeOffsetFromCamera)
        local v119 = workspace.CurrentCamera.CFrame.Position
        local v120 = CFrame.new(v119, CFrame.new(v119, v_u_15.Hit.Position) * Vector3.new(0, 0, -69420))
        local v121 = v120.Position
        local v122 = workspace.CurrentCamera.CFrame * CFrame.Angles(0, 3.141592653589793, 0) - workspace.CurrentCamera.CFrame.Position
        for v123, v124 in v_u_40 do
            local v125 = v_u_41[v123]
            local v126 = v_u_14:GetValue((v118.Position - v125[2]).Magnitude / 100, v_u_112, v_u_113) * 60
            local v127
            if v126 > 0 then
                local v128 = CFrame.new(v125[3], v119)
                local v129 = -v126
                local v130 = v128 * Vector3.new(0, 0, v129) - v125[3]
                local v131 = v118.Position
                local v132 = -v126
                v127 = v130:Lerp(v131 - v118 * Vector3.new(0, 0, v132), 0.5)
            else
                v127 = Vector3.new(0, 0, 0)
            end
            local v133, v134 = v120:ToObjectSpace((CFrame.new(v121, v125[1].Position + v127))):ToEulerAnglesYXZ()
            local v135 = (math.abs(v133) + math.abs(v134)) * 3
            if v117 < 0 and v135 < 1 then
                local v136 = CFrame.new(v125[1].Position + v127, v119)
                local v137 = v117 + v126 / 2
                v127 = v127:Lerp(v136 * Vector3.new(0, 0, v137) - v125[3], 1 - v135)
            end
            v124.CFrame = v122 + (v125[1] + v127).Position
        end
    end)
end
function v_u_3.CleanUp()
    -- upvalues: (copy) v_u_7
    for _, v138 in v_u_7 do
        v138:Destroy()
    end
end
return v_u_3