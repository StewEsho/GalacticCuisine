local level = {}

--Load in spritesheetrs
local newQuad = love.graphics.newQuad
local tileQuads = {}

--initialize level manager
function level:init(name)

	level.tiles = {}

	level.map = require ("levels/" .. name)
	level.spritesheet = love.graphics.newImage("art/" .. name .."/platforms.png")

	level:loadQuads()

	level:loadmap()
end

--draw out map
function level:draw()
	love.graphics.setColor(255, 255, 255)
	for i = 1, table.getn(level.tiles) do
		for j = 1, level.map.width do
			if (level.tiles[i][j] ~= nil) then

				local indexedTile = level.tiles[i][j]
				love.graphics.draw(level.spritesheet, indexedTile.q, indexedTile.x, indexedTile.y)

			end
		end
	end
end
---------------------------------------
---------------------------------------

function level:loadmap()
	for i = 1, level.map.height do
		level.tiles[i] = {}
	end

	for layer = 1, #level.map.layers do
		local mapData = level.map.layers[layer].data
		local prop = level.map.layers[layer].properties

		--play bgm music
		if (prop["bgm"] ~= nil) then
			level.bgm = love.audio.newSource(prop["bgm"], "stream")
			level.bgm:setLooping(true)
			if(not level.bgm:isPlaying()) then
				level.bgm:play()
			end
		end

		for y = 1, level.map.height do

			local n = 0 --number of solid tiles in a row

			for x = 1, level.map.width do

				local index = x + (level.map.width * (y-1))

				if ( mapData[index] ~= 0 ) then
					local quad = tileQuads[mapData[index]]
					level.tiles[y][x] = level:tile(64*(x), 64*(y), 64, 64, quad)
					local t = level.tiles[y][x]

					--create physics bodies for solid tiles
					if(level.map.tilesets[1].tiles[mapData[index]].properties["isSolid"] == true) then
						n = n + 1

						-- if (level.tiles[y][x-n] ~= nil and level.tiles[y][x-n].body ~= nil) then
						-- 	level.tiles[y][x-n].shape = love.physics.newRectangleShape(64 * n, 64)
						-- 	level.tiles[y][x-n].fixture = love.physics.newFixture(level.tiles[y][x-n].body, level.tiles[y][x-n].shape)
						-- 	level.tiles[y][x-n].fixture:setUserData("ground")
						-- else

							t.body = love.physics.newBody(world, t.x+32, t.y+32, "static")
							t.shape = love.physics.newRectangleShape(63, 64)
							t.fixture = love.physics.newFixture(t.body, t.shape)
							t.fixture:setCategory(level.map.tilesets[1].tiles[mapData[index]].properties["category"])
							t.fixture:setUserData(level.map.tilesets[1].tiles[mapData[index]].properties["userData"])

							if (t.fixture:getUserData() == "goal") then
								t.fixture:setSensor(true)
							end
						-- end
					else

						n = 0

					end
				end


			end
		end
	end
end

function level:tile(x, y, w, h, quad)
	local tile = {}

	tile.x = x
	tile.y = y
	tile.w = w
	tile.h = h
	tile.q = quad

	return tile
end

function level:loadQuads()
	local tilesheet = level.map.tilesets[1]
	local sheetX = tilesheet.imagewidth / tilesheet.tilewidth
	local sheetY = tilesheet.imageheight / tilesheet.tileheight

	for y = 1, sheetY do
		for x = 1, sheetX do
			local i = x + (sheetX * (y-1))
			tileQuads[i] = newQuad(
				tilesheet.tilewidth * (x-1),
				tilesheet.tileheight * (y-1),
				tilesheet.tilewidth,
				tilesheet.tileheight,
				tilesheet.imagewidth,
				tilesheet.imageheight
			)
		end
	end
end

return level;
