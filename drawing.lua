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
	love.graphics.printf("Press enter to start", 1024 / 2.5, 768 / 2, 256, "center")
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
				if ((xxx * tileSize) > scrollOffsetX - (tileSize * 2)) and ((xxx * tileSize) < scrollOffsetX + (currWinWidth) + (tileSize * 2)) and
					((yyy * tileSize) > scrollOffsetY - (tileSize * 2)) and ((yyy * tileSize) < scrollOffsetY + (currWinWidth) + (tileSize * 2)) then
					love.graphics.draw(tiles[116], (xxx * tileSize) - scrollOffsetX, (yyy * tileSize) - scrollOffsetY, 0, sprScale, sprScale, 0, 0)
				end
			end
		end
	end
	for y=1, mapHeight, 1 do
		for x=1, mapWidth, 1 do
			wall = currentmap[y][x]
			if wall >= 1 and wall <= 172 then
				-- love.graphics.setColor(200,200,200)
				if ((x * tileSize) > scrollOffsetX - (tileSize * 2)) and ((x * tileSize) < scrollOffsetX + (currWinWidth) + (tileSize * 2)) and
					((y * tileSize) > scrollOffsetY - (tileSize * 2)) and ((y * tileSize) < scrollOffsetY + (currWinWidth) + (tileSize * 2)) then
						love.graphics.draw(tiles[wall], (x * tileSize) - scrollOffsetX, (y * tileSize) - scrollOffsetY, 0, sprScale, sprScale, 0, 0)
				end
			end
		end
	end
end

-- Draw the objects code
function drawObjs()
	local currWinWidth = love.graphics.getWidth()
	local currWinHeight = love.graphics.getHeight()
	for i,v in ipairs(objects) do
		if ((objects[i].x) > scrollOffsetX - (tileSize * 2)) and ((objects[i].x) < scrollOffsetX + (currWinWidth) + (tileSize * 2)) and
			((objects[i].y) > scrollOffsetY - (tileSize * 2)) and ((objects[i].y) < scrollOffsetY + (currWinWidth) + (tileSize * 2)) then
			if objects[i].doorClosed == true or objects[i].doorClosed == nil then
				love.graphics.draw(objects[i].spr, (objects[i].x) - scrollOffsetX, (objects[i].y) - scrollOffsetY, objects[i].rot, sprScale, sprScale, 32, 32)
			end
		end
	end
	love.graphics.rectangle("line", (exitobj.x) - scrollOffsetX, (exitobj.y) - scrollOffsetY, tileSize, tileSize)
end

function spawnObjects()
	for yy=1, mapHeight, 1 do
		for xx=1, mapWidth, 1 do	
			obj = currentobjmap[yy][xx]
			if obj == 26 and playerSpawned == false then
				hero.x = xx * tileSize + (tileSize / 2)
				hero.y = yy * tileSize + (tileSize / 2)
				hero.rot = math.rad(0)
				playerSpawned = true	-- so if there's a duplicate spawn
										-- we only spawn at the first one found
				plyrPosX = xx	-- remember the player's spawn point in case of death
				plyrPosY = yy
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				pRespawnPoint = objecttemp
				objecttemp = {}
				currentobjmap[yy][xx] = 0  -- clear the player spawn spot
			end
			-- if a basic grunt?
			if obj == 1 then
				math.randomseed(os.time())
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
			if obj == 20 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 20		-- Small Health Kit
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["bighealth"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 21 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
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
			if obj == 23 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 23		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["scoreb"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 24 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 24		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["scorec"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 25 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 25		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["scored"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 32 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 32		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doornhz"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 33 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 33		-- Make it a score item (Coffee)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doornvt"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 34 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 34		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doorbhz"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 35 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 35		-- Make it a score item (Coffee)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doorbvt"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 36 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 36		-- Make it a score item (Freshslice)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doorrhz"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 37 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 37		-- Make it a score item (Coffee)
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["doorrvt"]["norm"]
				objecttemp.doorClosed = true
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 38 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 38		-- Small Health Kit
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["blukey"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 39 then
				objecttemp.x = xx * tileSize + (tileSize / 2)
				objecttemp.y = yy * tileSize + (tileSize / 2)
				objecttemp.hp = 0
				objecttemp.rot = 0
				objecttemp.thingType = 39		-- Small Health Kit
				objecttemp.sprIndex = 1
				objecttemp.isenemy = false
				objecttemp.isboss = false
				objecttemp.ismoving = false
				objecttemp.spr = sprTable["redkey"]["norm"]
				table.insert(objects, objecttemp)
				objecttemp = {}
			end
			if obj == 30 then
				exitobj.x = xx * tileSize
				exitobj.y = yy * tileSize
			end
		end
	end
	objectsSpawned = true
end