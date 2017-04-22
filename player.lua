local player = {}
local plate = require "plate"
local earth = require "earth"

function player:init(x, y)
	player.x = x
	player.y = y

	player.speed = 500
	player.jumpSpeed = 45
	player.jumpCooldown = 5
	player.currentJumpCooldown = player.jumpCooldown
	player.isGrounded = false

	player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
	player.body:setFixedRotation(true)
	player.shape = love.physics.newRectangleShape(128, 300)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0.05)
	player.fixture:setUserData("player")
	player.fixture:setCategory(1)
	player.fixture:setMask(2)
	player.body:setGravityScale(1)

	plate:init(x+120, y-64)

	plateJoint = love.physics.newRevoluteJoint(plate.body, player.body, plate.x, plate.y, true)
end

function player:run(dt)

	--movement
	if (love.keyboard.isDown("d") or love.keyboard.isDown("right")) then
		player.body:applyForce(player.speed, 0)
	elseif (love.keyboard.isDown("a") or love.keyboard.isDown("left")) then
		player.body:applyForce(-player.speed, 0)
	end

	--jumping
	if (love.keyboard.isDown("space") or love.keyboard.isDown("w") or love.keyboard.isDown("up")) then
		player.body:setGravityScale(1)
		player:jump()
	else
		player.body:setGravityScale(1.5)
		if (player.isGrounded) then
			player.currentJumpCooldown = player.jumpCooldown
		end

	end

	--store position
	player.x = player.body:getX()
	player.y = player.body:getY()
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
end

--------------------------------------------------------------------------------

function player:jump()

	if (player.currentJumpCooldown > 0) then
		player.body:applyLinearImpulse(0, -player.jumpSpeed)
		player.currentJumpCooldown = player.currentJumpCooldown - 1
	end

end

return player;
