-- initialize the first map
function initializeFirstMap()
	currmapnum = 1
	currentmap = maps[currmapnum]
	currentobjmap = objmaps[currmapnum]
	mapWidth = table.getn(currentmap[1])
	mapHeight = table.getn(currentmap)
	plyrPosX = 0
	plyrPosY = 0
	playerSpawned = false
	initialize = false
	inActualGame = true
end

function checkIfPlayerAlive()
	if hero.alive == false then
		respawnHeroTime = respawnHeroTime - 1
		checkForRespawn()
	end
end

function checkForRespawn()
	if respawnHeroTime == 0 then
		objects = {}
		currentmap = maps[currmapnum]
		currentobjmap = objmaps[currmapnum]
		playerSpawned = false	-- set this so the player can spawn again
		mapWidth = table.getn(currentmap[1])
		mapHeight = table.getn(currentmap)
		objectsSpawned = false
		hero.x = pRespawnPoint.x
		hero.y = pRespawnPoint.y
		hero.keys = {false, false}
		hero.alive = true
		hero.hp = 100
		hero.lives = hero.lives - 1
		hero.weaponSelected = 1
		hero.hasWeapon = {true, false, false, false, false}
		hero.hasAmmo = {0, 0, 0, 0, 0}
		respawnHeroTime = 75
	end
end