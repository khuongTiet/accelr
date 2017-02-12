require "UI"

function paddleCollision(dt)
  if Paddle.body:getX() + 40 >= 600 or Paddle.body:getX() - 40 <= 0 then
    Paddle.xMovement = Paddle.xMovement * -1
  end
end

function beginContact(a, b, coll)

end

function endContact(a, b, coll)
  if a:getUserData() == "Tile" then
    a:setUserData("Broken")
  elseif b:getUserData() == "Tile" then
    b:setUserData("Broken")
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
