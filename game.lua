game = Object:extend()

require "collision"
require "ball"
require "paddle"
require "walls"
require "tile"

gameStatus = ""
gameRetry = ""

function game:new()
  world = love.physics.newWorld(0, 0, true)
  world:setCallbacks(beginContact, endContact)

  Ball = ball(240, 300)
  Paddle = paddle()
  walls = walls()
  TileGrid = {}
  for i = 1, 5 do
    for j = 1, 10 do
      table.insert(TileGrid, tile((j - 1) * 61, (i-1) * 16))
    end
  end
end

function game:update(dt)
  world:update(dt)
  paddleCollision(dt)


  if love.keyboard.isDown("left") then
        Ball.body:setLinearVelocity(-400,0)
  elseif love.keyboard.isDown("right") then
        Ball.body:setLinearVelocity(400,0)
  elseif love.keyboard.isDown("down") and Ball.yMovement > 0 then
        Ball.body:setLinearVelocity(0, 400)
  elseif love.keyboard.isDown("up") then
        Ball.body:setLinearVelocity(0 ,-400)
  end

  Paddle.body:setX(Paddle.body:getX() + Paddle.xMovement * dt)
  deleteTile(TileGrid)
  gameOver(Ball, gameStatus)

end

function game:draw(dt)
  love.graphics.setColor(255,255,255,255)
  love.graphics.print(gameStatus, 230, 320 )
  love.graphics.print(gameRetry, 270, 360)
  Ball:draw(dt)
  Paddle:draw(dt)
  for i,j in ipairs(TileGrid) do
    j:draw(dt)
  end
end

function gameOver()
  if Ball.body:getY() > 650 then
    gameStatus = "ITS OVER SHITHEAD"
    gameRetry = "Replay?\n(Y / N)"
    Ball.body:setLinearVelocity(0,0)
    if love.keyboard.isDown("y") then
          gameStart()
          gameStatus = ""
          gameRetry = ""
    elseif love.keyboard.isDown("n") then
      love.window.close()
    end
  end


end

function gameStart()
  Ball = ball(240, 300)
  TileGrid = {}
  for i = 1, 5 do
    for j = 1, 10 do
      table.insert(TileGrid, tile((j - 1) * 61, (i-1) * 16))
    end
  end
end
