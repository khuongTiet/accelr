game = Object:extend()

require "src/collision"
require "src/ball"
require "src/paddle"
require "src/walls"
require "src/tile"
require "src/grid"



tileNoise = love.audio.newSource("/assets/tilehit.wav", "static")
paddleNoise = love.audio.newSource("/assets/paddleHit.wav", "static")
wallNoise = love.audio.newSource("/assets/wallHit.wav", "static")
gameOverNoise = love.audio.newSource("/assets/gameOver.wav", "static")
gameStartNoise = love.audio.newSource("/assets/gameStart.wav", "static")
bg = love.audio.newSource("/assets/BackGround.wav", "static")

function game:new()
  Paddle = paddle()
  Walls = walls()
  Ball = ball()
  Grid = grid()
  gameStartNoise:play()
  Ball.body:setLinearVelocity(Ball.xMovement, 450)
end

function game:update(dt)
  Ball:update(dt)
  Paddle:update(dt)
  Grid:update(dt)
  bg:play()
  gameWin()
end

function game:draw(dt)
  love.graphics.setColor(255,255,255,255)
  love.graphics.print(gameStatus, 250, 320 )
  love.graphics.print(gameRetry, 270, 360)
  Ball:draw(dt)
  Paddle:draw(dt)
  Grid:draw(dt)
end

function gameWin()
  if counter == 50 then
    gameStatus = "YOU WIN"
    gameRetry = "Replay?\n(Y / N)"
  end
  if love.keyboard.isDown("y") then
        gameStatus = ""
        gameRetry = ""
  elseif love.keyboard.isDown("n") then
    love.window.close()
    love.event.quit()
  end
end
