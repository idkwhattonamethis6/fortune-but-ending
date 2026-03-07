-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Modules.ClientDataReader)()
local v_u_2 = require(game.ReplicatedStorage.UI.Stories.Interface.RewardPop)
function Main(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    v_u_2.TemporaryDock(p3)
    p3.InputBegan:Connect(function(p4)
        -- upvalues: (ref) v_u_1, (ref) v_u_2
        if p4.UserInputType == Enum.UserInputType.MouseButton1 then
            local v5 = {}
            for _, v6 in v_u_1.Inventory.Item do
                if math.random() > 0.1 then
                    table.insert(v5, v6)
                end
            end
            v_u_2.Show(v5)
        end
    end)
    local v7 = {}
    for _, v8 in v_u_1.Inventory.Item do
        if math.random() > 0.1 then
            table.insert(v7, v8)
        end
    end
    v_u_2.Show(v7)
end
return Main