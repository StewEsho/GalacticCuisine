local plate = {}

function plate:init(x, y)
	plate.x = x
	plate.ox = x
	plate.y = y
	plate.oy = y

	--initiate plate bodies
	plate.body = love.physics.newBody(world, x, y, "dynamic")
	plate.shape = love.physics.newRectangleShape(0, 0, 200, 15)
	plate.fixture = love.physics.newFixture(plate.body, plate.shape, 1.5)

	plate.rEdge = {}
	plate.rEdge.body = love.physics.newBody(world, x+95, y-40, "dynamic")
	plate.rEdge.shape = love.physics.newRectangleShape(10, 80)
	plate.rEdge.fixture = love.physics.newFixture(plate.rEdge.body, plate.rEdge.shape, 0.1)

	plate.lEdge = {}
	plate.lEdge.body = love.physics.newBody(world, x-95, y-40, "dynamic")
	plate.lEdge.shape = love.physics.newRectangleShape(10, 80)
	plate.lEdge.fixture = love.physics.newFixture(plate.lEdge.body, plate.lEdge.shape, 0.1)

	love.physics.newWeldJoint(plate.body, plate.rEdge.body, plate.rEdge.body:getX(), plate.rEdge.body:getY(), true)
	love.physics.newWeldJoint(plate.body, plate.lEdge.body, plate.lEdge.body:getX(), plate.lEdge.body:getY(), true)

	plate.fixture:setCategory(2)
	plate.rEdge.fixture:setCategory(2)
	plate.lEdge.fixture:setCategory(2)
	plate.fixture:setUserData("plate")
	plate.rEdge.fixture:setUserData("plate")
	plate.lEdge.fixture:setUserData("plate")
	plate.body:setGravityScale(1)

	--speed variables
	plate.forceSpeed = 10000
end

function plate:run()
	if(love.keyboard.isDown("q")) then
		plate.body:applyTorque(-plate.forceSpeed)
	elseif (love.keyboard.isDown("e")) then
		plate.body:applyTorque(plate.forceSpeed)
	end
end

function plate:draw()
	love.graphics.setColor(200, 200, 200, 255)
	love.graphics.polygon("fill", plate.body:getWorldPoints(plate.shape:getPoints()))
	love.graphics.polygon("fill", plate.rEdge.body:getWorldPoints(plate.rEdge.shape:getPoints()))
	love.graphics.polygon("fill", plate.lEdge.body:getWorldPoints(plate.lEdge.shape:getPoints()))
end

return plate;
