	-- map information tables
	maps = {}					-- store maps here
	map = {}					-- temporary map holding place
	mapColors = {}				-- map colors
	objmaps = {}				-- objects per map
	objmap = {}					-- temporary objects per map
	currentmap = {}				-- current, active map
	currentobjmap = {}			-- current object map
	currmapnum = 0				-- index of current map. >= 0 means none.
	totalNumOfMaps = 3			-- total amount of maps. This should not change.
	mapWidth = 0				-- for calculating bounds
	mapHeight = 0				-- for calculating bounds
	
	pRespawnPoint = {}
	
	objects = {}				-- objects other than player
	objmap = {}
	objecttemp = {}				-- temporary object for populating
	objecttemp.x = 0
	objecttemp.y = 0
	objecttemp.rot = 0			-- rotation
	objecttemp.hp = 1			-- shots to kill
	objecttemp.thingType = 0			-- type
	objecttemp.sprIndex = 0
	objecttemp.isPlayerBullet = false	-- can harm enemy
	objecttemp.isEnemyBullet = false	-- can harm you
	objecttemp.isenemy = false	-- if is an enemy?
	objecttemp.isboss = false	-- if killing the object exits level?
	objecttemp.ismoving = false	-- if the enemy is allowed to move?
	objecttemp.spr = nil		-- sprites for object (total of 8 per object allowed)
	objecttemp.flagForRemoval = false
	objecttemp.doorClosed = false
	objecttemp.eventTimer = -1
	
	exitobj = {}
	exitobj.x = -128
	exitobj.y = -128