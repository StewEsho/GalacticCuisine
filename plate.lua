local plate = {}

function plate:init(x, y)
	self.x = x
	self.ox = x
	self.y = y
	self.oy = y

	--initiate self bodies
	self.body = love.physics.newBody(world, x, y, "dynamic")
	self.shape = love.physics.newRectangleShape(0, 0, 200, 15)
	self.fixture = love.physics.newFixture(self.body, self.shape, 1.5)

	self.rEdge = {}
	self.rEdge.ox = x+95
	self.rEdge.oy = y-40
	self.rEdge.body = love.physics.newBody(world, self.rEdge.ox, self.rEdge.oy, "dynamic")
	self.rEdge.shape = love.physics.newRectangleShape(10, 80)
	self.rEdge.fixture = love.physics.newFixture(self.rEdge.body, self.rEdge.shape, 0.1)

	self.lEdge = {}
	self.lEdge.ox = x-95
	self.lEdge.oy = y-40
	self.lEdge.body = love.physics.newBody(world, self.lEdge.ox, self.lEdge.oy, "dynamic")
	self.lEdge.shape = love.physics.newRectangleShape(10, 80)
	self.lEdge.fixture = love.physics.newFixture(self.lEdge.body, self.lEdge.shape, 0.1)

	love.physics.newWeldJoint(self.body, self.rEdge.body, self.rEdge.body:getX(), self.rEdge.body:getY(), true)
	love.physics.newWeldJoint(self.body, self.lEdge.body, self.lEdge.body:getX(), self.lEdge.body:getY(), true)

	self.fixture:setCategory(2)
	self.rEdge.fixture:setCategory(2)
	self.lEdge.fixture:setCategory(2)
	self.fixture:setUserData("self")
	self.rEdge.fixture:setUserData("self")
	self.lEdge.fixture:setUserData("self")
	self.body:setGravityScale(1)

	--speed variables
	self.forceSpeed = 10000
end

function plate:run()
	if(love.keyboard.isDown("q")) then
		self.body:applyTorque(-self.forceSpeed)
	elseif (love.keyboard.isDown("e")) then
		self.body:applyTorque(self.forceSpeed)
	end
end

function plate:draw()
	love.graphics.setColor(200, 200, 200, 255)
	love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
	love.graphics.polygon("fill", self.rEdge.body:getWorldPoints(self.rEdge.shape:getPoints()))
	love.graphics.polygon("fill", self.lEdge.body:getWorldPoints(self.lEdge.shape:getPoints()))
end

return plate;
