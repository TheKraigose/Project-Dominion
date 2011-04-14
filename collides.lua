-- returns if the player is going to go either
-- out of bounds of the current level OR going
-- to collide with a solid object. (Needs to check
-- for more blocks once more tiles are made)
function isblocking(x, y)
	if y < 0 or y >= (mapHeight * tileSize) or x < 0 or x >= (mapWidth * tileSize) then
		return true
	end
	local blockreturn
	if currentmap[math.floor(y / tileSize)][math.floor(x / tileSize)] >= 1 and
		currentmap[math.floor(y / tileSize)][math.floor(x / tileSize)] <=  172 then
		blockreturn = true
	else
		blockreturn = false
	end
	return blockreturn
end

-- If the player collides with the exit tile, return
function collideWithExit(x, y)
	return currentobjmap[math.floor(y / tileSize)][math.floor(x / tileSize)] == 203
end

-- Collide with any pickups
function collideWithItem(x, y)
	for k, v in ipairs(objects) do
		local x1 = objects[k].x - 32
		local y1 = objects[k].y - 32
		local sizeX = x1 + tileSize
		local sizeY = y1 + tileSize
		
		if (x > (objects[k].x - 32) and x < (objects[k].x + 32)) and 
			(y > (objects[k].y - 32) and y < (objects[k].y + 32)) then
			return objects[k]
		end
	end
end

-- Enemy Collide with bullets
function collideWithPlayerBullet(ox, oy)
	for r, v in ipairs(objects) do
		if objects[r].isPlayerBullet == true then
			local x1 = math.floor(ox - 32)
			local y1 = math.floor(oy - 32)
			local sizeX = x1 + tileSize
			local sizeY = y1 + tileSize
			
			if (ox > (objects[r].x - 32) and ox < (objects[r].x + 32)) and 
				(oy > (objects[r].y - 32) and oy < (objects[r].y + 32)) then
				objects[r].flagForRemoval = true
				return true
			end
		end
	end
end

-- Player collide with enemy bullets
function collideWithEnemyBullet(ox, oy)
	for r, v in ipairs(objects) do
		if objects[r].isEnemyBullet == true then
			local x1 = math.floor(ox - 32)
			local y1 = math.floor(oy - 32)
			local sizeX = x1 + tileSize
			local sizeY = y1 + tileSize
			
			if (ox > (objects[r].x - 32) and ox < (objects[r].x + 32)) and 
				(oy > (objects[r].y - 32) and oy < (objects[r].y + 32)) then
				objects[r].flagForRemoval = true
				return true
			end
		end
	end
end