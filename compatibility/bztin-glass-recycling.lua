if not mods["bztin"] then return end

if mods["aai-industry"] and mods["alloy-smelting"] then
	if not settings.startup["alloy-smelting-tin-glass"].value then return end
	
	local glass_recycling = table.deepcopy(data.raw["recipe"]["glass-recycling"])
		
	-- define what type of tin we get
	local tin_result = {}
	if settings.startup["crushing-industry-ore"].value then
		tin_result = {type = "item", name = "crushed-tin-ore", amount = 1, probability = 0.03125}
	else
		tin_result = {type = "item", name = "tin-plate", amount = 1, probability = 0.03125}
	end
	
	glass_recycling.results = {
			{type = "item", name = "sand", amount = 1, probability = 0.625},
			tin_result
		}
	data:extend{glass_recycling}	
end

