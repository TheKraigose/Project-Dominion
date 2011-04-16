function checkCollision(fromX, fromY, toX, toY, radius)
	local posObj = {}
	posObj.x = fromX
	posObj.y = fromY
	
	if ((toY < 0) or (toY >= mapHeight * tileSize) or
		(toX < 0) or (toX >= mapWidth * tileSize)) then
		return posObj
	end
	
	local blockX = math.floor(toX)
	local blockY = math.floor(toY)
	
	if (isblocking(blockX, blockY)) then
		return posObj
	end
	
	posObj.x = toX
	posObj.y = toY
	
	local blockTop = isblocking(blockX, blockY-1)
	local blockBottom = isblocking(blockX, blockY+1)
	local blockLeft = isblocking(blockX-1, blockY)
	local blockRight = isblocking(blockX+1, blockY)
	
	if (blockTop == false) and ((toY - blockY) < radius) then
		posObj.y = blockY + radius
		toY = posObj.y
	end
	
	if (blockLeft == false) and ((toX - blockX) < radius) then
		posObj.x = blockX + radius
		toX = posObj.x
	end
	
	if ((blockRight == false) and (((blockX + 1) - toX) < radius)) then
		posObj.x = (blockX + 1) - radius
		toX = posObj.x
	end
	
	if ((blockBottom == false) and (((blockY + 1) - toY) < radius)) then
		posObj.y = (blockY + 1) - radius
		toY = posObj.y
	end
	
	if ((isblocking(blockX-1, blockY-1) == false) and
		(blockTop == true and blockLeft == true)) then
		local dx = toX - blockX
		local dy = toY - blockY
		if (dx*dx+dy*dy < radius*radius) then
			if (dx*dx > dy*dy) then
				posObj.x = blockX + radius
				toX = posObj.x
			else
				posObj.y = blockY + radius
				toY = posObj.y
			end
		end
	end

	if ((isblocking(blockX+1, blockY-1) == false) and
		(blockTop == true and blockRight == true)) then
		local dx = toX - (blockX+1)
		local dy = toY - blockY
		if (dx*dx+dy*dy < radius*radius) then
			if (dx*dx > dy*dy) then
				posObj.x = blockX + 1 - radius
				toX = posObj.x
			else
				posObj.y = blockY + radius
				toY = posObj.y
			end
		end
	end
	
	if ((isblocking(blockX-1, blockY+1) == false) and
		(blockBottom == true and blockLeft == true)) then
		local dx = toX - blockX
		local dy = toY - (blockY + 1)
		if (dx*dx+dy*dy < radius*radius) then
			if (dx*dx > dy*dy) then
				posObj.x = blockX + radius
				toX = posObj.x
			else
				posObj.y = blockY + 1 - radius
				toY = posObj.y
			end
		end
	end
	
	if ((isblocking(blockX+1, blockY+1) == false) and
		(blockBottom == true and blockRight == true)) then
		local dx = toX - (blockX+1)
		local dy = toY - (blockY+1)
		if (dx*dx+dy*dy < radius*radius) then
			if (dx*dx > dy*dy) then
				posObj.x = blockX + 1 - radius
				toX = posObj.x
			else
				posObj.y = blockY + 1 - radius
				toY = posObj.y
			end
		end
	end
	
	return posObj
end

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
	return currentobjmap[math.floor(y / tileSize)][math.floor(x / tileSize)] == 30
end

-- Collide with any pickups
function collideWithItem(x, y)
	for k, v in ipairs(objects) do
		local x1 = objects[k].x + 16
		local y1 = objects[k].y + 16
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