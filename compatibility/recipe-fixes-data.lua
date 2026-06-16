local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if (mods["wood-logistics"] and mods["aai-industry"]) then
	frep.replace_ingredient("electronic-circuit-wood", "wood", "lumber")	
end

if (mods["alloy-smelting"] and mods["bzcarbon"]) then
	frep.add_ingredient("electric-kiln", {type="item", name="crucible", amount = 1})	
end