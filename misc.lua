	-- game status variables
	initialize = false		-- if this is true, we need to initialize the game
	inActualGame = false	-- are we actually playing or not
	intermission = false	-- in an intermission area
	isPaused = false		-- are we paused? (Stops all logic)
	gameOver = false		-- if this is true, clean up game to start fresh
	objectsSpawned = false
	
	pickupMsg = ""
	prevPickupMsg = ""
	pickupMsgTime = 0
	pickupMsgMaxTime = 80
	
	tileSize = 64
	sprScale = 1
	scrollOffsetX = 0
	scrollOffsetY = 0
	
	ex = 0
	why = 0
	enemyhit = 0