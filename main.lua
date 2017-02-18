debug = true
Object = require "lib/classic"
function love.load()
  require "src/game"
  math.randomseed(os.time())
  world = love.physics.newWorld(0, 0, true)
  world:setCallbacks(beginContact, endContact)
  engine = game();
  background = love.graphics.newImage("/assets/Background.png")
  tileImage = love.graphics.newImage("/assets/Tile.png")
  sunnyImage = love.graphics.newImage("/assets/sunny.png")
  paddleImage = love.graphics.newImage("/assets/paddle1.png")
  gameStatus = ""
  gameRetry = ""
end

function love.update(dt)
  world:update(dt)
  engine:update(dt)
  if Ball.body:getY() > 840 then
    gameOverNoise:play()
    gameStatus = "ITS OVER BUDDY"
    gameRetry = "Replay?\n(Y / N)"
    Ball.body:setLinearVelocity(0,0)
    if love.keyboard.isDown("y") then
      Ball.body:destroy()
      world:destroy()
      love.load()
    elseif love.keyboard.isDown("n") then
      love.window.close()
      love.event.quit()
    end
  end
end

function love.draw(dt)
  for i = 0, love.graphics.getWidth() / background:getWidth() do
        for j = 0, love.graphics.getHeight() / background:getHeight() do
            love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        end
    end
  game:draw(dt)
end
