local plate = require "plate"
local player = require "player"
local earth = require "earth"

--levels
local levelManager = require "level"
game = {}

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
	love.window.setFullscreen(true)

	game.state = "menu"
	game.map = "level3"
	game.titlecards = {
		great = love.graphics.newImage("art/great.png"),
		uhoh = love.graphics.newImage("art/uhoh.png")
	}

	game.menu = {
		buttons = {
			{
				label = "Shortstop",
				mapName = "level2"
			},
			{
				label = "Plains",
				mapName = "level3"
			},
		},
		img = love.graphics.newImage("art/button.png"),
		title = love.graphics.newImage("art/title.png"),
		controls = love.graphics.newImage("art/controls.png"),
		font = love.graphics.newFont("font/slkscr.ttf", 32)
	}

	love.graphics.setFont(game.menu.font)
end

function love.update(dt)
	if (game.state == "initLevel") then
		levelManager:init(game.map)

		--initialize player and earth
		player:init(300, 0 + (32 * levelManager.map.height))

		debugText = "DEBUG"
		game.state = "level"
	elseif (game.state == "level") then
		world:update(dt)

		player:run(dt)
		plate:run()
		earth:run()
	elseif (game.state == "resettingLevel") then
		game:reset()
	end

end

function love.draw()

	if (game.state == "level" or game.state == "resettingLevel") then
		love.graphics.push()

		love.graphics.scale(1, 1)
		love.graphics.translate(-player.x + (love.graphics.getWidth()/3), -player.y +(love.graphics.getHeight() * (2/3)))

		levelManager:draw()
		player:draw()
		plate:draw()
		earth:draw()

		love.graphics.scale(1, 1)
		love.graphics.pop()

		love.graphics.setColor(255, 255, 255)
		if(player.state == "win") then
			love.graphics.draw(game.titlecards.great, (love.graphics.getWidth() - 960)/2, 15 )
		elseif(player.state == "lose") then
			love.graphics.draw(game.titlecards.uhoh, (love.graphics.getWidth() - 960)/2, 15 )
		end

		-- love.graphics.print(debugText, 10, 10)
	end

	if (game.state == "menu") then
		for i = 1, #game.menu.buttons do
			love.graphics.draw(game.menu.img, (love.graphics.getWidth() - 360)/2, 180 + ((i-1) * 80))
			love.graphics.print(game.menu.buttons[i].label, (love.graphics.getWidth() - (22 * game.menu.buttons[i].label:len()))/2, 190 + ((i-1) * 80))
		end

		love.graphics.draw(game.menu.title, (love.graphics.getWidth() - 960)/2, 15)
		love.graphics.draw(game.menu.controls, 15, love.graphics.getHeight() - 255)
	end

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
	elseif key == "r" then
		if (player.state == "lose") then
			game.state = "resettingLevel"
		elseif (player.state == "win") then
			game.state = "menu"
		end
	end
end

function game:reset()
	player:reset()
	levelManager:kill()
	game.state = "initLevel"
end
