powerup = Object:extend()

function powerup:new(x, y)
  self.x = x
  self.y = y
  self.radius = 8
  self.body = love.physics.newBody(world, self.x, self.y, "kinematic")
  self.shape = love.physics.newCircleShape(self.radius)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.body:setBullet(true)
end

function powerup:draw(dt)
  love.graphics.setColor(102, 255, 51)
  love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end
