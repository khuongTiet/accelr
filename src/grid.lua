grid = Object:extend()
require "src/tile"

function grid:new()
  self.tileGrid = {}
  self.tileMap = {
    {1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1}
  }
  for i = 1, 5 do
    for j = 1, 10 do
      if (self.tileMap[i][j] == 1) then
        table.insert(self.tileGrid, tile((j - 1) * 61, (i-1) * 16))
      end
    end
  end
end

function grid:update(dt)
  for i,j in pairs(self.tileGrid) do
    if j.fixture:getUserData() == "Broken" then
      table.remove(self.tileGrid, i)
      j.body:setActive(false)
      j.body:destroy()
    end
  end
end

function grid:draw(dt)
  for i,j in pairs(self.tileGrid) do
    j:draw(dt)
  end
end
