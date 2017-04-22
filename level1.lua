local level1 = {}
local map = require "map1"

function level1:init()
	--background music
	level1.bgm = love.audio.newSource("music/power.wav", "static")
	level1.bgm:setLooping(true)
	level1.bgm:play()

	level1.canvas = love.graphics.newCanvas(1920, 480)

	--ground
	level1.ground = {}
	level1.ground.body = love.physics.newBody(world, 128*map.width, love.graphics.getHeight()+75, "static")
	level1.ground.shape = love.physics.newRectangleShape(256*map.width, 50)
	level1.ground.fixture = love.physics.newFixture(level1.ground.body, level1.ground.shape, 0.05)
	level1.ground.fixture:setUserData("ground")
end

function level1:draw()
	--draw the map
	for j = 1, map.height do
      for i = 1, map.width do
				tileId = map.mapData[j][i]
				love.graphics.draw(map.tiles[tileId].image, 256*(i-1), 256*(j - map.height + 3))
      end
   end

	-- love.graphics.polygon("fill", level1.ground.body:getWorldPoints(level1.ground.shape:getPoints()))

end

return level1;
