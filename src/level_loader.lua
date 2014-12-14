local Level = {}

local level_dir
local function level_loader(level_name)
  package_path = package.path
  package.path = level_dir .. '?.lua;' .. package.path
  local level = require(level_name)
  package.path = package_path
  return level
end

Level.init = function(levels_path)
  level_dir = levels_path
  if string.sub(level_dir, -1) ~= '/' then
    level_dir = level_dir .. '/'
  end
end

Level.load = function(level_name)
  local level = level_loader(level_name)
  for row in string.gmatch(level.layout, '%S+') do
  end
  return level
end

return Level
