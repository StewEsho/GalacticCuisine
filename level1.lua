local level1 = {}

function level1:init()
	--background music
	level1.bgm = love.audio.newSource("music/tense.wav", "static")
	level1.bgm:setLooping(true)
	level1.bgm:play()

	--ground
	level1.ground = {}
	level1.ground.body = love.physics.newBody(world, love.graphics.getWidth()/2, love.graphics.getHeight(), "static")
	level1.ground.shape = love.physics.newRectangleShape(3*love.graphics.getWidth(), 50)
	level1.ground.fixture = love.physics.newFixture(level1.ground.body, level1.ground.shape, 0.05)
end

function level1:draw()
	love.graphics.polygon("fill", level1.ground.body:getWorldPoints(level1.ground.shape:getPoints()))
end

return level1;
