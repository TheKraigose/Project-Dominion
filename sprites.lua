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
	
	ammoOnePickupTable = {}
	ammoOnePickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_b.png")
	
	ammoTwoPickupTable = {}
	ammoTwoPickupTable["norm"] = love.graphics.newImage("data/sprites/ammo_c.png")
	
	oneUpPickupTable = {}
	oneUpPickupTable["norm"] = love.graphics.newImage("data/sprites/1up_a.png")

	-- add to the main table
	sprTable["grunt"] = gruntSprTable
	sprTable["bird"] = birdSprTable
	sprTable["player"] = playerSprTable
	sprTable["bullet"] = bulletSprTable
	sprTable["gun1"] = gunOnePickupTable
	sprTable["gun2"] = gunTwoPickupTable
	sprTable["ammo1"] = ammoOnePickupTable
	sprTable["ammo2"] = ammoTwoPickupTable
	sprTable["health"] = healthSprTable
	sprTable["oneup"] = oneUpPickupTable
	sprTable["scorea"] = scoreItemATable
	sprTable["scoreb"] = scoreItemBTable
	sprTable["scorec"] = scoreItemCTable
	sprTable["scored"] = scoreItemDTable
	
	-- clean up our temporary tables
	playerSprTable = {}
	gruntSprTable = {}
	birdSprTable = {}
	bulletSprTable = {}
	healthSprTable = {}
	scoreItemATable = {}
	scoreItemBTable = {}
	scoreItemCTable = {}
	scoreItemDTable = {}
	gunOnePickupTable = {}
	gunTwoPickupTable = {}
	ammoOnePickupTable = {}
	ammoTwoPickupTable = {}
	oneUpPickupTable = {}

	-- sprite state index table
	sprStateTable = {"norm", "fire", "die1", "die2", "die3"}