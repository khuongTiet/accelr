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
  if a:getUserData() == "Tile" then
    tileNoise:play()
  elseif b:getUserData() == "Tile" then
    tileNoise:play()
  end

  if a:getUserData() == "Paddle" then
    paddleNoise:play()
  elseif b:getUserData() == "Paddle" then
    paddleNoise:play()
  end

  if a:getUserData() == "Wall" then
    wallNoise:play()
  elseif b:getUserData() == "Wall" then
    wallNoise:play()
  end

end

function endContact(a, b, coll)
  if a:getUserData() == "Tile" then
    a:setUserData("Broken")
  elseif b:getUserData() == "Tile" then
    b:setUserData("Broken")
  end

  if a:getUserData() == "Ball" and b:getUserData() == "Ball" then
    print("Two balls")
  end

end
