-- Move the player around based on
-- various input methods. We convert
-- from radians to degrees for calculations
function movePlayer(dt)
	if hero.alive == true then
	-- Rotation code for turning right and left
	if love.keyboard.isDown("right") then
		hero.rot = math.deg(hero.rot)
		hero.rot = hero.rot + rotSpeed
		if hero.rot >= 360 then
			hero.rot = 0
		end
		hero.rot = math.rad(hero.rot)
	elseif love.keyboard.isDown("left") then
		hero.rot = math.deg(hero.rot)
		hero.rot = hero.rot - rotSpeed
		if hero.rot <= -1 then
			hero.rot = 359
		end
		hero.rot = math.rad(hero.rot)
	end
	
	if love.keyboard.isDown("backspace") and oneeightycooldown >= 30 then
		hero.rot = math.deg(hero.rot)
		hero.rot = hero.rot + 180
		if hero.rot >= 360 then
			hero.rot = hero.rot - 360
		end
		hero.rot = math.rad(hero.rot)
		oneeightycooldown = 0
	end
	
	if oneeightycooldown < 30 then
		oneeightycooldown = oneeightycooldown + 1
	end
	
	if love.keyboard.isDown("e") then
		if hero.weaponSelected == 1 and hero.hasWeapon[1] == true and firedpistol == false then
			firedpistol = true
			A_FirePlayerBullet(1)
		elseif hero.weaponSelected == 2 and hero.hasWeapon[2] == true and hero.hasAmmo[2] > 0 then
			if smacrefirecount == 0 then
				A_FirePlayerBullet(2)
				hero.hasAmmo[2] = hero.hasAmmo[2] - 1
			end
			smacrefirecount = smacrefirecount + 1
			if smacrefirecount >= 15 then
				smacrefirecount = 0
			end
			if hero.hasAmmo[2] <= 0 then
				hero.weaponSelected = 1
			end
		elseif hero.weaponSelected == 3 and hero.hasWeapon[3] == true and hero.hasAmmo[3] > 0 then
			if cgunrefirecount == 0 then
				A_FirePlayerBullet(2)
				hero.hasAmmo[3] = hero.hasAmmo[3] - 1
			end
			cgunrefirecount = cgunrefirecount + 1
			if cgunrefirecount >= 5 then
				cgunrefirecount = 0
			end
			if hero.hasAmmo[3] <= 0 then
				hero.weaponSelected = 1
			end
		end
	else
		if hero.weaponSelected == 1 and hero.hasWeapon[1] == true and
			firedpistol == true then
			firedpistol = false
		end
	end
	
	-- move forward
	if love.keyboard.isDown("w") then
		newX = hero.x + (curSpeed * math.cos(hero.rot))
		newY = hero.y + (curSpeed * math.sin(hero.rot))
		local pos = {}
		pos = checkCollision(hero.x, hero.y, newX, newY, 0.35)
		
		hero.x = pos.x
		hero.y = pos.y
		pos = {}
	end
	
	-- move backward
	if love.keyboard.isDown("s") then
		newX = hero.x - (curSpeed * math.cos(hero.rot))
		newY = hero.y - (curSpeed * math.sin(hero.rot))
		local pos = {}
		pos = checkCollision(hero.x, hero.y, newX, newY, 0.35)
		
		hero.x = pos.x
		hero.y = pos.y
		pos = {}
	end
	
	if love.keyboard.isDown("1") then
		hero.weaponSelected = 1
	elseif love.keyboard.isDown("2") and hero.hasAmmo[2] > 0 then
		hero.weaponSelected = 2
	elseif love.keyboard.isDown("3") and hero.hasAmmo[3] > 0 then
		hero.weaponSelected = 3
	end
	
	-- check for collision with exit object
	if collideWithExit(hero.x, hero.y) and hero.hp > 0 then
		-- if collision true,
		-- increment level up. This needs
		-- work as there is no intermission
		-- which I'd want something like that.
		currmapnum = currmapnum + 1
		currentmap = maps[currmapnum]
		currentobjmap = objmaps[currmapnum]
		playerSpawned = false	-- set this so the player can spawn again
		mapWidth = table.getn(currentmap[1])
		mapHeight = table.getn(currentmap)
		for i, v in ipairs(objects) do
			table.remove(objects, i)
		end
		for i, v in ipairs(objects) do
			table.remove(objects, i)
		end
		objectsSpawned = false
	end
	
	local collideObj = {}
	collideObj = collideWithItem(hero.x, hero.y)
	if collideObj ~= nil and collideObj.thingType == 11 then
		local pickupSuccess = false
		if hero.hasWeapon[2] == false then
			hero.hasWeapon[2] = true
			hero.weaponSelected = 2
			pickupSuccess = true
		end
		if hero.hasAmmo[2] < 200 then
			hero.hasAmmo[2] = hero.hasAmmo[2] + 25
			if hero.hasAmmo[2] > 200 then
				hero.hasAmmo[2] = 200
			end
			pickupSuccess = true
			pickupMsg = "You picked up a submachine gun!"
			pickupMsgTime = 0
		end
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 12 then
		local pickupSuccess = false
		if hero.hasAmmo[2] < 200 then
			hero.hasAmmo[2] = hero.hasAmmo[2] + 25
			if hero.hasAmmo[2] > 200 then
				hero.hasAmmo[2] = 200
			end
			pickupSuccess = true
			pickupMsg = "You picked up a bullet drum!"
			pickupMsgTime = 0
		end
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 13 then
		local pickupSuccess = false
		if hero.hasWeapon[3] == false then
			hero.hasWeapon[3] = true
			hero.weaponSelected = 3
			pickupSuccess = true
		end
		if hero.hasAmmo[3] < 250 then
			hero.hasAmmo[3] = hero.hasAmmo[3] + 25
			if hero.hasAmmo[3] > 250 then
				hero.hasAmmo[3] = 250
			end
			pickupSuccess = true
			pickupMsg = "You picked up a chaingun!"
			pickupMsgTime = 0
		end
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 14 then
		local pickupSuccess = false
		if hero.hasAmmo[3] < 250 then
			hero.hasAmmo[3] = hero.hasAmmo[3] + 25
			if hero.hasAmmo[3] > 250 then
				hero.hasAmmo[3] = 250
			end
			pickupSuccess = true
			pickupMsg = "You picked up a case of chaingun ammo!"
			pickupMsgTime = 0
		end
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 19 then
		local pickupSuccess = false
		if hero.hp < 100 then
			hero.hp = hero.hp + 15
			if hero.hp > 100 then
				hero.hp = 100
			end
			pickupSuccess = true
			pickupMsg = "You picked up a small health kit!"
			pickupMsgTime = 0
		end
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 21 then
		local pickupSuccess = false
		hero.hp = 100
		hero.lives = hero.lives + 1
		pickupSuccess = true
		pickupMsg = "You picked up a Canadian Orb! Full HP and Extra Morri!"
		pickupMsgTime = 0
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	if collideObj ~= nil and collideObj.thingType == 65 then
		local pickupSuccess = false
		score = score + 100
		pickupSuccess = true
		pickupMsg = "You picked up Freshslice Pizza! 100 points."
		pickupMsgTime = 0
		if pickupSuccess == true then
			for i, v in ipairs(objects) do
				if objects[i] == collideObj then
					objects[i].flagForRemoval = true
				end
			end
		end
	end
	
	if collideWithEnemyBullet(hero.x, hero.y) == true then
		hero.hp = hero.hp - math.random(2,10)
		if hero.hp <= 0 then
			hero.alive = false
		end
	end
	
	-- check speed modifier (shift keys)
	if love.keyboard.isDown("rshift") or love.keyboard.isDown("lshift") then
		curSpeed = shiftSpeed
		rotSpeed = rotShiftSpeed
	else
		curSpeed = regularSpeed
		rotSpeed = rotRegSpeed
	end
	end
end

-- Check for Start button
function checkForStartButton()
	if love.keyboard.isDown(" ") or love.keyboard.isDown("return") then
		inActualGame = true 
		initialize = true
	end
end

function checkPauseKey()
	if love.keyboard.isDown("p") and pauseCooldown >= 60 then
		if isPaused == false then
			isPaused = true
		else
			isPaused = false
		end
		pauseCooldown = 0
	end
	if pauseCooldown < 60 then
		pauseCooldown = pauseCooldown + 1
	end
end