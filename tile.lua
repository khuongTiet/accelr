tile = Object:extend()

function tile:new(x, y)
    self.x = x
    self.y = y
    self.drawn = true
    self.body = love.physics.newBody(world, self.x, self.y, "static")
    self.shape = love.physics.newRectangleShape(60, 15)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function tile:update(dt)

end

function tile:draw(dt)
  love.graphics.setColor(122, 255, 255)
  love.graphics.rectangle("fill", self.x, self.y, 60, 15)
end

function tile:delete()
  self.drawn = false
  self.x = 1000
  self.y = 1000
end
