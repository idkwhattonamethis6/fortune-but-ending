-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_40 = {
    ["number"] = function(p1, p2, p3)
        return p1 + (p2 - p1) * p3
    end,
    ["boolean"] = function(p4, p5, p6)
        if p6 < 0.5 then
            p5 = p4 or p5
        end
        return p5
    end,
    ["string"] = function(p7, p8, p9)
        local v10 = string.len(p7)
        local v11 = string.len(p8)
        local v12 = v10 * (1 - p9)
        local v13 = string.sub(p7, 1, v12)
        local v14 = v11 * p9
        return v13 .. string.sub(p8, 1, v14)
    end,
    ["Vector3"] = function(p15, p16, p17)
        return p15:Lerp(p16, p17)
    end,
    ["Vector2"] = function(...)
        -- upvalues: (copy) v_u_40
        return v_u_40.Vector3(...)
    end,
    ["CFrame"] = function(...)
        -- upvalues: (copy) v_u_40
        return v_u_40.Vector3(...)
    end,
    ["Color3"] = function(...)
        -- upvalues: (copy) v_u_40
        return v_u_40.Vector3(...)
    end,
    ["NumberRange"] = function(p18, p19, p20)
        -- upvalues: (copy) v_u_40
        return NumberRange.new(v_u_40.number(p18.Min, p19.Min, p20), v_u_40.number(p18.Max, p19.Max, p20))
    end,
    ["NumberSequence"] = function(p21, p22, p23)
        -- upvalues: (copy) v_u_40
        local v24 = #p21.Keypoints == #p22.Keypoints
        assert(v24, "Number of NumberSequence keypoints must match")
        local v25 = {}
        for v26, v27 in p21.Keypoints do
            local v28 = p22.Keypoints[v26]
            local v29 = NumberSequenceKeypoint.new
            local v30 = v_u_40.number(v27.Time, v28.Time, p23)
            local v31 = v_u_40.number(v27.Value, v28.Value, p23)
            local v32 = v_u_40.number
            local v33 = v27.Envelope
            local v34 = v28.Envelope
            table.insert(v25, v29(v30, v31, v32(v33, v34, p23)))
        end
        return NumberSequence.new(v25)
    end,
    ["ColorSequence"] = function(p35, p36, p37)
        local v38 = p35.Keypoints[1].Value
        local v39 = p36.Keypoints[1].Value
        return ColorSequence.new(v38:Lerp(v39, p37))
    end
}
return v_u_40