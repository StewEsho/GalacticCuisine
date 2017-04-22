plate = {}

function plate:init(x, y)
	plate.x = x
	plate.y = y

	plate.body = love.physics.newBody(world, 30, 30, "dynamic")

end

return plate;
