local Level = {}

local LEVELS_PATH

local function level_loader(level_name)
  package_path = package.path
  package.path = LEVELS_PATH .. '?.lua;' .. package.path
  local level = require(level_name)
  package.path = package_path
  return level
end

local function get_rows(layout)
  return string.gmatch(layout, '%S+%s?%S+')
end

Level.init = function(levels_path)
  LEVELS_PATH = levels_path
  if string.sub(LEVELS_PATH, -1) ~= '/' then
    LEVELS_PATH = LEVELS_PATH .. '/'
  end
end

Level.load = function(level_name)
  local level = level_loader(level_name)
  for row in get_rows(level.layout) do
  end
  return level
end

-- Expose privates for testing
if describe then
  Level._level_loader = level_loader
  Level._get_rows = get_rows
end

return Level
