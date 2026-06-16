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

  -- TBD hydraulistic specialised science pack doesnt need cooling (with challenging pack logistic it does)
end

local f_tech = require("__fdsl__.lib.technology")
local f_recipe = require("__fdsl__.lib.recipe")

local function change_recipe_category(recipe_name, category_to_be)
  local recipe = data.raw.recipe[recipe_name]
  recipe.category = category_to_be
  if recipe.additional_categories then recipe.additional_categories = nil end
end

local function remove_category(from_entity, category_to_remove)
  local assembler = data.raw["assembling-machine"][from_entity]
  for i, category in ipairs(assembler.crafting_categories) do
    if category == category_to_remove then
      table.remove(assembler.crafting_categories, i)
      break
    end  
  end
end
  
if mods["wood-logistics"] then
  
  
  if settings.startup["wood-logistics-lumber-mill"].value then
    if mods["early-agriculture"] then
      -- move Lumbermill closer (it is too far)
      f_tech.add_unlock("landfill", "aop-lumber-mill")
      f_tech.add_unlock("landfill", "aop-wooden-rails")
      -- move wooden rails closer, they can be much more early
      f_tech.remove_unlock("aop-woodworking", "aop-lumber-mill")
      f_tech.remove_unlock("aop-woodworking", "aop-wooden-rails")
    end
	
	remove_category("aop-lumber-mill", "organic-or-kiln-smelting")
	
	change_recipe_category("rail", "crafting")
	change_recipe_category("nutrients-from-spoilage", "organic-or-assembling")	
	change_recipe_category("wood-processing", "crafting-or-carpentry")
	change_recipe_category("agricultural-camp", "crafting-or-carpentry")
	change_recipe_category("agricultural-tower", "crafting")
	change_recipe_category("aop-greenhouse", "crafting")
	
	f_recipe.add_category("woodchips", "woodworking")
	f_recipe.add_category("burner-assembling-machine", "woodworking")
	f_recipe.add_category("burner-inserter", "woodworking")
	f_recipe.add_category("repair-pack", "woodworking")
	f_recipe.add_category("recycler", "woodworking")
	f_recipe.add_category("agricultural-camp", "woodworking")
	
	if mods["Mini-Trains-Lead-the-Way"] then
	  if settings.startup["mtlw-replace-some-steel-with-lumber"].value then
	    f_recipe.add_category("mini-locomotive", "woodworking")
	    f_recipe.add_category("mini-cargo-wagon", "woodworking")
	  end
	end	
  end
end



-- TBD Move atomic forge further (it is too soon) (nuclear science)
-- TBD seeded holmium scrap & homium recrystalisation (dont need both) (fulgore extended?)