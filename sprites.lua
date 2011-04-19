	-- Sprite Tables
	sprTable = {}
	-- Sprite Tables for Players
	playerSprTable = {}
	playerSprTable["norm"] = love.graphics.newImage("data/sprites/morri_a.png")
	playerSprTable["fire"] = love.graphics.newImage("data/sprites/morri_b.png")

	-- Grunt Sprite Table
	gruntSprTable = {}
	gruntSprTable["norm"] = love.graphics.newImage("data/sprites/grunt_a.png")
	gruntSprTable["fire"] = love.graphics.newImage("data/sprites/grunt_b.png")
	gruntSprTable["die1"] = love.graphics.newImage("data/sprites/grunt_c.png")
	gruntSprTable["die2"] = love.graphics.newImage("data/sprites/grunt_d.png")
	gruntSprTable["die3"] = love.graphics.newImage("data/sprites/grunt_e.png")
	
	-- Bird Sprite Table
	birdSprTable = {}
	birdSprTable["norm"] = love.graphics.newImage("data/sprites/bird_a.png")
	birdSprTable["fire"] = love.graphics.newImage("data/sprites/bird_b.png")
	birdSprTable["die1"] = love.graphics.newImage("data/sprites/bird_c.png")
	birdSprTable["die2"] = love.graphics.newImage("data/sprites/bird_d.png")
	birdSprTable["die3"] = love.graphics.newImage("data/sprites/bird_e.png")

	-- Bullet for Pistol/Submachine/Chaingun
	bulletSprTable = {}
	bulletSprTable["norm"] = love.graphics.newImage("data/sprites/bullet_c.png")

	healthSprTable = {}
	healthSprTable["norm"] = love.graphics.newImage("data/sprites/hkit_a.png")
	
	health2SprTable = {}
	health2SprTable["norm"] = love.graphics.newImage("data/sprites/hkit_b.png")
	
	scoreItemATable = {}
	scoreItemATable["norm"] = love.graphics.newImage("data/sprites/score_a.png")
	
	scoreItemBTable = {}
	scoreItemBTable["norm"] = love.graphics.newImage("data/sprites/score_b.png")
	
	scoreItemCTable = {}
	scoreItemCTable["norm"] = love.graphics.newImage("data/sprites/score_c.png")
	
	scoreItemDTable = {}
	scoreItemDTable["norm"] = love.graphics.newImage("data/sprites/score_d.png")

	-- Pickup for submachine gun
	gunOnePickupTable = {}
	gunOnePickupTable["norm"] = love.graphics.newImage("data/sprites/gun_b.png")
	
	gunTwoPickupTable = {}
	gunTwoPickupTable["norm"] = love.graphics.newImage("data/sprites/gun_c.png")
	
	gunThreePickupTable = {}
	gunThreePickupTable["norm"] = love.graphics.newImage("data/sprites/gun_d.png")
	
	gunFourPickupTable = {}
	gunFourPickupTable["norm"] = love.graphics.newImage("data/sprites/gun_e.png")
	
	ammoOnePickupTable = {}
	ammoOnePickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_b.png")
	
	ammoTwoPickupTable = {}
	ammoTwoPickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_c.png")
	
	ammoThreePickupTable = {}
	ammoThreePickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_d.png")
	
	ammoFourPickupTable = {}
	ammoFourPickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_e.png")
	
	oneUpPickupTable = {}
	oneUpPickupTable["norm"] = love.graphics.newImage("data/sprites/1up_a.png")
	
	doorHzTable = {}
	doorHzTable["norm"] = love.graphics.newImage("data/sprites/door1_a.png")
	
	doorVtTable = {}
	doorVtTable["norm"] = love.graphics.newImage("data/sprites/door1_b.png")
	
	doorBlueHzTable = {}
	doorBlueHzTable["norm"] = love.graphics.newImage("data/sprites/door2_a.png")
	
	doorBlueVtTable = {}
	doorBlueVtTable["norm"] = love.graphics.newImage("data/sprites/door2_b.png")
	
	doorRedHzTable = {}
	doorRedHzTable["norm"] = love.graphics.newImage("data/sprites/door3_a.png")
	
	doorRedVtTable = {}
	doorRedVtTable["norm"] = love.graphics.newImage("data/sprites/door3_b.png")
	
	keyRedTable = {}
	keyRedTable["norm"] = love.graphics.newImage("data/sprites/key_a.png")
	
	keyBlueTable = {}
	keyBlueTable["norm"] = love.graphics.newImage("data/sprites/key_b.png")

	-- add to the main table
	sprTable["grunt"] = gruntSprTable
	sprTable["bird"] = birdSprTable
	sprTable["player"] = playerSprTable
	sprTable["bullet"] = bulletSprTable
	sprTable["gun1"] = gunOnePickupTable
	sprTable["gun2"] = gunTwoPickupTable
	sprTable["gun3"] = gunThreePickupTable
	sprTable["gun4"] = gunFourPickupTable
	sprTable["ammo1"] = ammoOnePickupTable
	sprTable["ammo2"] = ammoTwoPickupTable
	sprTable["ammo3"] = ammoThreePickupTable
	sprTable["ammo4"] = ammoFourPickupTable
	sprTable["health"] = healthSprTable
	sprTable["bighealth"] = health2SprTable
	sprTable["oneup"] = oneUpPickupTable
	sprTable["scorea"] = scoreItemATable
	sprTable["scoreb"] = scoreItemBTable
	sprTable["scorec"] = scoreItemCTable
	sprTable["scored"] = scoreItemDTable
	sprTable["doornhz"] = doorHzTable
	sprTable["doornvt"] = doorVtTable
	sprTable["doorbhz"] = doorBlueHzTable
	sprTable["doorbvt"] = doorBlueVtTable
	sprTable["doorrhz"] = doorRedHzTable
	sprTable["doorrvt"] = doorRedVtTable
	sprTable["redkey"] = keyRedTable
	sprTable["blukey"] = keyBlueTable
	
	-- clean up our temporary tables
	playerSprTable = {}
	gruntSprTable = {}
	birdSprTable = {}
	bulletSprTable = {}
	healthSprTable = {}
	health2SprTable = {}
	scoreItemATable = {}
	scoreItemBTable = {}
	scoreItemCTable = {}
	scoreItemDTable = {}
	gunOnePickupTable = {}
	gunTwoPickupTable = {}
	gunThreePickupTable = {}
	gunFourPickupTable = {}
	ammoOnePickupTable = {}
	ammoTwoPickupTable = {}
	ammoThreePickupTable = {}
	ammoFourPickupTable = {}
	oneUpPickupTable = {}
	doorHzTable = {}
	doorVtTable = {}
	doorBlueHzTable = {}
	doorBlueVtTable = {}
	doorRedHzTable = {}
	doorRedVtTable = {}
	keyRed = {}
	keyBlue = {}

	-- sprite state index table
	sprStateTable = {"norm", "fire", "die1", "die2", "die3"}