if not mods["scrap-industry"] then return end

local frep = require("__fdsl__.lib.recipe")

-- change engine to motor if AAI	(cos engine-unit needs steel)
if mods["aai-industry"] then
	if settings.startup["scrap-industry-mech"].value then
		frep.replace_result("engine-from-scrap", "engine-unit", "motor")
	end
end

-- change wood to lumber if rail recipe
if mods["Age-of-Production"] and mods["wood-logistics"] then
	if settings.startup["wood-logistics-lumber-mill"].value then
		frep.replace_ingredient("aop-wooden-rails", "wood", "lumber")
	end
end
