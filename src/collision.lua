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

end
