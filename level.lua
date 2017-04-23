local level = {}

--Load in spritesheetrs
local quad = love.graphics.newQuad
local platformQuads = {
	quad(0, 0, 64, 64, 192, 192),
	quad(64, 0, 64, 64, 192, 192),
	quad(128, 0, 64, 64, 192, 192),
	quad(0, 64, 64, 64, 192, 192),
	quad(64, 64, 64, 64, 192, 192),
	quad(128, 64, 64, 64, 192, 192),
	quad(0, 128, 64, 64, 192, 192),
	quad(64, 128, 64, 64, 192, 192),
	quad(128, 128, 64, 64, 192, 192)
}

--initialize level manager
function level:init(name)

	level.tiles = {}

	if (name == "map2") then
		level.map = require "levels/level2"
		level.spritesheet = love.graphics.newImage("art/level2/platforms.png")
	end

	level:loadmap()
end

--draw out map
function level:draw()

	for i = 1, table.getn(level.tiles) do
		for j = 1, table.getn(level.tiles[i]) do
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
		local prop = level.map.layers[properties]

		for y = 1, level.map.height do
			for x = 1, level.map.width do

				local index = x + (level.map.width * (y-1))
				print(mapData[index])

				if ( mapData[index] ~= 0 ) then
					local quad = platformQuads[mapData[index]]
					level.tiles[y][x] = level:tile(64*(x), 64*(y), 64, 64, quad)
					local t = level.tiles[y][x]

					if(mapData[index] ~= 4 and mapData[index] ~= 5 and mapData[index] ~= 6) then
						t.body = love.physics.newBody(world, t.x+32, t.y+32, "static")
						t.shape = love.physics.newRectangleShape(64, 64)
						t.fixture = love.physics.newFixture(t.body, t.shape)
						t.fixture:setUserData("ground")
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

return level;
