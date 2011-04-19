	score = 0
	
	hero = {} -- New Table for the player
	hero.x = 0
	hero.y = 0
	hero.weaponSelected = 1
	hero.hasWeapon = {true, false, false, false, false}
	hero.hasAmmo = {0, 0, 0, 0, 0}	-- hmmm...
	hero.lives = 3
	hero.hp = 100
	hero.speed = 100
	hero.rot = 0
	hero.alive = true
	hero.sprIndex = 1
	hero.spr = {}
	hero.spr = sprTable["player"][sprStateTable[hero.sprIndex]]
	hero.touchingDoor = false
	hero.keys = {false, false}
	firedpistol = false
	firedsubmac = false
	firedchain = false
	firedmaple = false
	firedrocket = false
	smacrefirecount = 0
	cgunrefirecount = 0
	mgunrefirecount = 0
	rgunrefirecount = 0
	
	respawnHeroTime = 75
	pauseCooldown = 60
	openDoorCooldown = 30
	
	-- speed modifiers
	shiftSpeed = 4
	regularSpeed = 2
	curSpeed = regularSpeed
	rotShiftSpeed = 8
	rotRegSpeed = 6
	rotSpeed = rotRegSpeed
	oneeightycooldown = 30