paddle = Object:extend()

function paddle:new()
  self.x = 300
  self.y = 550
  randomizer = math.random(-300, 300)
  self.xMovement = 100
  if randomizer < 0 then
    self.xMovement = self.xMovement * -1
  end
  self.yMovement = 0
  self.body = love.physics.newBody(world, self.x, self.y, "static")
  self.shape = love.physics.newRectangleShape(80, 10)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.fixture:setRestitution(0)
  self.fixture:setUserData("Paddle")
end

function paddle:update(dt)
  Paddle.body:setX(Paddle.body:getX() + Paddle.xMovement * dt)
end

function paddle:draw(dt)
  love.graphics.draw(paddleImage, self.body:getX() - 40, self.body:getY() - 5)
end
