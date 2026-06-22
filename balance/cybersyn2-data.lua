if not mods["cybersyn2"] then return end

local f_recipe = require("__fdsl__.lib.recipe")
local f_tech = require("__fdsl__.lib.technology")

local recipe = data.raw.recipe["cybersyn2-combinator"]
if not recipe then return end

--recipe.enabled = false
recipe.ingredients = {
  { type = "item", name = "arithmetic-combinator", amount = 1 },
  { type = "item", name = "constant-combinator", amount = 1 },
  { type = "item", name = "decider-combinator", amount = 1 },
  { type = "item", name = "display-panel", amount = 1 },
}

f_tech.add_unlock("circuit-network", "cybersyn2-combinator")

if not mods["scrap-industry"] then return end

local ScrapIndustry = rawget(_G, "ScrapIndustry")
if not ScrapIndustry then return end

ScrapIndustry.items["cybersyn2-combinator"] = {
  scrap = "circuit-scrap",
  scale = ScrapIndustry.RARE,
  failrate = 0.01,
}
ScrapIndustry.recipes["cybersyn2-combinator"] = {
  self_scrap = true,
  failrate = 0.01,
}