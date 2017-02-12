ball = Object:extend()

function ball:new(x, y)
  self.x = x
  self.y = y
  self.radius = 10
  self.yMovement = 400
  self.xMovement = 100
end

function ball:update(dt)


end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end
