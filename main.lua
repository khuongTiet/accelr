function love.load()
  Object = require "classic"
  require "ball"
  mball = ball(200, 0)
end

function love.update(dt)
  mball:update(dt)
end

function love.draw(dt)
  mball:draw(dt)
end
