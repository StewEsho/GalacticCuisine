local player = {}
local plate = require "plate"

function player:init(x, y)
	player.x = x
	player.y = y

	player.body = love.physics.newBody(world, x, y, "kinematic")
	player.shape = love.physics.newRectangleShape(128, 300)
	player.fixture = love.physics.newFixture(player.body, player.shape, 2)

	plate:init(x+120, y-64)

	plateJoint = love.physics.newRevoluteJoint(plate.body, player.body, plate.x, plate.y, false)
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
end

return player;
