if not (mods["wood-logistics"] and mods["Age-of-Production"] and mods["aai-industry"]) then
	if settings.startup["wood-logistics-lumber-mill"].value == false then return end
end

local f_recipe = require("__fdsl__.lib.recipe")

f_recipe.replace_ingredient("aop-lumber-mill", "wood", "lumber")
f_recipe.add_ingredient("aop-lumber-mill", {type="item", name="electric-motor", amount = 10})

data.raw["assembling-machine"]["aop-lumber-mill"].module_slots = 3

