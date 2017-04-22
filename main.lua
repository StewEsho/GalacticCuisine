local plate = require "plate"
local player = require "player"
local earth = require "earth"

function love.load()
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*128, true)
	love.graphics.setDefaultFilter('nearest', 'nearest')

	--set resolution etc.
	love.graphics.scale(windowScaleX, windowScaleY)
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	-- love.window.setFullscreen(true)

	--init ground
	ground = {}
	ground.body = love.physics.newBody(world, love.graphics.getWidth()/2, 690, "static")
	ground.shape = love.physics.newRectangleShape(love.graphics.getWidth()-100, 50)
	ground.fixture = love.physics.newFixture(ground.body, ground.shape, 0.05)

	--background music
	bgm = love.audio.newSource("music/tense.wav", "static")
	bgm:setLooping(true)
	bgm:play()

	--initialize player and earth
	player:init(300, 200)
	earth:init(plate.x, plate.y - 200)
end

function love.update(dt)
	world:update(dt)

	player:run(dt)
	plate:run()
	earth:run()
end

function love.draw()

	player:draw()
	plate:draw()
	earth:draw()

	love.graphics.setColor(50, 255, 100)
	love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints()))

end
