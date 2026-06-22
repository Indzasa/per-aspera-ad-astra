-- Compatibility: recipe removals and disabling for final fixes stage
-- Configure `conditional_rules` to match mod combinations and recipes

local function remove_recipe_and_unlocks(recipe_name)
	if not recipe_name then return end
	if data.raw.recipe[recipe_name] then
		data.raw.recipe[recipe_name] = nil
	end
	for _, tech in pairs(data.raw.technology) do
		if tech.effects then
			for i = #tech.effects, 1, -1 do
				local eff = tech.effects[i]
				if eff.type == "unlock-recipe" and eff.recipe == recipe_name then
					table.remove(tech.effects, i)
				end
			end
		end
	end
end

local function mods_present(required)
	if not required or next(required) == nil then return true end
	if not mods then return false end
	for _, m in ipairs(required) do
		if not mods[m] then return false end
	end
	return true
end

-- Configure rules here
local conditional_rules = {
	-- AAI industry adds recipe with wood, which is not needed if lignumis is present, so remove it
    { mods = {"aai-industry", "lignumis"}, recipes = {"electronic-circuit-wood"} },
	-- AAI industry adds recipe for oil processing that is not modified by scrappy chemistry, and is redundant
	{ mods = {"aai-industry", "scrap-chemistry"}, recipes = {"oil-processing-heavy"} },
	-- Add other rules below as needed
}

for _, rule in ipairs(conditional_rules) do
	if mods_present(rule.mods) then
		for _, rname in ipairs(rule.recipes) do
			remove_recipe_and_unlocks(rname)
		end
	end
end