local Spring = {}
Spring.__index = Spring

local ITERATIONS = 8

function Spring.new(mass, force, damping, speed)
	local self = setmetatable({}, Spring)

	self.Target = Vector3.new()
	self.Position = Vector3.new()
	self.Velocity = Vector3.new()

	self.Mass = mass or 5
	self.Force = force or 50
	self.Damping = damping or 4
	self.Speed = speed or 4

	return self
end

function Spring:GetStats()
	return self.Mass, self.Force, self.Damping, self.Speed
end

function Spring:ChangeStats(mass, force, damping, speed)
	self.Mass = mass or self.Mass
	self.Force = force or self.Force
	self.Damping = damping or self.Damping
	self.Speed = speed or self.Speed
end

function Spring:Shove(force)
	local x, y, z = force.X, force.Y, force.Z

	-- Ensure values are valid numbers
	self.Velocity = self.Velocity
		+ Vector3.new(
			math.abs(x) == math.huge and 0 or (x == x and x or 0),
			math.abs(y) == math.huge and 0 or (y == y and y or 0),
			math.abs(z) == math.huge and 0 or (z == z and z or 0)
		)
end

function Spring:Update(dt)
	local scaledDeltaTime = dt * self.Speed / ITERATIONS

	for _ = 1, ITERATIONS do
		local iterationForce = self.Target - self.Position
		local acceleration = (iterationForce * self.Force) / self.Mass

		acceleration = acceleration - self.Velocity * self.Damping

		self.Velocity = self.Velocity + acceleration * scaledDeltaTime
		self.Position = self.Position + self.Velocity * scaledDeltaTime
	end

	return self.Position
end

return Spring
