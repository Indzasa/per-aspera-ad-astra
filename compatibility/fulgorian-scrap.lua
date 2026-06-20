if not mods["scrap-industry"] then return end
if not settings.startup["scrap-industry-mech"].value then return end

local frep = require("__fdsl__.lib.recipe")

-- Scrap industry if with mechanical scrap - add it to fulgorian scrap instead of plates and gears instead of plates and gears

frep.remove_result("scrap-recycling", "iron-gear-wheel")
frep.remove_result("scrap-recycling", "iron-plate")
frep.add_result("scrap-recycling", {type="item", name="mech-scrap", amount = 1, probability = 0.1})
frep.add_result("scrap-recycling", {type="item", name="iron-plate", amount = 1, probability = 0.35})