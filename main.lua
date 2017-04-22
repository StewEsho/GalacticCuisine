local plate = require "plate"

function love.load()
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*256, true)

	--set resolution etc.
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	love.window.setFullscreen(true)
end

function love.update(dt)
	-- body...
end

function love.draw()
	-- body...

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.rectangle("fill", 480, 20, 64, 256)
end
