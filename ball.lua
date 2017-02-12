ball = Object:extend()

function ball:new(x, y)
  self.x = 240
  self.y = 50
  self.radius = 10
  self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
  self.shape = love.physics.newCircleShape(self.radius)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.body:setBullet(true)
  self.fixture:setRestitution(1.0)
  self.yMovement = 400
  self.xMovement = 100
end

function ball:update(dt)

end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end
