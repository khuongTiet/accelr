tile = Object:extend()

function tile:new(x, y)
    self.x = x
    self.y = y
    self.drawn = true
end

function tile:update(dt)

end

function tile:draw(dt)
  love.graphics.setColor(122, 255, 255)
  love.graphics.rectangle("fill", self.x, self.y, 60, 15)
end
