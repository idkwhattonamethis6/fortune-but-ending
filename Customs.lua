-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent.DataTypes)
local v12 = {
    ["Pivot"] = {
        ["Whitelist"] = { "PVInstance" },
        ["Set"] = function(p2, p3, p4, p5)
            -- upvalues: (copy) v_u_1
            p2:PivotTo((v_u_1.CFrame(p3, p4, p5)))
        end,
        ["Get"] = function(p6)
            return p6:GetPivot()
        end
    },
    ["Scale"] = {
        ["Whitelist"] = { "Model" },
        ["Set"] = function(p7, p8, p9, p10)
            -- upvalues: (copy) v_u_1
            p7:ScaleTo((v_u_1.number(p8, p9, p10)))
        end,
        ["Get"] = function(p11)
            return p11:GetScale()
        end
    }
}
return v12