if not mods["bztin"] then return end

if mods["aai-industry"] and mods["crushing-industry"] and mods["alloy-smelting"] then
	if not settings.startup["alloy-smelting-tin-glass"].value then return end
	-- Touch automatic glass recycling recipe so it dissapears (not sure why)
	data.raw.recipe["glass-recycling"].ingredients = {}
		
	-- Create new recipe for glass recycling
	
	-- define what type of tin we get
	local tin_result = {}
	if settings.startup["crushing-industry-ore"].value then
		tin_result = {type = "item", name = "crushed-tin-ore", amount = 1, probability = 0.03125}
	else
		tin_result = {type = "item", name = "tin-plate", amount = 1, probability = 0.03125}
	end
	
	data:extend({
	  {
		type = "recipe",
		name = "paad-glass-recycling",
		category = "recycling",
		enabled = true,
		energy_required = 1.25,
		ingredients = {
		  {type = "item", name = "glass", amount = 1}
		},
		results = {
			{type = "item", name = "sand", amount = 1, probability = 0.625},
			tin_result
		},
		main_product = "sand",
		icons = {
			  {
				icon = "__aai-industry__/graphics/icons/glass.png",
				icon_size = 64,
			  },
			  {
				icon = "__quality__/graphics/icons/recycling.png",
				icon_size = 64,
				--scale = 0.5,
				--shift = {8, 8}
			  }
		},
		subgroup = "intermediate-product",
		order = "z[paad-glass-recycling]"
	  }
	})
end

