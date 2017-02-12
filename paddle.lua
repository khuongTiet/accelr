paddle = Object:extend()

function paddle:new()
  self.x = 200
  self.y = 550
  self.xMovement = 100
  self.yMovement = 0
end

function paddle:update(dt)

end

function paddle:draw(dt)
  love.graphics.setColor(51, 102, 255)
  love.graphics.rectangle("fill", self.x, self.y, 80, 10)
end
