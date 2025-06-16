if not mods["Moshine-assets"] then return end

-- is there a need for new ores?
local mods_with_new_ores = {"bzlead", "bztin", "bztitanium", "bzcarbon"}
local new_ores_needed = false

for _, mod_name in pairs(mods_with_new_ores) do
	if mods[mod_name] then
		new_ores_needed = true
		break
	end
end

if new_ores_needed then
	function add_ore_to_mix(new_ore, new_amount, new_probability)
		local multi_ore = data.raw.resource["multi-ore"]
		local already_has = false
		for index,result in pairs(multi_ore.minable.results) do
			if result.name == new_ore then
				already_has = true
			end
			break
		end
		if already_has == false then
			local new_result = {
				type = "item",
				name = new_ore,
				amount = new_amount,
				probability = new_probability,
			}
			table.insert(multi_ore.minable.results, new_result)
		end		
	end
end


if mods["bzlead"] then
	add_ore_to_mix("lead-ore", 1, 2 /100)
	
	-- reduce copper ore output (because it is also a byproduct from lead and for overal balance)
	local multi_ore = data.raw.resource["multi-ore"]
	for index,result in pairs(multi_ore.minable.results) do
		if result.name == "copper-ore" then
			result.probability = result.probability / 4		
			break
		end
	end	
end

if mods["bztin"] then
	add_ore_to_mix("tin-ore", 1, 3 /100)	
end

if mods["bztitanium"] then
	-- add stone because titanium can be obtained from it
	add_ore_to_mix("stone", 1, 17 /100)
end

if mods["bzcarbon"] then
	add_ore_to_mix("rough-diamond", 1, 8 /1000)
end