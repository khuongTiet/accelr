game = Object:extend()

function game:new()
  require "ball"
  require "paddle"
  require "tile"

  Ball = ball(240, 300)
  Paddle = paddle()
  TileGrid = {}
  for i = 1, 3 do
    TileGrid[i] = {}
    for j = 1, 5 do
      TileGrid[i][j] = tile(j * 70, i * 45)
    end
  end



end

function game:update(dt)
  ballCollision(dt)
  paddleCollision(dt)
  Ball:update(dt)
  Paddle:update(dt)
  for i = 1, 3 do
    for j = 1, 5 do
      TileGrid[i][j]:update(dt)
    end
  end

  if love.keyboard.isDown("left") then
        Ball.x = Ball.x - 100 * dt
    elseif love.keyboard.isDown("right") then
        Ball.x = Ball.x + 100 * dt
    elseif love.keyboard.isDown("up") then
        Ball.y = Ball.y - 100 * dt
    elseif love.keyboard.isDown("down") then
        Ball.y = Ball.y + 100 * dt
    else
      Ball.y = Ball.y + Ball.yMovement * dt
      Ball.x = Ball.x + Ball.xMovement * dt
    end
    Paddle.x = Paddle.x + Paddle.xMovement * dt
end

function game:draw(dt)
  Ball:draw(dt)
  Paddle:draw(dt)
  for i = 1, 3 do
    for j = 1, 5 do
      if TileGrid[i][j].drawn == true then
        TileGrid[i][j]:draw(dt)
      end
    end
  end
end

function ballCollision(dt)
    -- Collision for walls
  if Ball.y + Ball.radius >= 600 or Ball.y + Ball.radius <= 20 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for paddle
  elseif Ball.y + Ball.radius >= Paddle.y and Ball.x >= Paddle.x and Ball.x <= Paddle.x + 80 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for tiles
  end
  for i = 1, 3 do
    for j = 1, 5 do
      if Ball.y + Ball.radius >= TileGrid[i][j].y and Ball.x + Ball.radius >= TileGrid[i][j].x and Ball.x + Ball.radius <= TileGrid[i][j].x + 80 and
         Ball.y + Ball.radius <= TileGrid[i][j].y + 25 then
           Ball.yMovement = Ball.yMovement * -1
           TileGrid[i][j].drawn = false
           TileGrid[i][j].x = 1000
           TileGrid[i][j].y = 1000
      elseif Ball.x + Ball.radius <= TileGrid[i][j].x + 80 and Ball.y + Ball.radius >= TileGrid[i][j].y and Ball.y + Ball.radius <= TileGrid[i][j].y + 25 and
                  Ball.x + Ball.radius >= TileGrid[i][j].x then
                    Ball.xMovement = Ball.xMovement * -1
                    TileGrid[i][j].drawn = false
                    TileGrid[i][j].x = 1000
                    TileGrid[i][j].y = 1000
      end
    end

  end

  if Ball.x + Ball.radius >= 480 then
    Ball.xMovement = Ball.xMovement * -1
  elseif Ball.x + Ball.radius <= 20 then
    Ball.xMovement = Ball.xMovement * -1
  end
end

function paddleCollision(dt)
  if Paddle.x + 200 >= 600 or Paddle.x <= 0 then
    Paddle.xMovement = Paddle.xMovement * -1
  end
end

function topTileCollision(dt)

end
