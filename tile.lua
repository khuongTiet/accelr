tile = Object:extend()

function tile:new()
    self.x = 30
    self.y = 100
end

function tile:update(dt)

end

function tile:draw(dt)
  love.graphics.setColor(122, 255, 255)
  love.graphics.rectangle("fill", self.x, self.y, 60, 30)
end
