if not mods["bzsilicon"] then return end

local function contains(haystack, needle) -- maybe use a lib for that?
	for _, value in pairs(haystack or {}) do
		if value == needle then
			return true
		end
	end
	return false
end

-- add slot for every entity that can burn chemical fuel so it can output ash from razorgrass
for prototype_type, prototypes in pairs(data.raw) do
  if prototype_type == "inserter" then
  -- do nothing with inserters
  else
    for name, entity in pairs(prototypes) do
      if entity.energy_source and contains(entity.energy_source.fuel_categories, "chemical") then
        if entity.energy_source.burnt_inventory_size == 0 or entity.energy_source.burnt_inventory_size == nil then
		  entity.energy_source.burnt_inventory_size = 1
		end
	  end
    end
  end
end



