-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
require(v1.GameData)
require(script.EternityNum)
repeat
    wait()
until game:IsLoaded()
local _ = v1.OverheadDesigns
local _ = v1.VariantOverheadDesigns
local v_u_4 = v3.LocalPlayer
local v5 = require(v1:WaitForChild("ClientDataParser"))
local v_u_6 = v1.TradeComms
local v_u_7 = script.Parent
v_u_7.Visible = false
v_u_7.Parent.Enabled = true
local v_u_8 = v_u_7.MainContainer
local v_u_9 = v_u_7.Parent.Notification
local v_u_10 = v_u_8.ThisPlayer
local v_u_11 = v_u_8.OtherPlayer
local v_u_12 = {}
function HandleTween(p13, p14)
    -- upvalues: (copy) v_u_12
    if v_u_12[p13] then
        v_u_12[p13]:Cancel()
        v_u_12[p13] = nil
    end
    p14:Play()
    v_u_12[p13] = p14
end
v1:WaitForChild("ItemThumbnails")
local _ = {
    [1] = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(1, 1, 1)),
    [10] = ColorSequence.new(Color3.new(0.666667, 0, 1), Color3.new(1, 1, 1)),
    [100] = ColorSequence.new(Color3.new(0, 0, 1), Color3.new(1, 1, 1)),
    [1000] = ColorSequence.new(Color3.new(0.333333, 1, 0), Color3.new(1, 1, 1)),
    [10000] = ColorSequence.new(Color3.new(1, 1, 0), Color3.new(1, 1, 1)),
    [100000] = ColorSequence.new(Color3.new(1, 0.666667, 0), Color3.new(1, 1, 1)),
    [1000000] = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1))
}
local v_u_15 = {}
local v_u_16 = require(v1.RenderInventoryItems)
function renderItem(p_u_17, p_u_18, p_u_19, p20, p21, p_u_22)
    -- upvalues: (copy) v_u_16, (copy) v_u_10, (copy) v_u_2, (ref) v_u_15, (copy) v_u_6, (copy) v_u_8
    local v_u_23 = nil
    if p_u_17 == "Roll" then
        v_u_23 = v_u_16.RenderAuraSlot(p_u_19, p_u_18, nil, true)
        if v_u_23 then
            v_u_23.Parent = p21 or v_u_10.ItemContainer.InventoryList.InventoryWrapper
        end
    elseif p_u_17 == "Items" and p_u_19.Name then
        v_u_23 = v_u_16.RenderConsumableItems(p_u_19, p_u_18, true)
        if not v_u_23 then
            return
        end
        v_u_23.Parent = p21 or v_u_10.ItemContainer.InventoryList.InventoryWrapper
    elseif p_u_17 == "Enchant" then
        v_u_23 = v_u_16.RenderEnchantItems(p_u_19, p_u_18)
        v_u_23.Parent = p21 or v_u_10.ItemContainer.InventoryList.InventoryWrapper
    end
    local v_u_24 = script.Check:Clone()
    v_u_24.Parent = v_u_23
    if p20 then
        if not v_u_23 then
            return
        end
        v_u_23.Wrapper.MouseEnter:Connect(function()
            -- upvalues: (ref) v_u_23, (ref) v_u_2
            HandleTween(v_u_23, v_u_2:Create(v_u_23.Wrapper, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.new(1, 10, 1, 10)
            }))
        end)
        local function v_u_25()
            -- upvalues: (ref) v_u_23, (ref) v_u_2
            if v_u_23.Parent then
                HandleTween(v_u_23, v_u_2:Create(v_u_23.Wrapper, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                }))
            end
        end
        v_u_23.Wrapper.MouseLeave:Connect(function()
            -- upvalues: (copy) v_u_25
            v_u_25()
        end)
        if v_u_15[p_u_19] then
            v_u_23.Check.Visible = true
        end
        v_u_23.Wrapper.ClickTrigger.MouseButton1Down:Connect(function()
            -- upvalues: (ref) v_u_15, (copy) p_u_19, (ref) v_u_6, (copy) p_u_17, (copy) p_u_18, (ref) v_u_23, (ref) v_u_8, (copy) v_u_24, (copy) p_u_22
            local v26 = v_u_15[p_u_19]
            v_u_6:FireServer(v26 and "RemoveFromOffer" or "AddToOffer", {
                ["Type"] = p_u_17,
                ["Key"] = p_u_18
            })
            local v27 = not v26
            if v27 then
                local v28 = os.clock
                v27 = tostring(v28())
            end
            if v_u_23.Parent.Parent == v_u_8.ThisPlayer.ItemContainer.InventoryList then
                v_u_24.Visible = v27
                if v27 then
                    renderItem(p_u_17, p_u_18, p_u_19, true, p_u_22).Name = v27
                elseif v26 and p_u_22:FindFirstChild(v26) then
                    p_u_22:FindFirstChild(v26):Destroy()
                end
            else
                v_u_23:Destroy()
            end
            v_u_15[p_u_19] = v27
        end)
    end
    return v_u_23
end
local v_u_29 = require(v_u_10.ItemContainer.PagingControls.Control)
v_u_10.ItemContainer.CloseInventory.MouseButton1Down:Connect(function()
    -- upvalues: (copy) v_u_10, (copy) v_u_29
    v_u_10.ItemContainer.InventoryList.Visible = false
    v_u_10.ItemContainer.CloseInventory.Visible = false
    v_u_29:Toggle(nil)
end)
function pagingCleanupMethod()
    -- upvalues: (copy) v_u_10
    for _, v30 in v_u_10.ItemContainer.InventoryList.InventoryWrapper:GetChildren() do
        if v30:IsA("Frame") then
            v30:Destroy()
        end
    end
end
local v_u_31 = v_u_10.ItemContainer.InventoryList
local _ = v_u_10.ItemContainer.CloseInventory
require(game.ReplicatedStorage.GameData)
local v_u_32 = {}
function setupAddItemEvent(p_u_33, p_u_34, p_u_35)
    -- upvalues: (copy) v_u_10, (copy) v_u_32, (copy) v_u_31, (copy) v_u_29
    local v_u_36 = v_u_10.ItemContainer.OfferedList[("%*Wrapper"):format(p_u_35)]
    local v37 = v_u_32
    table.insert(v37, v_u_36)
    v_u_36.AddItem.Wrapper.ClickTrigger.MouseButton1Down:Connect(function()
        -- upvalues: (ref) v_u_10, (copy) p_u_34, (ref) v_u_31, (copy) p_u_35, (copy) v_u_36, (ref) v_u_29, (copy) p_u_33
        v_u_10.ItemContainer.InventoryList.ItemLabel.Text = p_u_34
        v_u_10.ItemContainer.CloseInventory.Visible = true
        for _, v38 in v_u_31.InventoryWrapper:GetChildren() do
            if v38:IsA("Frame") then
                v38:Destroy()
            end
        end
        v_u_31.Visible = true
        if p_u_35 == "Items" then
            v_u_29:Toggle(p_u_33, function(p39, p40)
                -- upvalues: (ref) p_u_35, (ref) v_u_36
                return renderItem(p_u_35, p39, p40, true, nil, v_u_36)
            end, pagingCleanupMethod, nil)
        else
            v_u_29:Toggle(nil)
            for v41, v42 in p_u_33 do
                renderItem(p_u_35, v41, v42, true, nil, v_u_36)
            end
        end
    end)
end
local v43 = v5.Inventory
setupAddItemEvent(v43.Items, "Item", "Items")
setupAddItemEvent(v43.Roll, "Aura", "Roll")
setupAddItemEvent(v43.Enchant, "Enchantment", "Enchant")
local v_u_69 = {
    ["OpenTradeMenu"] = function(p44)
        -- upvalues: (ref) v_u_15, (copy) v_u_32, (copy) v_u_11, (copy) v_u_7
        v_u_15 = {}
        for _, v45 in v_u_32 do
            for _, v46 in v45:GetChildren() do
                if v46:IsA("Frame") and v46.Name ~= "AddItem" then
                    v46:Destroy()
                end
            end
        end
        v_u_11.Ready.Visible = true
        v_u_11.Trade.Visible = false
        local v47 = p44.OtherPlayer
        v_u_11.PlayerName.Text = ("%*\'s Offer"):format(v47.Name)
        v_u_7.Parent.Parent["ClientBased-Rolling"].Trading.MainFrame.Visible = false
        v_u_7.Visible = true
        v_u_7.Parent.Parent["ClientBased-Rolling"].Enabled = false
    end,
    ["UpdateTrade"] = function(p48)
        -- upvalues: (copy) v_u_11
        local v49 = p48.IAm
        local v50 = p48.OfferData
        local _ = p48.OtherPlayer
        local v51 = v50[v49 == "Player1" and "Player2" or "Player1"]
        for _, v52 in v_u_11.ItemContainer.ScrollingList.ListWrapper:GetChildren() do
            if v52:IsA("Frame") and (v52.Name ~= "HackyPadding" and v52.Name ~= "ListWrapper") then
                v52:Destroy()
            end
        end
        for v53, v54 in v51 do
            for v55, v56 in v54 do
                task.spawn(renderItem, v53, v55, v56, false, v_u_11.ItemContainer.ScrollingList.ListWrapper)
            end
        end
    end,
    ["UpdateAccept"] = function(p_u_57)
        -- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_11
        local v58 = p_u_57.UpdateFor
        local v59 = p_u_57.State
        local v60
        if v58 == v_u_4 then
            v60 = v_u_10
        else
            v60 = v_u_11
        end
        local v_u_61 = p_u_57.ReadyAt == nil and true or p_u_57.ReadyAt == false
        v_u_11.Ready.Visible = v_u_61
        v_u_11.Trade.Visible = not v_u_61
        task.spawn(function()
            -- upvalues: (copy) v_u_61, (ref) v_u_11, (copy) p_u_57
            if not v_u_61 then
                v_u_11.Trade.label.Text = "TRADE"
                v_u_11.Trade.Cooldown.Visible = true
                while wait(0.1) and (workspace:GetServerTimeNow() <= p_u_57.ReadyAt and v_u_11.Trade.Visible) do
                    local v62 = v_u_11.Trade.Cooldown
                    local v63 = p_u_57.ReadyAt - workspace:GetServerTimeNow()
                    v62.Text = math.round(v63)
                end
                v_u_11.Trade.Cooldown.Visible = false
            end
        end)
        v60.ItemContainer.Ready.Visible = v59
    end,
    ["CloseTradeMenu"] = function(p64)
        -- upvalues: (copy) v_u_29, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_32
        v_u_29:Toggle(nil)
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        local v65 = p64.Message
        v_u_7.Visible = false
        v_u_7.Parent.Parent["ClientBased-Rolling"].Enabled = true
        v_u_9.Visible = true
        v_u_9.Title.Text = v65
        task.delay(3, function()
            -- upvalues: (ref) v_u_9
            v_u_9.Visible = false
        end)
        v_u_10.ItemContainer.Ready.Visible = false
        v_u_11.ItemContainer.Ready.Visible = false
        for _, v66 in v_u_11.ItemContainer.ScrollingList.ListWrapper:GetChildren() do
            if v66:IsA("Frame") and (v66.Name ~= "HackyPadding" and v66.Name ~= "ListWrapper") then
                v66:Destroy()
            end
        end
        for _, v67 in v_u_32 do
            for _, v68 in v67:GetChildren() do
                if v68:IsA("Frame") and v68.Name ~= "AddItem" then
                    v68:Destroy()
                end
            end
        end
    end
}
v_u_6.OnClientEvent:Connect(function(p70, p71)
    -- upvalues: (copy) v_u_69
    if v_u_69[p70] then
        v_u_69[p70](p71)
    end
end)
v_u_11.Ready.MouseButton1Click:Connect(function()
    -- upvalues: (copy) v_u_6, (copy) v_u_10
    v_u_6:FireServer("ToggleAccept", {
        ["AcceptState"] = not v_u_10.ItemContainer.Ready.Visible
    })
end)
v_u_11.Decline.MouseButton1Click:Connect(function()
    -- upvalues: (copy) v_u_6
    v_u_6:FireServer("EndTrade", {})
end)
v_u_11.Trade.MouseButton1Down:Connect(function()
    -- upvalues: (copy) v_u_11, (copy) v_u_6
    if not v_u_11.Trade.Cooldown.Visible then
        v_u_11.Trade.label.Text = "..."
        v_u_6:FireServer("TradeFinalize", {})
    end
end)