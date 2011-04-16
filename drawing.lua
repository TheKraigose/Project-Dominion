function drawPauseMsg()
	love.graphics.printf("Paused. Press P to resume.", 1024 / 2.5, 768 / 2, 256, "center")
	-- draw text at the middle of the screen																							-- to tell player how to start game.
end

-- Draw a message in the upper left corner (a la DOOM)
function drawMessage()
	if (pickupMsg ~= "") then
		love.graphics.printf(pickupMsg, 0, 0, 512, "left")
		pickupMsgTime = pickupMsgTime + 1
		if (pickupMsgTime > pickupMsgMaxTime) then
			pickupMsgTime = 0
			pickupMsg = ""
		end
	end
end

-- Draw the HUD (very rudimentary)
function drawHud()
	local weaponType = ""
	if (hero.weaponSelected == 1) then
		weaponType = "Pistol"
	elseif (hero.weaponSelected == 2) then
		weaponType = "Submachine Gun"
	elseif (hero.weaponSelected == 3) then
		weaponType = "Chaingun"
	end
	love.graphics.printf("HP: "..hero.hp, 800, 100, 200, "right")
	love.graphics.printf("Score: "..score, 800, 120, 200, "right")
	love.graphics.printf(weaponType, 800, 140, 200, "right")
	if hero.weaponSelected > 1 then
		love.graphics.printf("Current: "..hero.hasAmmo[hero.weaponSelected], 800, 160, 200, "right")
	end
	love.graphics.printf("Submac: "..hero.hasAmmo[2], 800, 180, 200, "right")
	love.graphics.printf("Chaingun: "..hero.hasAmmo[3], 800, 200, 200, "right")
	love.graphics.printf("MORRI x "..hero.lives, 800, 80, 200, "right")
end

-- draw the title screen and message
function drawTitleScreen()
	love.graphics.draw(titlePics[0], 0, 0, 0, 1, 1, 0, 0)
	love.graphics.printf("Press space or enter to start", 1024 / 2.5, 768 / 2, 256, "center")
	-- draw text at the middle of the screen																							-- to tell player how to start game.
end

-- draw the map code.
function drawMiniMap()
	local currWinWidth = love.graphics.getWidth()
	local currWinHeight = love.graphics.getHeight()
	scrollOffsetX = hero.x - (currWinWidth / 2)
	scrollOffsetY = hero.y - (currWinHeight / 2)
	for yyy=1, mapHeight, 1 do
		for xxx=1, mapWidth, 1 do
			if currmapnum <= 5 then
				love.graphics.draw(tiles[116], (xxx * tileSize) - scrollOffsetX, (yyy * tileSize) - scrollOffsetY, 0, sprScale, sprScale, 0, 0)
			end
		end
	end
	for y=1, mapHeight, 1 do
		for x=1, mapWidth, 1 do
			wall = currentmap[y][x]
			if wall >= 1 and wall <= 172 then
				-- love.graphics.setColor(200,200,200)
				love.graphics.draw(tiles[wall], (x * tileSize) - scrollOffsetX, (y * tileSize) - scrollOffsetY, 0, sprScale, sprScale, 0, 0)
			end
		end
	end
end

-- Draw the objects code
function drawObjs()
	for i,v in ipairs(objects) do
		love.graphics.draw(objects[i].spr, (objects[i].x) - scrollOffsetX, (objects[i].y) - scrollOffsetY, objects[i].rot, sprScale, sprScale, 32, 32)
	end
	love.graphics.rectangle("line", (exitobj.x) - scrollOffsetX, (exitobj.y) - scrollOffsetY, tileSize, tileSize)
end

function spawnObjects()
	for yy=1, mapHeight, 1 do
		for xx=1, mapWidth, 1 do	
			obj = currentobjmap[yy][xx]
			if obj == 26 and playerSpawned == false then
				hero.x = xx * tileSize
				hero.y = yy * tileSize
				hero.rot = math.rad(0)
				playerSpawned = true	-- so if there's a duplicate spawn
										-- we only spawn at the first one found
				plyrPosX = xx	-- remember the player's spawn point in case of death
				plyrPosY = yy
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				pRespawnPoint = objecttemp
				objecttemp = {}
				currentobjmap[yy][xx] = 0  -- clear the player spawn spot
			end
			if obj == 27 and playerSpawned == false then
				hero.x = xx * tileSize
				hero.y = yy * tileSize
				hero.rot = math.rad(90)
				playerSpawned = true	-- so if there's a duplicate spawn
										-- we only spawn at the first one found
				plyrPosX = xx	-- remember the player's spawn point in case of death
				plyrPosY = yy
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				pRespawnPoint = objecttemp
				objecttemp = {}
				currentobjmap[yy][xx] = 0  -- clear the player spawn spot
			end
			if obj == 28 and playerSpawned == false then
				hero.x = xx * tileSize
				hero.y = yy * tileSize
				hero.rot = math.rad(180)
				playerSpawned = true	-- so if there's a duplicate spawn
										-- we only spawn at the first one found
				plyrPosX = xx	-- remember the player's spawn point in case of death
				plyrPosY = yy
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				pRespawnPoint = objecttemp
				objecttemp = {}
				currentobjmap[yy][xx] = 0  -- clear the player spawn spot
			end
			if obj == 29 and playerSpawned == false then
				hero.x = xx * tileSize
				hero.y = yy * tileSize
				hero.rot = math.rad(270)
				playerSpawned = true	-- so if there's a duplicate spawn
										-- we only spawn at the first one found
				plyrPosX = xx	-- remember the player's spawn point in case of death
				plyrPosY = yy
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				pRespawnPoint = objecttemp
				objecttemp = {}
				currentobjmap[yy][xx] = 0  -- clear the player spawn spot
			end
			-- if a basic grunt?
			if obj == 1 then
				math.randomseed(os.time())
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 10
				objecttemp.rot = math.random(1.0, 3.0)
				objecttemp.thingType = 1			-- make it a guard
				objecttemp.sprIndex = 1
				objecttemp.isenemy = true
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["grunt"]["norm"]
				objecttemp.cooldown = 35
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 2 then
				math.randomseed(os.time())
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 20
				objecttemp.rot = math.random(1.0, 3.0)
				objecttemp.thingType = 2			-- make it a bird soldier
				objecttemp.sprIndex = 1
				objecttemp.isenemy = true
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["bird"]["norm"]
				objecttemp.cooldown = 25
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 11 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 11		-- submachine gun
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["gun1"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 12 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 12		-- submachine ammo
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["ammo1"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
				if obj == 13 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 13		-- Chaingun
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["gun2"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 14 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 14		-- Chaingun Ammo
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["ammo2"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 19 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 19		-- Small Health Kit
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["health"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 21 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 21		-- Make it a 1up
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["oneup"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 22 then
				objecttemp.x = xx * tileSize
				objecttemp.y = yy * tileSize
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 22		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["scorea"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 210 then
				exitobj.x = xx * tileSize
				exitobj.y = yy * tileSize
			end
		end
	end
	objectsSpawned = true
end