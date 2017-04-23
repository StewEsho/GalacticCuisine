local plate = require "plate"
local player = require "player"
local earth = require "earth"

--levels
local levelManager = require "level"

function love.load()
	--enable physics
	love.physics.setMeter(128)
	world = love.physics.newWorld(0, 9.81*128, true)
	world:setCallbacks(beginContact, endContact, preSolve, postSolve)

	--set resolution etc.
	love.graphics.scale(windowScaleX, windowScaleY)
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.graphics.setBackgroundColor(34, 2, 59)
	love.window.setMode(1280, 720)
	love.window.setTitle("Galactic Cusine || LD38")
	-- love.window.setFullscreen(true)

	levelManager:init("level3")

	--initialize player and earth
	player:init(300, 0 + (32 * levelManager.map.height))
	earth:init(plate.x, plate.y - 50)

	debugText = "DEBUG"
end

function love.update(dt)
	world:update(dt)

	player:run(dt)
	plate:run()
	earth:run()

	debugText = "PLAYER STATE: " .. player.state
end

function love.draw()
	love.graphics.push()

	love.graphics.scale(1, 1)
	love.graphics.translate(-player.x + (love.graphics.getWidth()/3), -player.y +(love.graphics.getHeight() * (2/3)))

	levelManager:draw()
	player:draw()
	plate:draw()
	earth:draw()

	love.graphics.scale(1, 1)
	love.graphics.pop()

	love.graphics.print(debugText, 10, 10)

end

--------------------------------------------------------------------------------
-- Physics Callbacks
--------------------------------------------------------------------------------

function beginContact(f1, f2, col)
	if(f2:getUserData() == "player" and f1:getUserData() == "ground") then
		player.isGrounded = true
	elseif (f2:getUserData() == "earth") then

		if (f1:getUserData() == "ground") then
			player.state = "lose"
		elseif (f1:getUserData() == "goal") then
			player.state = "win"
		end

	end
end

function endContact(f1, f2, col)
	if(f2:getUserData() == "player" and f1:getUserData() == "ground") then
		player.isGrounded = false
	end
end

function preSolve(f1, f2, col)

end

function postSolve(f1, f2, col, normalImp, tangentImp)

end

--------------------------------------------------------------------------------
-- Input Callbacks
--------------------------------------------------------------------------------

function love.keypressed( key )
   if key == "p" then
		 love.window.setFullscreen(not love.window.getFullscreen())
   end
end
