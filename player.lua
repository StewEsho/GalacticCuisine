local player = {}
local plate = require "plate"
local earth = require "earth"

function player:init(x, y)
	player.x = x
	player.y = y

	player.speed = 500

	player.body = love.physics.newBody(world, x, y, "dynamic")
	player.body:setFixedRotation(true)
	player.shape = love.physics.newRectangleShape(128, 300)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0.05)
	player.fixture:setCategory(1)
	player.fixture:setMask(2)
	player.body:setGravityScale(1)

	plate:init(x+120, y-64)

	plateJoint = love.physics.newRevoluteJoint(plate.body, player.body, plate.x, plate.y, true)
end

function player:run(dt)

	if (love.keyboard.isDown("d") or love.keyboard.isDown("right")) then
		player.body:applyForce(player.speed, 0)
	elseif (love.keyboard.isDown("a") or love.keyboard.isDown("left")) then
		player.body:applyForce(-player.speed, 0)
	end

	player.x = player.body:getX()
	player.y = player.body:getY()
end

function player:draw()


	player.x = player.body:getX()
	player.y = player.body:getY()

	love.graphics.setColor(255, 255, 255)
	love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
end

function player:getX()
	return player.x
end

function player:getY()
	return player.y
end

return player;
