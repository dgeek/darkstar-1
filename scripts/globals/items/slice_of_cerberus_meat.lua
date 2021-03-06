-----------------------------------------
-- ID: 5565
-- Item: slice_of_cerberus_meat
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 10
-- Magic -10
-- Strength 6
-- Intelligence -6
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:getRace() ~= dsp.race.GALKA) then
        result = dsp.msg.basic.CANNOT_EAT
    end
    if (target:getMod(dsp.mod.EAT_RAW_MEAT) == 1) then
        result = 0
    end
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5565)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.MP, -10)
    target:addMod(dsp.mod.STR, 6)
    target:addMod(dsp.mod.INT, -6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.MP, -10)
    target:delMod(dsp.mod.STR, 6)
    target:delMod(dsp.mod.INT, -6)
end
