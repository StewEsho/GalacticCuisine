local plate = require "plate"
local player = require "player"

function love.load()
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*256, true)

	--set resolution etc.
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	love.window.setFullscreen(true)

	--initialize plate
	player:init(300, 200)
end

function love.update(dt)
	world:update(dt)

	plate:run()
end

function love.draw()

	player:draw()
	plate:draw()

end
