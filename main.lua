debug = true

function love.load()
  Object = require "classic"
  require "game"
  engine = game();

end

function love.update(dt)
  game:update(dt)
end

function love.draw(dt)
  game:draw(dt)
end
