-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent._internal)
local v2 = require(script.Notation)
local v3 = require(script.Precision)
local v4 = require(script.IntegerWidth)
local v5 = require(script.DecimalFormatSymbols)
local v_u_6 = v_u_1.enums
local v7 = {}
local v8 = {}
local v_u_9 = v_u_1.class.create_init_function("NumberFormatter", nil, v8, nil, v_u_1.class.ImmutabilityType.NUMBER_FORMATTER)
function v8.Notation(p10, p11)
    -- upvalues: (copy) v_u_1, (copy) v_u_9
    v_u_1.class.try_coerce(1, p10, "NumberFormatter")
    return v_u_9({
        ["key"] = "notation",
        ["value"] = v_u_1.class.try_coerce(2, p11, "Notation"),
        ["parent"] = v_u_1.class.get_data(p10)
    })
end
function v8.Precision(p12, p13)
    -- upvalues: (copy) v_u_1, (copy) v_u_9
    v_u_1.class.try_coerce(1, p12, "NumberFormatter")
    return v_u_9({
        ["key"] = "precision",
        ["value"] = v_u_1.class.try_coerce(2, p13, "Precision"),
        ["parent"] = v_u_1.class.get_data(p12)
    })
end
function v8.RoundingMode(p14, p15)
    -- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_9
    v_u_1.class.try_coerce(1, p14, "NumberFormatter")
    return v_u_9({
        ["key"] = "roundingMode",
        ["value"] = v_u_1.class.try_coerce_enum(2, p15, v_u_6.RoundingMode),
        ["parent"] = v_u_1.class.get_data(p14)
    })
end
function v8.Grouping(p16, p17)
    -- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_9
    v_u_1.class.try_coerce(1, p16, "NumberFormatter")
    return v_u_9({
        ["key"] = "grouping",
        ["value"] = v_u_1.class.try_coerce_enum(2, p17, v_u_6.GroupingStrategy),
        ["parent"] = v_u_1.class.get_data(p16)
    })
end
function v8.IntegerWidth(p18, p19)
    -- upvalues: (copy) v_u_1, (copy) v_u_9
    v_u_1.class.try_coerce(1, p18, "NumberFormatter")
    return v_u_9({
        ["key"] = "integerWidth",
        ["value"] = v_u_1.class.try_coerce(2, p19, "IntegerWidth"),
        ["parent"] = v_u_1.class.get_data(p18)
    })
end
function v8.Symbols(p20, p21)
    -- upvalues: (copy) v_u_1, (copy) v_u_9
    v_u_1.class.try_coerce(1, p20, "NumberFormatter")
    return v_u_9({
        ["key"] = "symbols",
        ["value"] = v_u_1.class.try_coerce(2, p21, "DecimalFormatSymbols"),
        ["parent"] = v_u_1.class.get_data(p20)
    })
end
function v8.Sign(p22, p23)
    -- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_9
    v_u_1.class.try_coerce(1, p22, "NumberFormatter")
    return v_u_9({
        ["key"] = "sign",
        ["value"] = v_u_1.class.try_coerce_enum(2, p23, v_u_6.SignDisplay),
        ["parent"] = v_u_1.class.get_data(p22)
    })
end
function v8.Decimal(p24, p25)
    -- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_9
    v_u_1.class.try_coerce(1, p24, "NumberFormatter")
    return v_u_9({
        ["key"] = "decimal",
        ["value"] = v_u_1.class.try_coerce_enum(2, p25, v_u_6.DecimalSeparatorDisplay),
        ["parent"] = v_u_1.class.get_data(p24)
    })
end
local function v_u_27(p26)
    -- upvalues: (copy) v_u_1
    return v_u_1.formatter_settings.resolve_settings(v_u_1.formatter_settings.linked_list_to_dict(p26))
end
function v8.Format(p28, p29)
    -- upvalues: (copy) v_u_1, (copy) v_u_27, (copy) v_u_6
    v_u_1.class.try_coerce(1, p28, "NumberFormatter")
    if type(p29) == "string" then
        error("Argument #2 as a string interpreted as decimal is not currently supported, please cast the argument to a double if you want the string to be interpreted as a double", 2)
    end
    local v30 = v_u_1.class.try_coerce(2, p29, "number")
    local v31 = v_u_1.class.get_resolved_data(p28, v_u_27)
    local v32 = v31.symbols
    local v33, v34, v35
    if v30 == v30 then
        if v30 == (1 / 0) or v30 == (-1 / 0) then
            v33 = v30 < 0
            v34 = v32[v_u_6.ENumberFormatSymbols.kInfinitySymbol]
            v35 = false
        else
            local v36, v37, v38
            if v30 == 0 then
                v33 = math.atan2(v30, -1) < 0
                v36 = nil
                v37 = 0
                v38 = 1
            else
                v33 = v30 < 0
                v36, v37, v38 = v_u_1.decimal_conversion.from_double((math.abs(v30)))
            end
            v34, v35 = v_u_1.format.format_unsigned_finite(v36, v37, v38, v33, v31)
        end
    else
        local v39 = string.pack
        v33 = string.byte(v39(">d", v30)) >= 128
        v34 = v32[v_u_6.ENumberFormatSymbols.kNaNSymbol]
        v35 = true
    end
    return v_u_1.format.display_sign(v34, v33, v35, v31.displaySignAt, v31.symbols)
end
function v8.ToSkeleton(p40)
    -- upvalues: (copy) v_u_1
    local v41 = v_u_1.class.try_coerce(1, p40, "NumberFormatter")
    return v_u_1.skeleton.settings_to_skeleton(v_u_1.formatter_settings.linked_list_to_dict(v41))
end
function v7.with()
    -- upvalues: (copy) v_u_9
    return v_u_9(nil)
end
function v7.forSkeleton(p42)
    -- upvalues: (copy) v_u_1, (copy) v_u_9
    local v43 = v_u_1.class.try_coerce(1, p42, "string")
    local v44, v45 = v_u_1.skeleton.to_option_linked_list(v43)
    if v44 then
        return v44, v_u_9(v45)
    else
        return v44, v45
    end
end
return table.freeze({
    ["NumberFormatter"] = table.freeze(v7),
    ["Notation"] = v2,
    ["Precision"] = v3,
    ["RoundingPriority"] = v_u_6.RoundingPriority,
    ["RoundingMode"] = v_u_6.RoundingMode,
    ["GroupingStrategy"] = v_u_6.GroupingStrategy,
    ["IntegerWidth"] = v4,
    ["DecimalFormatSymbols"] = v5,
    ["ENumberFormatSymbols"] = v_u_6.ENumberFormatSymbols,
    ["SignDisplay"] = v_u_6.SignDisplay,
    ["DecimalSeparatorDisplay"] = v_u_6.DecimalSeparatorDisplay
})