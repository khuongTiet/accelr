game = Object:extend()

require "collision"

function game:new()
  require "ball"
  require "paddle"
  require "tile"
  require "walls"

  world = love.physics.newWorld(0, 0, true)

  Ball = ball(240, 300)
  Paddle = paddle()
  walls = walls()
  TileGrid = {}
  for i = 1, 5 do
    TileGrid[i] = {}
    for j = 1, 10 do
      TileGrid[i][j] = tile((j - 1) * 61, (i-1) * 16)
    end
  end
end

function game:update(dt)
  world:update(dt)
  paddleCollision(dt)
  for i = 1, 5 do
    for j = 1, 10 do
      TileGrid[i][j]:update(dt)
    end
  end

  if love.keyboard.isDown("left") then
        Ball.body:setLinearVelocity(-400,0)
  elseif love.keyboard.isDown("right") then
        Ball.body:setLinearVelocity(400,0)
  elseif love.keyboard.isDown("down") and Ball.yMovement > 0 then
        Ball.body:setLinearVelocity(0, 200)
  elseif love.keyboard.isDown("up") then
        Ball.body:setLinearVelocity(0 ,-400)
  end

  Paddle.body:setX(Paddle.body:getX() + Paddle.xMovement * dt)

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
