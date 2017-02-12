paddle = Object:extend()

function paddle:new()
  self.x = 200
  self.y = 550
  self.xMovement = 100
  self.yMovement = 0
  self.body = love.physics.newBody(world, self.x, self.y, "static")
  self.shape = love.physics.newRectangleShape(self.x, self. y, 80, 10)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function paddle:update(dt)

end

function paddle:draw(dt)
  love.graphics.setColor(51, 102, 255)
  love.graphics.rectangle("fill", self.x, self.y, 80, 10)
end
