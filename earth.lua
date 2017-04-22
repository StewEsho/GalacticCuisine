local earth = {}

function earth:init(x, y)
	earth.x = x
	earth.y = y

	earth.body = love.physics.newBody(world, x, y, "dynamic")
	earth.shape = love.physics.newCircleShape(16)
	earth.fixture = love.physics.newFixture(earth.body, earth.shape, .5)
	earth.fixture:setCategory(2)
end

function earth:run()
	-- body --
end

function earth:draw()
	love.graphics.setColor(50, 200, 255, 255)
	love.graphics.circle("fill", earth.body:getX(), earth.body:getY(), earth.shape:getRadius())
end

return earth;
