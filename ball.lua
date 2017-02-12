ball = Object:extend()
math.randomseed(os.time())
function ball:new(x, y)
  self.x = x
  self.y = y
  self.radius = 10
  self.yMovement = 400
  self.xMovement = math.random(-300, 300)
  self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
  self.shape = love.physics.newCircleShape(self.radius)
  self.fixture = love.physics.newFixture(self.body, self.shape)
  self.body:setBullet(true)
  self.fixture:setRestitution(1.0)
end

function ball:update(dt)


end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius(), 100)
end
