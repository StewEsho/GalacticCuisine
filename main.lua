local plate = require "plate"
local player = require "player"
local earth = require "earth"
--levels
local l1 = require "level1"

function love.load(zz)
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*128, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)
	love.graphics.setDefaultFilter('nearest', 'nearest')

	--set resolution etc.
	love.graphics.scale(windowScaleX, windowScaleY)
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	-- love.window.setFullscreen(true)

	--initialize player and earth
	player:init(300, 0)
	earth:init(plate.x-.1, plate.y - 50)

	l1:init()

	debugText = "DEBUG"
end

function love.update(dt)
	world:update(dt)

	player:run(dt)
	plate:run()
	earth:run()

	debugText = "JUMP COOLDOWN: " .. player.currentJumpCooldown
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

	love.graphics.print(debugText, 10, 10)

end

--------------------------------------------------------------------------------
-- Physics Callbacks
--------------------------------------------------------------------------------

function beginContact(f1, f2, col)
	if(f1:getUserData() == "player" and f2:getUserData() == "ground") then
		player.isGrounded = true
	end
end

function endContact(f1, f2, col)
	if(f1:getUserData() == "player" and f2:getUserData() == "ground") then
		player.isGrounded = false
	end
end

function preSolve(f1, f2, col)

end

function postSolve(f1, f2, col, normalImp, tangentImp)

end
