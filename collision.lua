require "UI"

function ballCollision(dt)
    -- Collision for walls
  if Ball.y + Ball.radius <= 20 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for paddle
  elseif Ball.y + Ball.radius >= Paddle.y and Ball.x >= Paddle.x and Ball.x <= Paddle.x + 80 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for tiles
  elseif Ball.y + Ball.radius >= 600 then
    gameOver = UI()
  end
  for i = 1, 5 do
    for j = 1, 10 do
      if Ball.y + Ball.radius >= TileGrid[i][j].y and Ball.x + Ball.radius >= TileGrid[i][j].x and Ball.x + Ball.radius <= TileGrid[i][j].x + 80 and
         Ball.y + Ball.radius <= TileGrid[i][j].y + 25 then
           Ball.yMovement = Ball.yMovement * -1
           TileGrid[i][j]:delete()

      elseif Ball.x + Ball.radius <= TileGrid[i][j].x + 80 and Ball.y + Ball.radius >= TileGrid[i][j].y and Ball.y + Ball.radius <= TileGrid[i][j].y + 25 and
                  Ball.x + Ball.radius >= TileGrid[i][j].x then
                    Ball.xMovement = Ball.xMovement * -1
                    TileGrid[i][j]:delete()
      end
    end

  end

  if Ball.x + Ball.radius >= 600 then
    Ball.xMovement = Ball.xMovement * -1
  elseif Ball.x + Ball.radius <= 20 then
    Ball.xMovement = Ball.xMovement * -1
  end
end

function paddleCollision(dt)
  if Paddle.body:getX() + 40 >= 600 or Paddle.body:getX() - 40 <= 0 then
    Paddle.xMovement = Paddle.xMovement * -1
  end
end
