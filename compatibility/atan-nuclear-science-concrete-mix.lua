if not (mods["atan-nuclear-science"] and mods["crushing-industry"]) then return end

-- make concrete in nuclear science's recipes be replaced with concrete barrels (which could spoil)
-- replace 10 concrete with 4 concrete mix barrels
-- add 4 more emply barrels as a result
local frep = require("__fdsl__.lib.recipe")
local function change_concrete_to_barrels(recipe_to_change)
	frep.replace_ingredient(recipe_to_change, "concrete", "concrete-mix-barrel")
	frep.modify_ingredient(recipe_to_change, "concrete-mix-barrel", {amount = 4})
	frep.modify_result(recipe_to_change, "barrel", {amount = 24, ignored_by_productivity = 24})	
end

change_concrete_to_barrels("nuclear-science-pack")

if mods["PlutoniumEnergy"] then
	if settings.startup["atan-science-from-plutonium"].value then
-- change this recipe also:
-- nuclear-science-pack-from-plutonium
	change_concrete_to_barrels("nuclear-science-pack-from-plutonium")
	end
end
