debug = true

function love.load()
  Object = require "classic"
  require "ball"
  require "paddle"
  mball = ball(200, 0)
  mpaddle = paddle()
end

function love.update(dt)
  mball:update(dt)
  mpaddle:update(dt)
end

function love.draw(dt)
  mball:draw(dt)
  mpaddle:draw(dt)
end
