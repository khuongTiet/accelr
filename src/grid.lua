grid = Object:extend()
require "src/tile"

function grid:new()
  self.tileGrid = {}
  for i = 1, 5 do
    for j = 1, 10 do
      table.insert(self.tileGrid, tile((j - 1) * 61, (i-1) * 16))
    end
  end
end

function grid:update(dt)

end

function grid:draw(dt)
  for i,j in pairs(self.tileGrid) do
    j:draw(dt)
  end
end

function grid:delete()
  for i,j in pairs(self.tileGrid) do
    j = nil
  end
end

function grid:deleteTile()
  for i,j in pairs(self.tileGrid) do
    if j.fixture:getUserData() == "Broken" then
      table.remove(self.tileGrid, i)
      j.body:setActive(false)
      j.body:destroy()
    end
  end
end
