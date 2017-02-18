ball = Object:extend()

function ball:new()
  self.x = 300
  self.y = 300
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
  setx, sety = Ball.body:getLinearVelocity()
  if love.keyboard.isDown("left") then
   Ball.body:setLinearVelocity(setx - 10, sety)
  elseif love.keyboard.isDown("right") then
   Ball.body:setLinearVelocity(setx + 10, sety)
   -- Implement a boost meter to prevent players from holding down the "up" key
  elseif love.keyboard.isDown("up") then
   if Ball.body:getY() > 600 then
     Ball.body:setLinearVelocity(setx, sety - 10)
     if Ball.body:getY() > 780 then
       Ball.body:setLinearVelocity(setx, sety - 30)
     end
   else
     Ball.body:setLinearVelocity(setx, sety - .5)
   end
  elseif love.keyboard.isDown("down") then
   Ball.body:setLinearVelocity(setx, sety + 900)
   Ball.powerAccel = true
  end

end

function ball:draw(dt)
  love.graphics.draw(sunnyImage, self.body:getX() - self.radius, self.body:getY() - self.radius)
end
