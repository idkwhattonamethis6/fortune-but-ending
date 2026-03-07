-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    0.9999999999998099,
    676.5203681218851,
    -1259.1392167224028,
    771.3234287776531,
    -176.6150291621406,
    12.507343278686905,
    -0.13857109526572012,
    9.984369578019572e-6,
    1.5056327351493116e-7
}
function F_Gamma(p2)
    -- upvalues: (copy) v_u_1
    if p2 > 171.6236 then
        return (1 / 0)
    end
    if p2 <= 0.5 then
        local v3 = 3.141592653589793 * p2
        return 3.141592653589793 / (math.sin(v3) * F_Gamma(1 - p2))
    end
    local v4 = p2 - 1
    local v5 = v_u_1[1] + v_u_1[2] / (v4 + 1) + v_u_1[3] / (v4 + 2) + v_u_1[4] / (v4 + 3) + v_u_1[5] / (v4 + 4) + v_u_1[6] / (v4 + 5) + v_u_1[7] / (v4 + 6) + v_u_1[8] / (v4 + 7)
    local v6 = v4 + 7.5
    local v7 = v5 * v6 ^ (v4 + 0.5 - 36)
    local v8 = -v6
    return v7 * math.exp(v8) * v6 ^ 36 * 2.5066282746310007
end
function f_Lambertw(p9)
    if p9 > 1.79e308 then
        return p9
    end
    if p9 == 0 then
        return p9
    end
    if p9 == 1 then
        return 0.5671432904097838
    end
    local v10
    if p9 < 10 then
        v10 = 0
    else
        local v11 = math.log(p9)
        local v12 = math.log(p9)
        v10 = v11 - math.log(v12)
    end
    for _ = 1, 100 do
        local v13 = -v10
        local v14 = (p9 * math.exp(v13) + v10 * v10) / (v10 + 1)
        local v15 = v14 - v10
        if math.abs(v15) < math.abs(v14) * 1e-10 then
            return v14
        end
        v10 = v14
    end
    error("Failed to itterate z.... at function: f_lambertw")
end
local v_u_16 = {}
function Cnew(p17, p18, p19)
    return {
        ["Sign"] = p17,
        ["Layer"] = p18,
        ["Exp"] = p19
    }
end
local v_u_20 = Cnew(0, 0, 0)
local v_u_21 = Cnew(1, 0, 1)
local v_u_22 = Cnew(1, -1, 1)
local v_u_23 = Cnew(1, (1 / 0), 1)
function v_u_16.IsNaN(p24)
    -- upvalues: (copy) v_u_22
    local v25
    if p24.Sign == v_u_22.Sign and p24.Layer == v_u_22.Layer then
        v25 = p24.Exp == v_u_22.Exp
    else
        v25 = false
    end
    return v25
end
function v_u_16.IsInf(p26)
    return p26.Layer == (1 / 0) and true or p26.Exp == (1 / 0)
end
function v_u_16.IsZero(p27)
    local v28
    if p27.Sign == 0 then
        v28 = true
    elseif p27.Exp == 0 then
        v28 = p27.Layer == 0
    else
        v28 = false
    end
    return v28
end
function v_u_16.correct(p29)
    -- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_23, (copy) v_u_20
    if v_u_16.IsNaN(p29) then
        return v_u_22
    elseif v_u_16.IsInf(p29) then
        return v_u_23
    elseif v_u_16.IsZero(p29) then
        return v_u_20
    else
        local v30 = p29.Sign
        local v31 = p29.Layer
        local v32 = p29.Exp
        if v31 == 0 and v32 < 0 then
            v32 = -v32
            v30 = -v30
        end
        if v31 == 0 and v32 < 1e-10 then
            local v33 = v31 + 1
            local v34 = math.log10(v32)
            return Cnew(v30, v33, v34)
        else
            local v35 = math.abs(v32)
            local v36 = math.sign(v32)
            if v35 >= 10000000000 then
                local v37 = v31 + 1
                local v38 = v36 * math.log10(v35)
                return Cnew(v30, v37, v38)
            else
                while v35 < 10 and v31 > 0 do
                    v31 = v31 - 1
                    if v31 == 0 then
                        v32 = math.pow(10, v32)
                    else
                        v32 = v36 * math.pow(10, v35)
                        v35 = math.abs(v32)
                        v36 = math.sign(v32)
                    end
                end
                if v31 == 0 then
                    if v32 < 0 then
                        v32 = -v32
                        v30 = -v30
                    end
                elseif v32 == 0 then
                    v30 = 0
                end
                return Cnew(v30, v31, v32)
            end
        end
    end
end
function v_u_16.new(p39, p40, p41)
    -- upvalues: (copy) v_u_16
    return v_u_16.correct({
        ["Sign"] = p39,
        ["Layer"] = p40,
        ["Exp"] = p41
    })
end
function v_u_16.fromNumber(p42)
    -- upvalues: (copy) v_u_16
    local v43 = {
        ["Sign"] = math.sign(p42),
        ["Layer"] = 0,
        ["Exp"] = math.abs(p42)
    }
    return v_u_16.correct(v43)
end
function v_u_16.fromScientific(p44)
    -- upvalues: (copy) v_u_16, (copy) v_u_20
    local v45 = p44:split("e")
    local v46 = v45[1]
    local v47 = tonumber(v46)
    local v48 = v45[2]
    local v49 = tonumber(v48)
    local v50 = math.sign(v47)
    local v51 = math.log10(v47)
    local v52 = math.floor(v51)
    if v52 > 0 then
        v47 = v47 / 10 ^ v52
        v49 = v49 + v52
    end
    if v49 == 0 then
        return v_u_16.new(math.sign(v47), 0, v47)
    end
    if v47 == 0 then
        return v_u_20
    end
    if v47 < 0 then
        v47 = -v47
    end
    if v49 < 0 then
        if v49 < -100 then
            return v_u_20
        end
        local v53 = math.log10(v47) + v49
        return v_u_16.correct(v_u_16.new(v50, 1, v53))
    end
    local v54 = math.log10(v47) + v49
    local v55 = 1
    if v54 > 10000000000 then
        v54 = math.log10(v54)
        v55 = v55 + 1
    end
    return v_u_16.correct(v_u_16.new(v50, v55, v54))
end
function v_u_16.fromDefaultStringFormat(p56)
    -- upvalues: (copy) v_u_16
    local v57 = p56:split(";")
    local v58 = v57[1]
    local v59 = tonumber(v58)
    local v60 = math.sign(v59)
    local v61 = v60 == 0 and 1 or v60
    local v62 = v57[1]
    local v63 = tonumber(v62)
    local v64 = math.abs(v63)
    local v65 = v57[2]
    local v66 = tonumber(v65)
    return v_u_16.correct(v_u_16.new(v61, v64, v66))
end
function v_u_16.fromString(p67)
    -- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_23, (copy) v_u_20
    if p67:find("e") and not p67:find(";") then
        return v_u_16.fromScientific(p67)
    elseif p67:find(";") then
        return v_u_16.fromDefaultStringFormat(p67)
    elseif p67 == "NaN" then
        return v_u_22
    elseif p67 == "Inf" then
        return v_u_23
    elseif p67 == "" then
        return v_u_20
    else
        return v_u_16.fromNumber((tonumber(p67)))
    end
end
function v_u_16.toString(p68)
    -- upvalues: (copy) v_u_16
    return v_u_16.IsNaN(p68) and "NaN" or (v_u_16.IsInf(p68) and "Inf" or p68.Layer .. ";" .. p68.Exp)
end
function v_u_16.convert(p69)
    -- upvalues: (copy) v_u_16, (copy) v_u_20
    if typeof(p69) == "number" then
        return v_u_16.fromNumber(p69)
    end
    if typeof(p69) == "string" then
        return v_u_16.fromString(p69)
    end
    if typeof(p69) == "table" then
        if #p69 == 2 then
            local v70 = p69[1] .. "e" .. p69[2]
            return v_u_16.fromScientific(v70)
        end
        if #p69 == 3 then
            return v_u_16.correct(v_u_16.new(p69[1], p69[2], p69[3]))
        end
        if p69.Sign then
            return v_u_16.correct(v_u_16.new(p69.Sign, p69.Layer, p69.Exp))
        end
    end
    warn("Returning DefaultReturn at EN.Convert(): Invalid input!")
    return v_u_20
end
function v_u_16.toNumber(p71)
    if p71.Layer > 1 then
        local v72 = p71.Exp
        if math.sign(v72) == -1 then
            return p71.Sign * 0
        else
            return p71.Sign * (1 / 0)
        end
    elseif p71.Layer == 0 then
        return p71.Sign * p71.Exp
    else
        return p71.Layer ~= 1 and (0 / 0) or p71.Sign * 10 ^ p71.Exp
    end
end
function v_u_16.abs(p73)
    -- upvalues: (copy) v_u_16, (copy) v_u_20
    local v74 = v_u_16.convert(p73)
    if v74.Sign == 0 then
        return v_u_20
    else
        return v_u_16.new(1, v74.Layer, v74.Exp)
    end
end
function v_u_16.maxAbs(p75, p76)
    -- upvalues: (copy) v_u_16
    local v77 = v_u_16.convert(p75)
    local v78 = v_u_16.convert(p76)
    if v_u_16.cmpAbs(v77, v78) < 0 then
        return v78
    else
        return v77
    end
end
function v_u_16.neg(p79)
    -- upvalues: (copy) v_u_16
    local v80 = v_u_16.convert(p79)
    return v_u_16.new(-v80.Sign, v80.Layer, v80.Exp)
end
function v_u_16.cmpAbs(p81, p82)
    local v83
    if p81.Exp > 0 then
        v83 = p81.Layer
    else
        v83 = -p81.Layer
    end
    local v84
    if p82.Exp > 0 then
        v84 = p82.Layer
    else
        v84 = -p82.Layer
    end
    return v84 < v83 and 1 or (v83 < v84 and -1 or (p81.Exp > p82.Exp and 1 or (p81.Exp < p82.Exp and -1 or 0)))
end
function v_u_16.cmp(p85, p86)
    -- upvalues: (copy) v_u_16
    return p85.Sign > p86.Sign and 1 or (p85.Sign < p86.Sign and -1 or p85.Sign * v_u_16.cmpAbs(p85, p86))
end
function v_u_16.le(p87, p88)
    -- upvalues: (copy) v_u_16
    local v89 = v_u_16.convert(p87)
    local v90 = v_u_16.convert(p88)
    return v_u_16.cmp(v89, v90) == -1
end
function v_u_16.me(p91, p92)
    -- upvalues: (copy) v_u_16
    local v93 = v_u_16.convert(p91)
    local v94 = v_u_16.convert(p92)
    return v_u_16.cmp(v93, v94) == 1
end
function v_u_16.eq(p95, p96)
    -- upvalues: (copy) v_u_16
    local v97 = v_u_16.convert(p95)
    local v98 = v_u_16.convert(p96)
    return v_u_16.cmp(v97, v98) == 0
end
function v_u_16.leeq(p99, p100)
    -- upvalues: (copy) v_u_16
    local v101 = v_u_16.convert(p99)
    local v102 = v_u_16.convert(p100)
    return v_u_16.cmp(v101, v102) ~= 1
end
function v_u_16.meeq(p103, p104)
    -- upvalues: (copy) v_u_16
    local v105 = v_u_16.convert(p103)
    local v106 = v_u_16.convert(p104)
    return v_u_16.cmp(v105, v106) ~= -1
end
function v_u_16.recip(p107)
    -- upvalues: (copy) v_u_16, (copy) v_u_22
    local v108 = v_u_16.convert(p107)
    if v108.Exp == 0 then
        return v_u_22
    elseif v108.Layer == 0 then
        return v_u_16.new(v108.Sign, 0, 1 / v108.Exp)
    else
        return v_u_16.new(v108.Sign, v108.Layer, -v108.Exp)
    end
end
function baseLog(p109, p110)
    -- upvalues: (copy) v_u_16, (copy) v_u_22
    local v111 = v_u_16.convert(p109)
    local v112 = v_u_16.convert(p110)
    if v111.Sign <= 0 or v112.Sign <= 0 then
        return v_u_22
    end
    if v_u_16.IsNaN(v112) or v_u_16.IsNaN(v111) then
        return v_u_22
    end
    if v111.Layer ~= 0 or v112.Layer ~= 0 then
        return v_u_16.div(v_u_16.log10(v111), v_u_16.log10(v112))
    end
    local v113 = v_u_16.new
    local v114 = v111.Sign
    local v115 = v111.Exp
    local v116 = math.log(v115)
    local v117 = v112.Exp
    return v113(v114, 0, v116 / math.log(v117))
end
function v_u_16.log(p118, p119)
    -- upvalues: (copy) v_u_16, (copy) v_u_22
    if p119 then
        return baseLog(p118, p119)
    end
    local v120 = v_u_16.convert(p118)
    if v120.Sign <= 0 then
        return v_u_22
    end
    if v120.Layer == 0 then
        local v121 = v_u_16.new
        local v122 = v120.Sign
        local v123 = v120.Exp
        return v121(v122, 0, (math.log10(v123)))
    end
    if v120.Layer == 1 then
        local v124 = v_u_16.new
        local v125 = v120.Exp
        local v126 = math.sign(v125)
        local v127 = v120.Exp
        return v124(v126, 0, math.abs(v127) * 2.302585092994046)
    end
    if v120.Layer == 2 then
        local v128 = v_u_16.new
        local v129 = v120.Exp
        local v130 = math.sign(v129)
        local v131 = v120.Exp
        return v128(v130, 1, math.abs(v131) + 0.36221568869946325)
    end
    local v132 = v_u_16.new
    local v133 = v120.Exp
    local v134 = math.sign(v133)
    local v135 = v120.Layer - 1
    local v136 = v120.Exp
    return v132(v134, v135, (math.abs(v136)))
end
function v_u_16.log10(p137)
    -- upvalues: (copy) v_u_16, (copy) v_u_22
    local v138 = v_u_16.convert(p137)
    if v138.Sign <= 0 then
        return v_u_22
    end
    if v138.Layer <= 0 then
        local v139 = v_u_16.new
        local v140 = v138.Sign
        local v141 = v138.Exp
        return v139(v140, 0, (math.log10(v141)))
    end
    local v142 = v_u_16.new
    local v143 = v138.Exp
    local v144 = math.sign(v143)
    local v145 = v138.Layer - 1
    local v146 = v138.Exp
    return v142(v144, v145, (math.abs(v146)))
end
function v_u_16.exp(p147)
    -- upvalues: (copy) v_u_16
    local v148 = v_u_16.convert(p147)
    if v148.Layer == 0 and v148.Exp <= 709.7 then
        local v149 = v_u_16.fromNumber
        local v150 = v148.Sign * v148.Exp
        return v149((math.exp(v150)))
    elseif v148.Layer == 0 then
        return v_u_16.new(1, 1, v148.Sign * 0.4342944819032518 * v148.Exp)
    elseif v148.Layer == 1 then
        return v_u_16.new(1, 2, v148.Sign * (-0.36221568869946325 + v148.Exp))
    else
        return v_u_16.new(1, v148.Layer + 1, v148.Sign * v148.Exp)
    end
end
function v_u_16.add(p151, p152)
    -- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_20
    local v153 = v_u_16.convert(p151)
    local v154 = v_u_16.convert(p152)
    if v_u_16.IsInf(v153) or v_u_16.IsInf(v154) then
        return v_u_23
    end
    if v_u_16.IsZero(v153) then
        return v154
    end
    if v_u_16.IsZero(v154) then
        return v153
    end
    if v153.Sign == -v154.Sign and (v153.Layer == v154.Layer and v153.Exp == v154.Exp) then
        return v_u_20
    end
    if v153.Layer >= 2 or v154.Layer >= 2 then
        return v_u_16.maxAbs(v153, v154)
    end
    if v_u_16.cmpAbs(v153, v154) > 0 then
        local v155 = v153
        v153 = v154
        v154 = v155
    end
    if v154.Layer == 0 and v153.Layer == 0 then
        return v_u_16.fromNumber(v154.Sign * v154.Exp + v153.Sign * v153.Exp)
    end
    local v156 = v154.Layer
    local v157 = v154.Exp
    local v158 = v156 * math.sign(v157)
    local v159 = v153.Layer
    local v160 = v153.Exp
    local v161 = v159 * math.sign(v160)
    if v158 - v161 >= 2 then
        return v154
    end
    if v158 == 0 and v161 == -1 then
        local v162 = v153.Exp
        local v163 = v154.Exp
        local v164 = v162 - math.log10(v163)
        if math.abs(v164) > 100 then
            return v154
        end
        local v165 = 10 ^ v154.Exp
        local v166 = v153.Exp
        local v167 = v165 - math.log10(v166)
        local v168 = v153.Sign + v154.Sign * v167
        local v169 = v_u_16.new
        local v170 = math.sign(v168)
        local v171 = v153.Exp
        local v172 = math.log10(v171)
        local v173 = math.abs(v168)
        return v169(v170, 1, v172 + math.log10(v173))
    end
    if v158 ~= 1 or v161 ~= 0 then
        local v174 = v154.Exp - v153.Exp
        if math.abs(v174) > 100 then
            return v154
        end
        local v175 = 10 ^ (v154.Exp - v153.Exp)
        local v176 = v153.Sign + v154.Sign * v175
        local v177 = v_u_16.new
        local v178 = math.sign(v176)
        local v179 = v153.Exp
        local v180 = math.abs(v176)
        return v177(v178, 1, v179 + math.log10(v180))
    end
    local v181 = v154.Exp
    local v182 = v153.Exp
    local v183 = v181 - math.log10(v182)
    if math.abs(v183) > 100 then
        return v154
    end
    local v184 = v154.Exp
    local v185 = v153.Exp
    local v186 = 10 ^ (v184 - math.log10(v185))
    local v187 = v153.Sign + v154.Sign * v186
    local v188 = v_u_16.new
    local v189 = math.sign(v187)
    local v190 = v153.Exp
    local v191 = math.log10(v190)
    local v192 = math.abs(v187)
    return v188(v189, 1, v191 + math.log10(v192))
end
function v_u_16.sub(p193, p194)
    -- upvalues: (copy) v_u_16
    local v195 = v_u_16.convert(p193)
    local v196 = v_u_16.convert(p194)
    return v_u_16.add(v195, v_u_16.neg(v196))
end
function v_u_16.toScientific(p197)
    -- upvalues: (copy) v_u_16
    if p197.Layer > 2 then
        return ""
    end
    if p197.Layer == 2 and p197.Exp > 308 then
        return "Inf"
    end
    if v_u_16.IsZero(p197) then
        return "0e0"
    end
    if p197.Layer ~= 0 then
        if p197.Layer ~= 1 then
            local v198 = 10 ^ p197.Exp
            return 10 ^ (v198 - math.floor(v198)) * p197.Sign .. "e" .. math.floor(v198)
        end
        local v199 = p197.Exp
        local v200 = p197.Exp
        local v201 = 10 ^ (v199 - math.floor(v200)) * p197.Sign
        local v202 = p197.Exp
        return v201 .. "e" .. math.floor(v202)
    end
    local v203 = p197.Exp
    local v204 = p197.Exp
    local v205 = math.log10(v204)
    local v206 = v203 / 10 ^ math.floor(v205) * p197.Sign
    local v207 = p197.Exp
    local v208 = math.log10(v207)
    return v206 .. "e" .. math.floor(v208)
end
function v_u_16.mul(p209, p210)
    -- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_20, (copy) v_u_22
    local v211 = v_u_16.convert(p209)
    local v212 = v_u_16.convert(p210)
    if v_u_16.IsInf(v211) or v_u_16.IsInf(v212) then
        return v_u_23
    end
    if v_u_16.IsZero(v211) or v_u_16.IsZero(v212) then
        return v_u_20
    end
    if v211.Layer == v212.Layer and v211.Exp == -v212.Exp then
        return v_u_16.new(v211.Sign * v212.Sign, 0, 1)
    end
    if v211.Layer > v212.Layer then
        local v213 = v211
        v211 = v212
        v212 = v213
    elseif v211.Layer == v212.Layer then
        local v214 = v211.Exp
        local v215 = math.abs(v214)
        local v216 = v212.Exp
        if math.abs(v216) < v215 then
            local v217 = v211
            v211 = v212
            v212 = v217
        end
    end
    if v212.Layer == 0 and v211.Layer == 0 then
        return v_u_16.fromNumber(v212.Sign * v211.Sign * v212.Exp * v211.Exp)
    end
    if v212.Layer >= 3 or v212.Layer - v211.Layer >= 2 then
        return v_u_16.new(v212.Sign * v211.Sign, v212.Layer, v212.Exp)
    end
    if v212.Layer == 1 and v211.Layer == 0 then
        local v218 = v_u_16.new
        local v219 = v212.Sign * v211.Sign
        local v220 = v212.Exp
        local v221 = v211.Exp
        return v218(v219, 1, v220 + math.log10(v221))
    end
    if v212.Layer == 1 and v211.Layer == 1 then
        return v_u_16.new(v212.Sign * v211.Sign, 1, v212.Exp + v211.Exp)
    end
    if (v212.Layer ~= 2 or v211.Layer ~= 1) and (v212.Layer ~= 2 or v211.Layer ~= 2) then
        return v_u_22
    end
    local v222 = v_u_16.new
    local v223 = v211.Exp
    local v224 = math.sign(v223)
    local v225 = v211.Layer - 1
    local v226 = v211.Exp
    local v227 = v222(v224, v225, (math.abs(v226)))
    local v228 = v_u_16.add
    local v229 = v_u_16.new
    local v230 = v212.Exp
    local v231 = math.sign(v230)
    local v232 = v212.Layer - 1
    local v233 = v212.Exp
    local v234 = v228(v229(v231, v232, (math.abs(v233))), v227)
    return v_u_16.new(v212.Sign * v211.Sign, v234.Layer + 1, v234.Sign * v234.Exp)
end
function v_u_16.div(p235, p236)
    -- upvalues: (copy) v_u_16
    local v237 = v_u_16.convert(p235)
    local v238 = v_u_16.convert(p236)
    return v_u_16.mul(v237, v_u_16.recip(v238))
end
function v_u_16.abslog10(p239)
    -- upvalues: (copy) v_u_16, (copy) v_u_22
    local v240 = v_u_16.convert(p239)
    if v_u_16.IsZero(v240) then
        return v_u_22
    end
    if v240.Layer <= 0 then
        local v241 = v_u_16.new
        local v242 = v240.Exp
        local v243 = math.abs(v242)
        return v241(1, 0, (math.log10(v243)))
    end
    local v244 = v_u_16.new
    local v245 = v240.Exp
    local v246 = math.sign(v245)
    local v247 = v240.Layer - 1
    local v248 = v240.Exp
    return v244(v246, v247, (math.abs(v248)))
end
function v_u_16.pow10(p249)
    -- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_21
    local v250 = v_u_16.convert(p249)
    if v_u_16.IsInf(v250) then
        return v_u_23
    else
        if v250.Layer == 0 then
            local v251 = 10 ^ (v250.Sign * v250.Exp)
            if v251 < (1 / 0) and math.abs(v251) > 0.1 then
                return v_u_16.new(1, 0, v251)
            end
            if v250.Sign == 0 then
                return v_u_21
            end
            local v252 = v_u_16.new
            local v253 = v250.Sign
            local v254 = v250.Layer + 1
            local v255 = v250.Exp
            v250 = v252(v253, v254, (math.log10(v255)))
        end
        if v250.Sign > 0 and v250.Exp > 0 then
            return v_u_16.new(v250.Sign, v250.Layer + 1, v250.Exp)
        elseif v250.Sign < 0 and v250.Exp > 0 then
            return v_u_16.new(-v250.Sign, v250.Layer + 1, -v250.Exp)
        else
            return v_u_21
        end
    end
end
function v_u_16.pow(p256, p257)
    -- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_21
    local v258 = v_u_16.convert(p256)
    local v259 = v_u_16.convert(p257)
    if v_u_16.IsZero(v258) then
        return v_u_20
    end
    if v258.Sign == 1 and (v258.Layer == 0 and v258.Exp == 1) then
        return v_u_21
    end
    if v_u_16.IsZero(v259) then
        return v_u_21
    end
    if v259.Sign == 1 and (v259.Layer == 0 and v259.Exp == 1) then
        return v258
    end
    local v260 = v_u_16.pow10(v_u_16.mul(v_u_16.abslog10(v258), v259))
    if v258.Sign == -1 and v_u_16.toNumber(v259) % 2 == 1 then
        return v_u_16.neg(v260)
    end
    if v258.Sign ~= -1 or v_u_16.toNumber(v259) >= 1e20 then
        return v260
    end
    local v261 = v_u_16.fromNumber
    local v262 = v_u_16.toNumber(v259) * 3.141592653589793
    local v263 = v261((math.cos(v262)))
    return v_u_16.mul(v260, v263)
end
local v_u_264 = { "k", "M", "B" }
local v_u_265 = {
    "",
    "U",
    "D",
    "T",
    "Qd",
    "Qn",
    "Sx",
    "Sp",
    "Oc",
    "No"
}
local v_u_266 = {
    "",
    "De",
    "Vt",
    "Tg",
    "qg",
    "Qg",
    "sg",
    "Sg",
    "Og",
    "Ng"
}
local v_u_267 = {
    "",
    "Ce",
    "Du",
    "Tr",
    "Qa",
    "Qi",
    "Se",
    "Si",
    "Ot",
    "Ni"
}
local v_u_268 = {
    "",
    "Mi",
    "Mc",
    "Na",
    "Pi",
    "Fm",
    "At",
    "Zp",
    "Yc",
    "Xo",
    "Ve",
    "Me",
    "Due",
    "Tre",
    "Te",
    "Pt",
    "He",
    "Hp",
    "Oct",
    "En",
    "Ic",
    "Mei",
    "Dui",
    "Tri",
    "Teti",
    "Pti",
    "Hei",
    "Hp",
    "Oci",
    "Eni",
    "Tra",
    "TeC",
    "MTc",
    "DTc",
    "TrTc",
    "TeTc",
    "PeTc",
    "HTc",
    "HpT",
    "OcT",
    "EnT",
    "TetC",
    "MTetc",
    "DTetc",
    "TrTetc",
    "TeTetc",
    "PeTetc",
    "HTetc",
    "HpTetc",
    "OcTetc",
    "EnTetc",
    "PcT",
    "MPcT",
    "DPcT",
    "TPCt",
    "TePCt",
    "PePCt",
    "HePCt",
    "HpPct",
    "OcPct",
    "EnPct",
    "HCt",
    "MHcT",
    "DHcT",
    "THCt",
    "TeHCt",
    "PeHCt",
    "HeHCt",
    "HpHct",
    "OcHct",
    "EnHct",
    "HpCt",
    "MHpcT",
    "DHpcT",
    "THpCt",
    "TeHpCt",
    "PeHpCt",
    "HeHpCt",
    "HpHpct",
    "OcHpct",
    "EnHpct",
    "OCt",
    "MOcT",
    "DOcT",
    "TOCt",
    "TeOCt",
    "PeOCt",
    "HeOCt",
    "HpOct",
    "OcOct",
    "EnOct",
    "Ent",
    "MEnT",
    "DEnT",
    "TEnt",
    "TeEnt",
    "PeEnt",
    "HeEnt",
    "HpEnt",
    "OcEnt",
    "EnEnt",
    "Hect",
    "MeHect"
}
function CutDigits(p269, p270)
    if p270 < 0 then
        return p269
    end
    local v271 = p269 * 10 ^ p270
    return math.floor(v271) / 10 ^ p270
end
function v_u_16.toSuffix(p272, p273)
    -- upvalues: (copy) v_u_16, (copy) v_u_264, (copy) v_u_265, (copy) v_u_266, (copy) v_u_267, (copy) v_u_268
    local v274 = p273 or 2
    local v275 = v_u_16.toScientific(p272):split("e")
    local v276 = v275[1]
    local v277 = v275[2]
    local v278 = math.fmod(v277, 3)
    local v279 = v277 / 3
    local v280 = math.floor(v279) - 1
    if v280 <= -1 then
        return CutDigits(v275[1] * 10 ^ v275[2], v274)
    end
    if v280 < 3 then
        return CutDigits(v276 * 10 ^ v278, v274) .. v_u_264[v280 + 1]
    end
    local v281 = ""
    if v280 >= 1000 then
        local v282 = math.log10(v280) / 3
        local v283 = v281
        for v284 = math.floor(v282), 0, -1 do
            if 10 ^ (v284 * 3) <= v280 then
                local v285 = v280 / 10 ^ (v284 * 3)
                local v286 = math.floor(v285) - 1
                if v286 > 0 then
                    v286 = v286 + 1
                end
                if v286 > 1000 then
                    v286 = math.fmod(v286, 1000)
                end
                local v287 = v286 / 100
                local v288 = math.floor(v287)
                local v289 = math.fmod(v286, 100)
                local v290 = v289 / 10
                local v291 = math.floor(v290)
                local v292 = math.fmod(v289, 10) / 1
                v281 = v283 .. v_u_265[math.floor(v292) + 1]
                v281 = v281 .. v_u_266[v291 + 1]
                v281 = v281 .. v_u_267[v288 + 1]
                v281 = v281 .. v_u_268[v284 + 1]
                local v293 = 10 ^ (v284 * 3)
                v280 = math.fmod(v280, v293)
                v283 = v281
            end
        end
        return CutDigits(v276 * 10 ^ v278, v274) .. v283
    end
    local v294 = v280 / 100
    local v295 = math.floor(v294)
    local v296 = math.fmod(v280, 100)
    local v297 = v296 / 10
    local v298 = math.floor(v297)
    local v299 = math.fmod(v296, 10) / 1
    v281 = v281 .. v_u_265[math.floor(v299) + 1]
    v281 = v281 .. v_u_266[v298 + 1]
    v281 = v281 .. v_u_267[v295 + 1]
    return CutDigits(v276 * 10 ^ v278, v274) .. v281
end
function v_u_16.between(p300, p301, p302)
    -- upvalues: (copy) v_u_16
    local v303 = v_u_16.convert(p300)
    local v304 = v_u_16.convert(p301)
    local v305 = v_u_16.convert(p302)
    local v306 = v_u_16.me(v303, v304)
    if v306 then
        v306 = v_u_16.le(v303, v305)
    end
    return v306
end
function v_u_16.toLayerNotation(p307, p308)
    -- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_21
    local v309 = v_u_16.convert(p307)
    local v310 = p308 or 2
    if v_u_16.between(v309, v_u_20, v_u_21) then
        return "1 / " .. v_u_16.short(v_u_16.div(v_u_21, v309))
    end
    if v309.Sign ~= 1 then
        return v309.Sign == 0 and "E(0)0" or v_u_16.toLayerNotation(v_u_16.abs(v309), v310)
    end
    if v309.Exp >= 0 then
        return "E(" .. v309.Layer .. ")" .. CutDigits(v309.Exp, v310)
    end
    local v311 = v309.Layer
    local v312 = CutDigits
    local v313 = v309.Exp
    return "E(" .. v311 .. "-" .. ")" .. v312(math.abs(v313), v310)
end
function v_u_16.short(p314, p315)
    -- upvalues: (copy) v_u_16
    local v316 = v_u_16.convert(p314)
    if v_u_16.le(v316, "9e1E14") then
        return v_u_16.toSuffix(v316, p315)
    else
        return v_u_16.toLayerNotation(v316, p315)
    end
end
function v_u_16.root(p317, p318)
    -- upvalues: (copy) v_u_16
    local v319 = v_u_16.convert(p317)
    local v320 = v_u_16.convert(p318)
    return v_u_16.pow(v319, v_u_16.recip(v320))
end
function v_u_16.sqrt(p321)
    -- upvalues: (copy) v_u_16
    local v322 = v_u_16.convert(p321)
    return v_u_16.root(v322, 2)
end
function v_u_16.gamma(p323)
    -- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_22
    local v324 = v_u_16.convert(p323)
    if v_u_16.leeq(v324, v_u_20) then
        return v_u_22
    elseif v324.Exp < 0 then
        return v_u_16.recip(v324)
    elseif v324.Layer == 0 then
        if v_u_16.le(v324, { 1, 0, 24 }) then
            return v_u_16.fromNumber(F_Gamma(v324.Sign * v324.Exp))
        end
        local v325 = v324.Exp - 1
        local v326 = 0.9189385332046727 + (v325 + 0.5) * math.log(v325) - v325
        local v327 = v325 * v325
        local v328 = v326 + 1 / (12 * v325)
        if v328 == v326 then
            return v_u_16.exp(v326)
        end
        local v329 = v325 * v327
        local v330 = v328 - 1 / (360 * v329)
        if v330 == v328 then
            return v_u_16.exp(v328)
        end
        local v331 = v329 * v327
        local v332 = v330 + 1 / (1260 * v331) - 1 / (1680 * (v331 * v327))
        return v_u_16.exp(v332)
    elseif v324.Layer == 1 then
        return v_u_16.exp(v_u_16.mul(v324, v_u_16.sub(v_u_16.log(v324), 1)))
    else
        return v_u_16.exp(v324)
    end
end
function v_u_16.fact(p333)
    -- upvalues: (copy) v_u_16
    local v334 = v_u_16.convert(p333)
    return v_u_16.gamma(v_u_16.add(v334, 1))
end
function v_u_16.rand(p335, p336)
    -- upvalues: (copy) v_u_16
    local v337 = math.random()
    local v338 = v_u_16.sub(p336, p335)
    local v339 = v_u_16.mul(v338, v337)
    return v_u_16.add(v339, p335)
end
function v_u_16.exporand(p340, p341)
    -- upvalues: (copy) v_u_16
    local v342 = v_u_16.convert(p340)
    local v343 = v_u_16.convert(p341)
    local v344 = v342.Sign
    local v345 = v343.Sign
    local v346 = v_u_16.mul(v_u_16.exp(v_u_16.abs(v342)), v344)
    local v347 = v_u_16.mul(v_u_16.exp(v_u_16.abs(v343)), v345)
    return v_u_16.exp(v_u_16.rand(v346, v347))
end
function v_u_16.lbencode(p348)
    -- upvalues: (copy) v_u_16
    local v349 = v_u_16.convert(p348)
    if v_u_16.eq(v349, 1) then
        return 1
    end
    local v350 = 0
    if v349.Sign == -1 and v349.Layer > 9999 then
        local v351 = v349.Exp
        if math.sign(v351) == 1 then
            v350 = 0
            ::l7::
            local v352 = v350 * 1e18
            if v350 == 8 then
                local v353 = v349.Layer
                local v354 = v349.Exp
                local v355 = v353 + math.log10(v354) / 10
                return v352 + math.log10(v355) * 3244067411720800
            end
            if v350 == 7 then
                local v356 = v352 + v349.Layer * 100000000000000
                local v357 = v349.Exp
                return v356 + math.log10(v357) * 10000000000000
            end
            if v350 == 6 then
                local v358 = v352 + 1e18
                local v359 = v349.Layer
                local v360 = v349.Exp
                local v361 = math.abs(v360)
                local v362 = v359 + math.log10(v361) / 10
                return v358 - math.log10(v362) * 3244067411720800
            end
            if v350 == 5 then
                local v363 = v352 + (v349.Layer * 100000000000000 + 100000000000000)
                local v364 = v349.Exp
                local v365 = math.abs(v364)
                return v363 - math.log10(v365) * 10000000000000
            end
            if v350 == 3 then
                local v366 = v352 + (v349.Layer * 100000000000000 + 100000000000000)
                local v367 = v349.Exp
                local v368 = math.abs(v367)
                return v366 - math.log10(v368) * 10000000000000 + (1e18 - 0)
            end
            if v350 ~= 2 then
                if v350 ~= 1 then
                    if v350 == 0 then
                        local v369 = v349.Layer
                        local v370 = v349.Exp
                        local v371 = v369 + math.log10(v370) / 10
                        v352 = v352 + (1e18 - math.log10(v371) * 3244067411720800)
                    end
                    return v352
                end
                local v372 = v352 + v349.Layer * 100000000000000
                local v373 = v349.Exp
                return v372 + math.log10(v373) * 10000000000000 + (1e18 - 0)
            end
            local v374 = v352 + 1e18
            local v375 = v349.Layer
            local v376 = v349.Exp
            local v377 = math.abs(v376)
            local v378 = v375 + math.log10(v377) / 10
            return v374 - math.log10(v378) * 3244067411720800 + (1e18 - 0)
        end
    end
    if v349.Sign ~= -1 or v349.Layer >= 9999 then
        ::l9::
        if v349.Sign ~= -1 or v349.Layer <= 9999 then
            ::l13::
            if v349.Sign ~= -1 or v349.Layer >= 9999 then
                ::l17::
                if v349.Sign == 0 then
                    return 4e18
                end
                if v349.Sign ~= 1 or v349.Layer >= 9999 then
                    ::l23::
                    if v349.Sign ~= 1 or v349.Layer <= 9999 then
                        ::l27::
                        if v349.Sign == 1 and v349.Layer < 9999 then
                            local v379 = v349.Exp
                            if math.sign(v379) ~= 1 then
                                goto l31
                            end
                            v350 = 7
                        else
                            ::l31::
                            if v349.Sign == 1 and v349.Layer > 9999 then
                                local v380 = v349.Exp
                                v350 = math.sign(v380) == 1 and 8 or v350
                            end
                        end
                        goto l7
                    end
                    local v381 = v349.Exp
                    if math.sign(v381) ~= -1 then
                        goto l27
                    end
                    v350 = 6
                    goto l7
                end
                local v382 = v349.Exp
                if math.sign(v382) ~= -1 then
                    goto l23
                end
                v350 = 5
                goto l7
            end
            local v383 = v349.Exp
            if math.sign(v383) ~= -1 then
                goto l17
            end
            v350 = 3
            goto l7
        end
        local v384 = v349.Exp
        if math.sign(v384) ~= -1 then
            goto l13
        end
        v350 = 2
        goto l7
    end
    local v385 = v349.Exp
    if math.sign(v385) ~= 1 then
        goto l9
    end
    v350 = 1
    goto l7
end
function v_u_16.lbdecode(p386)
    -- upvalues: (copy) v_u_16, (copy) v_u_21, (copy) v_u_20, (copy) v_u_22
    if p386 == 2e18 then
        return v_u_16.new(-1, 0, 1)
    end
    if p386 == 3e18 then
        return v_u_16.new(-1, 10000, -1)
    end
    if p386 == 1e18 then
        return v_u_16.new(-1, 0, -1)
    end
    if p386 == 6e18 then
        return v_u_21
    end
    if p386 == 7e18 then
        return v_u_16.new(1, 10000, 1)
    end
    if p386 == 5e18 then
        return v_u_16.new(1, 10000, -1)
    end
    if p386 == 1 then
        return v_u_21
    end
    local v387 = p386 / 1e18
    local v388 = math.floor(v387)
    if v388 == 4 then
        return v_u_20
    end
    if v388 == 0 then
        local v389 = 10 ^ ((1e18 - p386) / 3244067411720800)
        local v390 = math.floor(v389)
        local v391 = 10 ^ (math.fmod(v389, 1) * 10)
        return v_u_16.new(-1, v390, v391)
    end
    if v388 == 8 then
        local v392 = 10 ^ ((p386 - 8e18) / 3244067411720800)
        local v393 = math.floor(v392)
        local v394 = 10 ^ (math.fmod(v392, 1) * 10)
        return v_u_16.new(1, v393, v394)
    end
    if v388 == 1 then
        local v395 = 1e18 - (p386 - 1e18)
        local v396 = v395 / 100000000000000
        local v397 = math.floor(v396)
        local v398 = 10 ^ (math.fmod(v395, 100000000000000) / 10000000000000)
        return v_u_16.new(-1, v397, v398)
    end
    if v388 == 7 then
        local v399 = p386 - 7e18
        local v400 = v399 / 100000000000000
        local v401 = math.floor(v400)
        local v402 = 10 ^ (math.fmod(v399, 100000000000000) / 10000000000000)
        return v_u_16.new(1, v401, v402)
    end
    if v388 == 2 then
        local v403 = 10 ^ ((p386 - 2e18) / 3244067411720800)
        local v404 = math.floor(v403)
        local v405 = 10 ^ (math.fmod(v403, 1) * 10)
        return v_u_16.new(-1, v404, -v405)
    end
    if v388 == 6 then
        local v406 = 10 ^ ((1e18 - (p386 - 6e18)) / 3244067411720800)
        local v407 = math.floor(v406)
        local v408 = 10 ^ (math.fmod(v406, 1) * 10)
        return v_u_16.new(1, v407, -v408)
    end
    if v388 == 5 then
        local v409 = p386 - 5e18
        local v410 = v409 / 100000000000000
        local v411 = math.floor(v410)
        local v412 = 10 ^ ((100000000000000 - math.fmod(v409, 100000000000000)) / 10000000000000)
        return v_u_16.new(1, v411, -v412)
    end
    if v388 ~= 3 then
        return v_u_22
    end
    local v413 = 1e18 - (p386 - 3e18)
    local v414 = v413 / 100000000000000
    local v415 = math.floor(v414)
    local v416 = 10 ^ ((100000000000000 - math.fmod(v413, 100000000000000)) / 10000000000000)
    return v_u_16.new(-1, v415, -v416)
end
function v_u_16.shift(p417, p418)
    -- upvalues: (copy) v_u_16
    local v419 = v_u_16.convert(p417)
    if v419.Layer > 1 then
        return v419
    end
    if p418 > 20 then
        return v419
    end
    local v420 = v419.Exp
    local v421 = v419.Exp
    local _ = 10 ^ (v420 - math.floor(v421))
    local v422 = p418 * 10 ^ p418
    local v423 = math.floor(v422) / 10 ^ p418
    local v424 = v419.Exp
    v419.Exp = math.floor(v424) + math.log10(v423)
    return v419
end
return v_u_16