local player = {}
local plate = require "plate"
local earth = require "earth"
require("AnAL")

function player:init(x, y)
	player.x = x
	player.ox = x
	player.y = y
	player.oy = y

	player.speed = 500
	player.jumpSpeed = 70
	player.jumpCooldown = 5
	player.currentJumpCooldown = 0
	player.isGrounded = false
	player.state = "playing"
	player.resetCooldown = 10

	player.spritesheet = love.graphics.newImage("art/player.png")
	player.animation = newAnimation(player.spritesheet, 128, 300, 0.2, 0)

	player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
	player.body:setFixedRotation(true)
	player.shape = love.physics.newRectangleShape(128, 300)
	player.fixture = love.physics.newFixture(player.body, player.shape, 0.05)

	player.fixture:setUserData("player")
	player.fixture:setCategory(1)
	player.fixture:setMask(2)

	player.body:setGravityScale(1)
	player.fixture:setFriction(0.3)

	plate:init(x+120, y-64)
	earth:init(plate.x, plate.y - 50)

	plateJoint = love.physics.newRevoluteJoint(plate.body, player.body, plate.x, plate.y, true)
end

function player:run(dt)
	if (player.state ~= "resetting") then
		--movement
		if (love.keyboard.isDown("d") or love.keyboard.isDown("right")) and player.body:getLinearVelocity() < player.speed then
			player.body:applyForce(player.speed, 0)
		elseif (love.keyboard.isDown("a") or love.keyboard.isDown("left")) and player.body:getLinearVelocity() > -player.speed then
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

	else
		player.resetCooldown = player.resetCooldown - 1
		if player.resetCooldown < 0 then
			player.resetCooldown = 10
			player.state = "playing"
		end
	end

	player.animation:update(dt)
end

function player:draw()
	love.graphics.setColor(255, 255, 255)

	love.graphics.draw(love.graphics.newImage("art/playerhand.png"), player.x - 15, player.y - 80)
	player.animation:draw(player.x-64, player.y-150)
end

--------------------------------------------------------------------------------

function player:jump()

	if (player.currentJumpCooldown > 0) then
		player.body:applyLinearImpulse(0, -player.jumpSpeed)
		player.currentJumpCooldown = player.currentJumpCooldown - 1
	end

end

function player:reset()
	player.state = "resetting"

	player.body:setAwake(false)
	earth.body:setAwake(false)
	plate.body:setAwake(false)

	plate.body:setAngle(0)
	plate.body:setLinearVelocity(0, 0)
	plate.rEdge.body:setAngle(0)
	plate.rEdge.body:setLinearVelocity(0, 0)
	plate.lEdge.body:setAngle(0)
	plate.lEdge.body:setLinearVelocity(0, 0)
	plate.x = plate.ox
	plate.y = plate.oy

	player.body:setPosition(player.ox, player.oy)
	player.body:setLinearVelocity(0, 0)
	player.x = player.ox
	player.y = player.oy

	earth.body:setPosition(earth.ox, earth.oy)
	earth.body:setLinearVelocity(0, 0)
	earth.x = earth.ox
	earth.y = earth.oy

	player.body:setAwake(true)
	earth.body:setAwake(true)
	plate.body:setAwake(true)

end

return player;
