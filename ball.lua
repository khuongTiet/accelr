ball = Object:extend()

function ball:new(x, y)
  self.x = 200
  self.y = 0
  self.movement = 100
end

function ball:update(dt)
  self.y = self.y + self.movement * dt
end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.x, self.y, 10, 100)
end
