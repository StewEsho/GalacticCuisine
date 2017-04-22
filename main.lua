local plate = require "plate"
local player = require "player"
local earth = require "earth"
--levels
local l1 = require "level1"

function love.load(zz)
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*128, true)
	love.graphics.setDefaultFilter('nearest', 'nearest')

	--set resolution etc.
	love.graphics.scale(windowScaleX, windowScaleY)
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	-- love.window.setFullscreen(true)

	--initialize player and earth
	player:init(300, 200)
	earth:init(plate.x-.1, plate.y - 50)

	l1:init()
end

function love.update(dt)
	world:update(dt)

	player:run(dt)
	plate:run()
	earth:run()
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(-player.x + (love.graphics.getWidth()/3), -player.y -128 + (love.graphics.getHeight()* (8/9)))

	player:draw()
	plate:draw()
	earth:draw()

	love.graphics.setColor(50, 255, 100)
	l1:draw()

	love.graphics.pop()

end
