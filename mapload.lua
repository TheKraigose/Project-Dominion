-- load the map##.lua files from data/maps/*
function loadMapsFromFiles()
	for i = 0, totalNumOfMaps do
		if i == 0 then
			require("data/maps/map01.lua")	-- pull in map01
		elseif i == 1 then
			require("data/maps/map02.lua")	-- pull in map02
		end
		table.insert(maps, map)
		table.insert(objmaps, objmap)
		map = {}	-- we have to clear the map/objmap or else it'll insert itself
					-- again and again. We obviously do not want that
		objmap = {}
	end	
end