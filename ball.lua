ball = Object:extend()

function ball:new(x, y)
  self.x = 240
  self.y = 50
  self.radius = 10
  self.yMovement = 200
  self.xMovement = 100
end

function ball:update(dt)
  if self.y + self.radius >= 600 then
    self.yMovement = self.yMovement * -1
  elseif self.y + self.radius <= 20 then
    self.yMovement = self.yMovement * -1
  end

  if self.x + self.radius >= 480 then
    self.xMovement = self.xMovement * -1
  elseif self.x + self.radius <= 20 then
    self.xMovement = self.xMovement * -1
  end

  self.y = self.y + self.yMovement * dt
  self.x = self.x + self.xMovement * dt

end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end
