game = Object:extend()

require "collision"
require "ball"
require "paddle"
require "walls"
require "tile"

gameStatus = ""
gameRetry = ""

TileGrid = {}

function game:new()
  world = love.physics.newWorld(0, 0, true)
  world:setCallbacks(beginContact, endContact)
  Paddle = paddle()
  walls = walls()
  gameStart()
end

function game:update(dt)
  world:update(dt)
  paddleCollision(dt)

 setx, sety = Ball.body:getLinearVelocity()
  if love.keyboard.isDown("left") then
    Ball.body:setLinearVelocity(setx - 10, sety)
  elseif love.keyboard.isDown("right") then
    Ball.body:setLinearVelocity(setx + 10, sety)
  elseif love.keyboard.isDown("up") then
    Ball.body:setLinearVelocity(setx, sety - 10)
  end

  Paddle.body:setX(Paddle.body:getX() + Paddle.xMovement * dt)
  deleteTile(TileGrid)
  gameOver()

end

function game:draw(dt)
  love.graphics.setColor(255,255,255,255)
  love.graphics.print(gameStatus, 250, 320 )
  love.graphics.print(gameRetry, 270, 360)
  Ball:draw(dt)
  Paddle:draw(dt)
  for i,j in pairs(TileGrid) do
    j:draw(dt)
  end
end

function gameOver()
  if Ball.body:getY() > 650 then
    gameStatus = "ITS OVER BUDDY"
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
  Ball = ball(240, 200)
  Ball.body:setLinearVelocity(Ball.xMovement, 400)
  for i = 1, 5 do
    for j = 1, 10 do
      table.insert(TileGrid, tile((j - 1) * 61, (i-1) * 16))
    end
  end
end
