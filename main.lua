-- loading function
function love.load()

	require("sprites.lua")	-- all sprites are stored here
	
	require("audio.lua")	-- all audio sources are stored here

	require("player.lua")	-- player (hero) table
	
	require("gfxinfo.lua")	-- graphics
	
	require("tempmaps.lua")	-- temporary map holding tables and variables
	
	require("misc.lua")		-- other stuff that doesn't fit elsewhere
	
	loadMapsFromFiles()		-- load the maps from files and store them in the array
end

require("mapload.lua")		-- loadMapsFromFiles() is found here.

-- logic functions
function love.update(dt)
	-- if starting a game, initialize the first map
	if initialize == true then
		initializeFirstMap()
	elseif inActualGame == true and intermission == false and isPaused == false then
		if objectsSpawned == false then
			spawnObjects()
			objectsSpawned = true
		end
		movePlayer(dt)
		updateObjs()
		checkIfPlayerAlive()
	elseif inActualGame == false and intermission == false then
		checkForStartButton()
	end
	if inActualGame == true then
		checkPauseKey()
	end
end

-- drawing functions
function love.draw()
	if inActualGame == false then
		drawTitleScreen()
	elseif inActualGame == true and intermission == false then
		drawMiniMap()
		drawObjs()
		love.graphics.draw(hero.spr, hero.x - scrollOffsetX, hero.y - scrollOffsetY, hero.rot, sprScale, sprScale, 32, 32)
		drawHud()
		drawMessage()
	end
	if isPaused == true then
		drawPauseMsg()
	end
end

require("drawing.lua")	-- all drawing functions

require("ai.lua")	-- all AI/movement functions

require("input.lua")	-- all player movement/input functions

require("collides.lua")	-- collision detection functions

require("actionfs.lua")	-- action functions

require("mapio.lua")	-- non-loading map functions for taking maps and turning them into objects/tilemaps