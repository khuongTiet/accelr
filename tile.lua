tile = Object:extend()

function tile:new(x, y)
    self.x = x
    self.y = y
    self.body = love.physics.newBody(world, self.x, self.y, "static")
    self.shape = love.physics.newRectangleShape(self.x, self.y, 60, 30)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function tile:update(dt)

end

function tile:draw(dt)
  love.graphics.setColor(122, 255, 255)
  love.graphics.rectangle("fill", self.x, self.y, 60, 30)
end
