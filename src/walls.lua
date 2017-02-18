walls = Object:extend()

function walls:new()
  topwall = {}
  topwall.body = love.physics.newBody(world, 300, 0, "static")
  topwall.shape = love.physics.newRectangleShape(600, 1)
  topwall.fixture = love.physics.newFixture(topwall.body, topwall.shape)
  topwall.fixture:setFriction(0.0) -- don't slow the ball down
  topwall.fixture:setUserData("Wall")

  leftwall = {}
  leftwall.body = love.physics.newBody(world, 0, 400, "static")
  leftwall.shape = love.physics.newRectangleShape(10, 800)
  leftwall.fixture = love.physics.newFixture(leftwall.body, leftwall.shape)
  leftwall.fixture:setFriction(0.0)
  leftwall.fixture:setUserData("Wall")

  rightwall = {}
  rightwall.body = love.physics.newBody(world, 600, 400, "static")
  rightwall.shape = love.physics.newRectangleShape(1, 800)
  rightwall.fixture = love.physics.newFixture(rightwall.body, rightwall.shape)
  rightwall.fixture:setFriction(0.0)
  rightwall.fixture:setUserData("Wall")
end
