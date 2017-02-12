game = Object:extend()

require "collision"

function game:new()
  require "ball"
  require "paddle"
  require "tile"

  Ball = ball(240, 300)
  Paddle = paddle()
  TileGrid = {}
  for i = 1, 5 do
    TileGrid[i] = {}
    for j = 1, 10 do
      TileGrid[i][j] = tile((j - 1) * 61, (i-1) * 16)
    end
  end



end

function game:update(dt)
  ballCollision(dt)
  paddleCollision(dt)
  Ball:update(dt)
  Paddle:update(dt)
  for i = 1, 5 do
    for j = 1, 10 do
      TileGrid[i][j]:update(dt)
    end
  end

  if love.keyboard.isDown("left") then
        Ball.xMovement = Ball.xMovement -200 * dt
  elseif love.keyboard.isDown("right") then
        Ball.xMovement = Ball.xMovement + 200 * dt
  elseif love.keyboard.isDown("down") and Ball.yMovement > 0 then
        Ball.yMovement = 1000
  end

  Ball.y = Ball.y + Ball.yMovement * dt
  Ball.x = Ball.x + Ball.xMovement * dt
  Paddle.x = Paddle.x + Paddle.xMovement * dt
end

function game:draw(dt)
  Ball:draw(dt)
  Paddle:draw(dt)
  for i = 1, 5 do
    for j = 1, 10 do
      if TileGrid[i][j].drawn == true then
        TileGrid[i][j]:draw(dt)
      end
    end
  end
end
