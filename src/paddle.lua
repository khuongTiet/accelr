paddle = Object:extend()

function paddle:new()
  self.x = 300
  self.y = 750
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
  -- Could move this into the collision with endContact
  self.body:setX(self.body:getX() + self.xMovement * dt)
  if self.body:getX() + 40 >= 600 or self.body:getX() - 40 <= 0 then
    self.xMovement = self.xMovement * -1
    if randomizer < 0 then
      self.xMovement = self.xMovement * math.random(.5 , 2)
    end
  end
  if self.body:getX() > 650 or self.body:getX() < 0 then
    accel = 1
    if self.body:getX() < 0 then
      accel = -1
    end
    self.body:setX(200)
    self.xMovement = 400 * -accel
  end
end

function paddle:draw(dt)
  love.graphics.draw(paddleImage, self.body:getX() - 40, self.body:getY() - 5)
end
