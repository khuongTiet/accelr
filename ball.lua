ball = Object:extend()
math.randomseed(os.time())
function ball:new(x, y)
  self.x = x
  self.y = y
  self.radius = 10
  self.yMovement = 400
  self.xMovement = math.random(-300, 300)
  self.powerAccel = false
  self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
  self.shape = love.physics.newCircleShape(self.radius)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.body:setBullet(true)
  self.fixture:setRestitution(1.0)
  self.fixture:setUserData("Ball")
end

function ball:update(dt)


end

function ball:draw(dt)
  love.graphics.draw(sunnyImage, self.body:getX() - self.radius, self.body:getY() - self.radius)
end
