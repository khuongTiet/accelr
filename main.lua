debug = true

function love.load()
  Object = require "classic"
  require "game"
  engine = game();
  background = love.graphics.newImage("Background.png")
  tileImage = love.graphics.newImage("Tile.png")
end

function love.update(dt)
  game:update(dt)
end

function love.draw(dt)
  for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
  game:draw(dt)
end
