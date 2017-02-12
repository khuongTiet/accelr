require "UI"
math.randomseed(os.time())
function paddleCollision(dt)
  if Paddle.body:getX() + 40 >= 600 or Paddle.body:getX() - 40 <= 0 then
    Paddle.xMovement = Paddle.xMovement * -1 * math.random(.5 , 2)
  end
  if Paddle.body:getX() > 650 or Paddle.body:getX() < 0 then
    accel = 1
    if Paddle.body:getX() < 0 then
      accel = -1
    end
    Paddle.body:setX(200)
    Paddle.xMovement = 400 * -accel
  end
end

function beginContact(a, b, coll)
  tileNoise:play()
end

function endContact(a, b, coll)
  if a:getUserData() == "Tile" then
    a:setUserData("Broken")
    if a.hasPowerUp then
      a.PowerUp.body:setLinearVelocity(0, 400)
    end
  elseif b:getUserData() == "Tile" then
    b:setUserData("Broken")
    if b.hasPowerUp then
      b.PowerUp.body:setLinearVelocity(0, 400)
    end
  end
end

function deleteTile(Grid)
  for i,j in pairs(Grid) do
    if j.fixture:getUserData() == "Broken" then
      table.remove(Grid, i)
      j.body:setActive(false)
    end
  end
end
