function ballCollision(dt)
    -- Collision for walls
  if Ball.y + Ball.radius >= 600 or Ball.y + Ball.radius <= 20 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for paddle
  elseif Ball.y + Ball.radius >= Paddle.y and Ball.x >= Paddle.x and Ball.x <= Paddle.x + 80 then
    Ball.yMovement = Ball.yMovement * -1
    -- Collision for tiles
  end
  for i = 1, 5 do
    for j = 1, 10 do
      yCollide = Ball.y + Ball.radius
      xCollide = Ball.x + Ball.radius
      tileXLeft = TileGrid[i][j].x
      tileXRight = TileGrid[i][j].x + 70
      tileYUp = TileGrid[i][j].y
      tileYDown = TileGrid[i][j].y + 40

      -- Top Left->right
      if yCollide >= tileYUp and xCollide >= tileXLeft and xCollide <= tileXRight and Ball.yMovement > 0 and Ball.xMovement > 0 then
           Ball.yMovement = Ball.yMovement * -1
           TileGrid[i][j]:delete()

      -- Top Right ->left
       elseif yCollide >= tileYUp and xCollide >= tileXLeft and xCollide <= tileXRight and Ball.yMovement > 0 and Ball.xMovement < 0 then
            Ball.yMovement = Ball.yMovement * -1
            TileGrid[i][j]:delete()

      -- Bottom Left ->right
    elseif yCollide <= tileYDown and xCollide <= tileXRight and xCollide >= tileXLeft and Ball.yMovement < 0 and Ball.xMovement > 0 then
             Ball.yMovement = Ball.yMovement * -1
             TileGrid[i][j]:delete()

      -- Bottom right ->left
    elseif yCollide <= tileYDown and xCollide <= tileXRight and xCollide >= tileXLeft and Ball.yMovement < 0 and Ball.xMovement < 0 then
            Ball.yMovement = Ball.yMovement * -1
            TileGrid[i][j]:delete()

        -- Right bottom -> up
      elseif xCollide <= tileXRight and yCollide >= tileYUp and yCollide <= tileYDown and Ball.xMovement < 0 and Ball.yMovement < 0 then
                    Ball.xMovement = Ball.xMovement * -1
                    TileGrid[i][j]:delete()
        -- Right up->bottom
      elseif xCollide <= tileXRight and yCollide >= tileYUp and yCollide <= tileYDown and Ball.xMovement < 0 and Ball.yMovement > 0 then
                    Ball.xMovement = Ball.xMovement * -1
                    TileGrid[i][j]:delete()

        -- Left up->bottom
      elseif xCollide >= tileXLeft and yCollide >= tileYUp and yCollide <= tileYDown and Ball.xMovement > 0 and Ball.yMovement > 0 then
               Ball.xMovement = Ball.xMovement * -1
               TileGrid[i][j]:delete()

        -- Left bottom -> up
       elseif xCollide >= tileXLeft and yCollide >= tileYUp and yCollide <= tileYDown and Ball.xMovement > 0 and Ball.yMovement < 0 then
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
  if Paddle.x + 80 >= 600 or Paddle.x <= 0 then
    Paddle.xMovement = Paddle.xMovement * -1
  end
end
