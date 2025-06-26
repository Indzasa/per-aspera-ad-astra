if not mods["Age-of-Production"] then return end

-- make quantum assembler only be able to make space science if maraxsis is installed
if mods["maraxsis"] then
  -- change science packs to their original crafting category
  -- it also prevents atomic forge with +50% productivity to craft them
  -- this wasn't originaly intended but is good for balance imho
  data.raw.recipe["automation-science-pack"].category = "crafting"
  data.raw.recipe["logistic-science-pack"].category = "crafting"
  data.raw.recipe["chemical-science-pack"].category = "crafting"
  data.raw.recipe["military-science-pack"].category = "crafting"
  data.raw.recipe["production-science-pack"].category = "crafting"
  data.raw.recipe["utility-science-pack"].category = "crafting"
end

-- add Muluna's interstellar science to quantum assembler if Muluna is installed
-- looks like quantum assembler just cant make this recipe, so nothing right now maybe later
--[[
if mods["planet-muluna"] then

data.raw["recipe"]["interstellar-science-pack"].category = "paaa-muluna-science"

table.insert(data.raw["assembling-machine"]["aop-quantum-assembler"].crafting_categories, "paaa-muluna-science")
table.insert(data.raw["boiler"]["space-boiler"].crafting_categories, "paaa-muluna-science")

data:extend(
{
  {
    type = "recipe-category",
    name = "paaa-muluna-science"
  }
}
)

end]]
