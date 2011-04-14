	font = love.graphics.newImageFont("data/graphics/confont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
	love.graphics.setFont(font)
	
	-- title pics array
	titlePics = {}
	titlePics[0] = love.graphics.newImage("data/graphics/titlepic.png")
	
	-- Array of wall/ground tiles
	tiles = {}
	for i=1, 172 do
		tiles[i] = love.graphics.newImage("data/tiles/tile"..i..".png")
	end