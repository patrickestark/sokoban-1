local Level = require 'src.level_loader'

local level

function love.load()
  Level.init('assets/levels/')
  level = Level.load('level1')
  print(level.title)
end
