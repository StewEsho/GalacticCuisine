local level1 = {}
local map = require "map1"

function level1:init()
	--background music
	level1.bgm = love.audio.newSource("music/power.wav", "static")
	level1.bgm:setLooping(true)
	level1.bgm:play()

	--ground
	level1.ground = {}
	level1.ground.body = love.physics.newBody(world, 0, love.graphics.getHeight(), "static")
	level1.ground.shape = love.physics.newRectangleShape(30*love.graphics.getWidth(), 50)
	level1.ground.fixture = love.physics.newFixture(level1.ground.body, level1.ground.shape, 0.05)
	level1.ground.fixture:setUserData("ground")
end

function level1:draw()
	--draw the map
	for j = 1, 4 do
      for i = 1, (36/256)*love.graphics.getWidth() do
         love.graphics.draw(map.tiles[1].image, (i*256) - 18*love.graphics.getWidth(), (j*256)-512)
      end
   end

	love.graphics.polygon("fill", level1.ground.body:getWorldPoints(level1.ground.shape:getPoints()))

end

return level1;
