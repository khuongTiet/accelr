debug = true

function love.load()
  Object = require "classic"
  require "game"
  engine = game();
  background = love.graphics.newImage("/assets/Background.png")
  tileImage = love.graphics.newImage("/assets/Tile.png")
  sunnyImage = love.graphics.newImage("/assets/sunny.png")
  paddleImage = love.graphics.newImage("/assets/paddle1.png")
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
