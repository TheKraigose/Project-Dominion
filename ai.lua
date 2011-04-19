-- update the objects
function updateObjs()
	local skipUpdate = false
	for i,v in ipairs(objects) do
		if objects[i].isPlayerBullet == true or objects[i].isEnemyBullet == true then
			local newtempX = objects[i].x + (8.5 * math.cos(objects[i].rot))
			local newtempY = objects[i].y + (8.5 * math.sin(objects[i].rot))
			if isblocking(newtempX, newtempY) then
				objects[i].flagForRemoval = true
				skipUpdate = true
			end
			if collideWithDoorEnemy(newtempX, newtempY) == true then
				objects[i].flagForRemoval = true
				skipUpdate = true
			end
			if skipUpdate == false then
				objects[i].x = newtempX
				objects[i].y = newtempY
			end
		elseif objects[i].isenemy == true then
			-- If is a Baghead Soldier
			if objects[i].thingType == 1 then
				if objects[i].hp >= 1 then
					local curX = objects[i].x
					local curY = objects[i].y
					if collideWithPlayerBullet(objects[i].x, objects[i].y) == true then
						objects[i].hp = objects[i].hp - math.random(4,5)
						if objects[i].hp <= 0 then
							SpawnItem(11, objects[i].x - 2, objects[i].y - 2)
							score = score + 100
							objects[i].spr = sprTable["grunt"]["die1"]
						end
					end
					local newtempX = objects[i].x + (1.5 * math.cos(objects[i].rot))
					local newtempY = objects[i].y + (1.5 * math.sin(objects[i].rot))
					local dx = hero.x - objects[i].x
					local dy = hero.y - objects[i].y
					local dist = math.sqrt(dx*dx + dy*dy)
					if dist > 120 and dist < 420 then
						local angle = math.atan2(dy, dx)
						objects[i].rot = angle
						local tpos = {}
						tpos = checkCollision(objects[i].x, objects[i].y, newtempX, newtempY, 0.35)
						if collideWithDoorEnemy(newtempX, newtempY) == false then
							objects[i].x = tpos.x
							objects[i].y = tpos.y
						else
							objects[i].x = objects[i].x
							objects[i].y = objects[i].y
						end
					elseif dist <= 120 and isblocking(newtempX, newtempY) == false then
						if (objects[i].cooldown >= 35) then
							objects[i].rot = math.atan2(dy, dx)	-- face the player
							A_BulletAttack(1, objects[i].x, objects[i].y, objects[i].rot)
							objects[i].cooldown = 0
						else
							objects[i].cooldown = objects[i].cooldown + 1
						end
					end
				end
			end
			-- If a Bird Soldier
			if objects[i].thingType == 2 then
				if objects[i].hp >= 1 then
					local curX = objects[i].x
					local curY = objects[i].y
					if collideWithPlayerBullet(objects[i].x, objects[i].y) == true then
						objects[i].hp = objects[i].hp - math.random(3,4)
						if objects[i].hp <= 0 then
							SpawnItem(12, objects[i].x - 2, objects[i].y - 2)
							score = score + 200
							objects[i].spr = sprTable["bird"]["die1"]
						end
					end
					local newtempX = objects[i].x + (3 * math.cos(objects[i].rot))
					local newtempY = objects[i].y + (3 * math.sin(objects[i].rot))
					local dx = hero.x - objects[i].x
					local dy = hero.y - objects[i].y
					local dist = math.sqrt(dx*dx + dy*dy)
					if dist > 120 and dist < 440 then
						local angle = math.atan2(dy, dx)
						objects[i].rot = angle
						local tpos = {}
						tpos = checkCollision(objects[i].x, objects[i].y, newtempX, newtempY, 0.35)
						if collideWithDoorEnemy(newtempX, newtempY) == false then
							objects[i].x = tpos.x
							objects[i].y = tpos.y
						else
							objects[i].x = objects[i].x
							objects[i].y = objects[i].y
						end
					elseif dist <= 120 and isblocking(newtempX, newtempY) == false then
						if (objects[i].cooldown >= 25) then
							objects[i].rot = math.atan2(dy, dx)	-- face the player
							A_BulletAttack(1, objects[i].x, objects[i].y, objects[i].rot)
							objects[i].cooldown = 0
						else
							objects[i].cooldown = objects[i].cooldown + 1
						end
					end
				end
			end
		end
		if objects[i].thingType >= 32 and objects[i].thingType <= 37 then
			if objects[i].doorClosed == false then
				if objects[i].eventTimer < 200 and objects[i].eventTimer ~= -1 then
					objects[i].eventTimer = objects[i].eventTimer + 2
				end
				if objects[i].eventTimer >= 200 then
					if collideWithDoorOpenChk(hero.x, hero.y) == false then
						soundTable["doorclose"]:setVolume(0.1)
						soundTable["doorclose"]:stop()
						soundTable["dooropen"]:stop()
						soundTable["doorclose"]:play()
						objects[i].doorClosed = true
						objects[i].eventTimer = -1
					else
						objects[i].eventTimer = 0
					end
				end
			end
		end
		if objects[i].flagForRemoval == true then
			table.remove(objects, i)
		end
		skipUpdate = false
	end
	love.graphics.rectangle("line", exitobj.x, exitobj.y, tileSize, tileSize)
end
