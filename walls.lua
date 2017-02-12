walls = Object:extend()

function walls:new()
  topwall = {}
  topwall.body = love.physics.newBody(world, 600, 0, "static")
  topwall.shape = love.physics.newRectangleShape(600, 10)
  topwall.fixture = love.physics.newFixture(topwall.body, topwall.shape)
  topwall.fixture:setFriction(0.0) -- don't slow the ball down

  leftwall = {}
  leftwall.body = love.physics.newBody(world, 0, 600, "static")
  leftwall.shape = love.physics.newRectangleShape(10, 600)
  leftwall.fixture = love.physics.newFixture(leftwall.body, leftwall.shape)
  leftwall.fixture:setFriction(0.0)

  rightwall = {}
  rightwall.body = love.physics.newBody(world, 600, 600, "static")
  rightwall.shape = love.physics.newRectangleShape(600, 600)
  rightwall.fixture = love.physics.newFixture(rightwall.body, rightwall.shape)
  rightwall.fixture:setFriction(0.0)
end
