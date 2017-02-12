ball = Object:extend()

function ball:new(x, y)
  self.x = 240
  self.y = 50
  self.radius = 10
  self.yMovement = 200
  self.xMovement = 100
  shape = love.physics.newCircleShape(360, 50, 20)
end

function ball:update(dt)
  

end

function ball:draw(dt)
  love.graphics.setColor(255, 51, 204)
  love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end
