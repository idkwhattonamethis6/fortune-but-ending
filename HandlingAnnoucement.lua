-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local _ = game:GetService("Players").LocalPlayer
game:GetService("TextService")
local v_u_1 = script.Parent.Announcement
v_u_1.Parent = nil
local v_u_2 = {
    ["Developer Command"] = Color3.new(0, 0, 0.352941),
    ["Global Announcement"] = Color3.new(0, 0, 1),
    ["Server Announcement"] = Color3.new(1, 0, 0),
    ["Donation"] = Color3.new(0.333333, 1, 0),
    ["Big Donation"] = Color3.new(0, 1, 1),
    ["Grand Clover"] = Color3.new(1, 1, 0),
    ["Finale Clover"] = Color3.new(0, 1, 1)
}
game:GetService("ReplicatedStorage").ServerAnnouncementEvent.OnClientEvent:Connect(function(p3, p4, p5, p6, p7)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v8 = v_u_1:Clone()
    v8.Visible = true
    v8.Position = UDim2.new(0.5, 0, -0.1, 0)
    v8.ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. p4 .. "&width=420&height=420&format=png"
    v8.ImageLabel.Username.Text = p3
    v8.AnnouncementType.Text = p7
    v8.ImageLabel.Rank.Text = p5
    v8.Message.Text = p6
    v8.Parent = script.Parent
    local v9 = v_u_2[p7] or Color3.new(1, 1, 0)
    v8.AnnBackground.BackgroundColor3 = v9
    v8.BorderColor3 = v9
    v8.AnnouncementType.TextColor3 = v9
    local v10 = script.Announcement:Clone()
    v10.PlaybackSpeed = 1
    v10.PlayOnRemove = true
    v10.Parent = workspace
    task.wait()
    v10:Destroy()
    game:GetService("TweenService"):Create(v8, TweenInfo.new(2), {
        ["Position"] = UDim2.new(0.5, 0, 0.45, 0)
    }):Play()
    task.wait(5)
    game:GetService("TweenService"):Create(v8, TweenInfo.new(2), {
        ["Position"] = UDim2.new(0.5, 0, -0.1, 0)
    }):Play()
    task.wait(2)
    v8:Destroy()
end)